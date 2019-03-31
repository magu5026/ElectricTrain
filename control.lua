require("lib")

local anz_train = 0
local anz_provider = 0


function CallRemoteInterface()
	if remote.interfaces["FuelTrainStop"] then
		remote.call("FuelTrainStop", "exclude_from_fuel_schedule", "et-electric-locomotive-1")
		remote.call("FuelTrainStop", "exclude_from_fuel_schedule", "et-electric-locomotive-2")
		remote.call("FuelTrainStop", "exclude_from_fuel_schedule", "et-electric-locomotive-3")
	end
end

function ON_INIT()
	global = {}
	global.TrainList = {}
	global.ProviderList = {}
	
	CallRemoteInterface()
end
script.on_init(ON_INIT)

function ON_LOAD()
	anz_train = Count(global.TrainList)
	anz_provider = Count(global.ProviderList)
	
	CallRemoteInterface()
end
script.on_load(ON_LOAD)

function ON_CONFIGURATION_CHANGED(data)
	CallRemoteInterface()

	local mod_name = "ElectricTrain"
	if IsModChanged(data,mod_name) then
		if data.mod_changes[mod_name].old_version == "0.17.201" or GetOldVersion(data,mod_name) < "00.17.05" then
			OnInit()
			for _,surface in pairs(game.surfaces) do
				local trains = surface.find_entities_filtered{type="locomotive"}
				for _,train in pairs(trains) do
					if train.name:match("^et%-electric%-locomotive%-%d$") then
						table.insert(global.TrainList,train)
						train.burner.currently_burning = game.item_prototypes['et-electric-locomotive-fuel']
						train.burner.remaining_burning_fuel = train.burner.currently_burning.fuel_value
					end
				end	
				local providers = surface.find_entities_filtered{type="electric-energy-interface"}
				for _,provider in pairs(providers) do
					if provider.name == "et-electricity-provider" then
						table.insert(global.ProviderList,provider)
					end
				end	
			end
			anz_train = Count(global.TrainList)
			anz_provider = Count(global.ProviderList)
		end
	end
end
script.on_configuration_changed(ON_CONFIGURATION_CHANGED)

--error(global.FuelValue)
function ON_BUILT_ENTITY(event)
	local entity = event.created_entity or event.entity
	if entity and entity.valid then
		if entity.name == "et-electricity-provider" and entity.type == "electric-energy-interface" then
			table.insert(global.ProviderList,entity)
			anz_provider = anz_provider + 1
		elseif entity.type == "locomotive" then
			if entity.name:match("^et%-electric%-locomotive%-%d$") or entity.name:match("^et%-electric%-locomotive%-%d-mu$") then 
			table.insert(global.TrainList,entity)
			entity.burner.currently_burning = game.item_prototypes['et-electric-locomotive-fuel']
			entity.burner.remaining_burning_fuel = entity.burner.currently_burning.fuel_value
			anz_train = anz_train + 1
			end
		end
	end
end
script.on_event({defines.events.on_built_entity,defines.events.on_robot_built_entity,defines.events.script_raised_built},ON_BUILT_ENTITY)


local is_fuel_removed = false

function ON_TICK()
	if anz_provider > 0 and anz_train > 0 then
		local need_power = 0
		local provider_power = 0
		local rest_power = 0
		local split_power = 0
		
		for i,provider in pairs(global.ProviderList) do
			if provider and provider.valid then
				provider_power = provider_power + provider.energy
			else
				global.ProviderList[i] = nil
				anz_provider = anz_provider - 1
			end
		end
			
		if provider_power > 0 then 
			for i,train in pairs(global.TrainList) do
				if train and train.valid then
					if is_fuel_removed then
						train.burner.currently_burning = game.item_prototypes['et-electric-locomotive-fuel']
						train.burner.remaining_burning_fuel = train.burner.currently_burning.fuel_value
					end
					need_power = need_power + train.burner.currently_burning.fuel_value - train.burner.remaining_burning_fuel		
				else
					global.TrainList[i] = nil				
					anz_train = anz_train - 1
				end
			end
			is_fuel_removed = false
		
			rest_power = provider_power - need_power
			if rest_power >= 0 then
				for _,train in pairs(global.TrainList) do
					if train and train.valid then
						train.burner.remaining_burning_fuel = train.burner.currently_burning.fuel_value
					else
						global.TrainList[i] = nil				
						anz_train = anz_train - 1
					end
				end
				split_power = rest_power / anz_provider
				for _,provider in pairs(global.ProviderList) do
					if provider and provider.valid then
						provider.energy = split_power
					else
						global.ProviderList[i] = nil
						anz_provider = anz_provider - 1
					end
				end
			else
				for _,provider in pairs(global.ProviderList) do
					if provider and provider.valid then
						provider.energy = 0
					else
						global.ProviderList[i] = nil
						anz_provider = anz_provider - 1
					end
				end
				split_power = provider_power / anz_train
				for i,train in pairs(global.TrainList) do
					if train and train.valid then	
						train.burner.remaining_burning_fuel = train.burner.remaining_burning_fuel + split_power
					else
						global.TrainList[i] = nil				
						anz_train = anz_train - 1
					end
				end
			end
		end
	else
		if anz_train > 0 and anz_provider == 0 and not is_fuel_removed then
			RemoveTrainFuel()
		end
	end
end
script.on_event(defines.events.on_tick,ON_TICK)

function RemoveTrainFuel()
	for i,train in pairs(global.TrainList) do
		if train and train.valid then
			train.burner.currently_burning = nil
		else
			global.TrainList[i] = nil
		end
	end
	is_fuel_removed = true
end