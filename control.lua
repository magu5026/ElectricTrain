require("lib")

local anzLoc = 0
local anzControl = 0


function CallRemoteInterface()
	if remote.interfaces["FuelTrainStop"] then
		remote.call("FuelTrainStop", "exclude_from_fuel_schedule", "et-electric-locomotive-1")
		remote.call("FuelTrainStop", "exclude_from_fuel_schedule", "et-electric-locomotive-2")
		remote.call("FuelTrainStop", "exclude_from_fuel_schedule", "et-electric-locomotive-3")
	end
end

function Init()
	global = {}
	global.LocList = {}
	global.ControlList = {}	
end

function Load()
	CallRemoteInterface()

	anzLoc = table.count(global.LocList)
	anzControl = table.count(global.ControlList)
end

function Reinitialize()
	global = global or {}
	global.LocList = global.LocList or {}
	global.ControlList = global.ControlList or {}
	
	Load()
end

function OnInit()
	Init()
	Load()
end
script.on_init(OnInit)

function OnLoad()
	Load()
end
script.on_load(OnLoad)

function OnConfigurationChanged(data)
	local modName = "ElectricTrain"
	if not IsModChanged(data,modName) then
		Load()
	else
		Reinitialize()
		if IsModChanged(data,modName) then
			if not (GetOldVersion(data,modName) < "00.17.27") then
				Init()

				for _,force in pairs(game.forces) do
					local tech = force.technologies['et-electric-railway']
					if tech and tech.researched then 
						force.recipes['et-control-station-1'].enabled = true
						force.recipes['et-current-collector'].enabled = true
					end
				end
				
				for _,surface in pairs(game.surfaces) do
					local trains = surface.find_entities_filtered{type="locomotive"}
					for _,train in pairs(trains) do
						if train.name:match("^et%-electric%-locomotive%-%d$") or train.name:match("^et%-electric%-locomotive%-%d%-mu$") then
							table.insert(global.LocList,{entity=train,provider=nil})
							train.burner.currently_burning = game.item_prototypes['et-electric-locomotive-fuel']
						end
					end	
				end
				
				anzLoc = table.count(global.LocList)
				
				for _,surface in pairs(game.surfaces) do
					local controls = surface.find_entities_filtered{type="electric-energy-interface"}
					for _,control in pairs(controls) do
						if control.name:match("^et%-control%-station%-%d$") then
							table.insert(global.ControlList,control)
						end
						if control.name:match("^et%-electric%-locomotive%-%d%-power$") or control.name:match("^et%-electric%-locomotive%-%d%-mu-power$") then
							control.destroy()
						end
					end	
				end
				
				anzControl = table.count(global.ControlList)
			end
		end
	end
end
script.on_configuration_changed(OnConfigurationChanged)

function OnBuiltEntity(event)
	local entity = event.created_entity or event.entity
	if entity and entity.valid then
		if entity.name:match("^et%-control%-station%-%d$") then
			table.insert(global.ControlList,entity)
			anzControl = anzControl + 1
		elseif entity.type == "locomotive" then
			if entity.name:match("^et%-electric%-locomotive%-%d$") or entity.name:match("^et%-electric%-locomotive%-%d%-mu$") then 
			table.insert(global.LocList,{entity=entity,provider=nil})
			entity.burner.currently_burning = game.item_prototypes['et-electric-locomotive-fuel']
			anzLoc = anzLoc + 1
			end
		end
	end
end
script.on_event({defines.events.on_built_entity,defines.events.on_robot_built_entity,defines.events.script_raised_built},OnBuiltEntity)

function OnRemoveEntity(event)
	local entity = event.entity
	if entity and entity.valid then
		if entity.name:match("^et%-control%-station%-%d$") then		
			for i,control in pairs(global.ControlList) do
				if control == entity then
					for _,loc in pairs(global.LocList) do
						if loc.provider and loc.provider.valid then
							loc.provider.destroy()
						end
						loc.provider = nil
					end
					table.remove(global.ControlList,i)
					anzControl = anzControl - 1
					break
				end
			end
		elseif entity.type == "locomotive" then
			if entity.name:match("^et%-electric%-locomotive%-%d$") or entity.name:match("^et%-electric%-locomotive%-%d%-mu$") then 
				for i,loc in pairs(global.LocList) do
					if loc.entity == entity then
						if loc.provider and loc.provider.valid then
							loc.provider.destroy()
						end
						table.remove(global.LocList,i)
						anzLoc = anzLoc - 1
						break
					end
				end
			end
		end
	end
end
script.on_event({defines.events.on_pre_player_mined_item,defines.events.on_robot_pre_mined,defines.events.on_entity_died,defines.events.script_raised_destroy},OnRemoveEntity)

function CreateProvider(loc)
	local control = global.ControlList[1]
	local pos = control.position
	local surface = control.surface
	local force = control.force
	local entity = surface.create_entity{name=loc.entity.name.."-power",position=pos,force=force}
	loc.provider = entity
end

function RemoveLoc(i)
	if global.LocList[i] then
		if global.LocList[i].entity and global.LocList[i].entity.valid then
			global.LocList[i].entity.destroy()
		end
		if global.LocList[i].provider and global.LocList[i].provider.valid then
			global.LocList[i].provider.destroy()
		end
	end
	table.remove(global.LocList,i)
end

function OnTick()
	if anzLoc > 0 and anzControl > 0 then
		for i,loc in pairs(global.LocList) do
			if loc and loc.entity and loc.entity.valid then
				if not (loc.provider and loc.provider.valid) then
					CreateProvider(loc)
				else	
					needPower = loc.entity.burner.currently_burning.fuel_value - loc.entity.burner.remaining_burning_fuel
					
					restPower = loc.provider.energy - needPower
					if restPower > 0 then
						loc.entity.burner.remaining_burning_fuel = loc.entity.burner.currently_burning.fuel_value
						loc.provider.energy = loc.provider.energy - needPower
					else
						loc.entity.burner.remaining_burning_fuel = loc.entity.burner.remaining_burning_fuel + loc.provider.energy
						loc.provider.energy = 0
					end
				end
			else
				RemoveLoc(i)
			end
		end
	end
end
--script.on_event(defines.events.on_tick,OnTick)
script.on_nth_tick(2,OnTick)