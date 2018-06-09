require("help_functions")
TrainEntityList = {"electric-locomotive","electric-locomotive-mk2","electric-locomotive-mk3"}

	
local function ONLOAD()
	global.TrainList = global.TrainList or {}
	global.ProviderList = global.ProviderList or {}
end


local function ONTICK()
	local TrainPower = 0
	local ProviderPower = 0
	local RestPower = 0
	local SplitPower = 0
	for _,train in pairs(global.TrainList) do
		TrainPower = TrainPower + ((train.prototype.max_energy_usage + 1) - train.energy)
	end
	for _,provider in pairs(global.ProviderList) do
		ProviderPower = ProviderPower + provider.energy
	end
	RestPower = ProviderPower - TrainPower
	if RestPower >= 0 then
		for _,train in pairs(global.TrainList) do
			train.energy = train.prototype.max_energy_usage + 1
		end
		SplitPower = RestPower / #global.ProviderList
		for _,provider in pairs(global.ProviderList) do
			provider.energy = SplitPower
		end
	else
		for _,provider in pairs(global.ProviderList) do
			provider.energy = 0
		end
		SplitPower = ProviderPower / #global.TrainList
		for _,train in pairs(global.TrainList) do
			train.energy = SplitPower
		end
	end
end


local function ONBUILT(event)
	local entity = event.created_entity
	if entity.name == "power-provider" then
		table.insert(global.ProviderList,entity)
	end
	if exists(TrainEntityList,entity.name) then
		table.insert(global.TrainList,entity)
	end
end


local function ONREMOVE(event)
	local entity = event.entity
	if entity.name == "power-provider" then
		for index,provider in pairs(global.ProviderList) do
			if provider == entity then
				table.remove(global.ProviderList,index)
			end
		end
	end				
	if exists(TrainEntityList,entity.name) then
		for index,train in pairs(global.TrainList) do
			if train == entity then
				table.remove(global.TrainList,index)
			end
		end
	end	
end


script.on_configuration_changed(function(data)
	ONLOAD()
	if data and data.mod_changes["ElectricTrain"] then
		local alltrain = game.surfaces[1].find_entities_filtered{type="locomotive"}
		local e_loclist = {}
		for _,train in pairs(alltrain) do
			if exists(TrainEntityList,train.name) then 
				table.insert(e_loclist,train) 
			end
		end	
		local providerlist = game.surfaces[1].find_entities_filtered{name="power-provider"}
		global.TrainList = e_loclist
		global.ProviderList = providerlist
	end
end)


script.on_init(function() ONLOAD() end)

script.on_event(defines.events.on_tick,ONTICK)
script.on_event(defines.events.on_built_entity,ONBUILT)
script.on_event(defines.events.on_robot_built_entity,ONBUILT)
script.on_event(defines.events.on_preplayer_mined_item,ONREMOVE)
script.on_event(defines.events.on_robot_pre_mined,ONREMOVE)
script.on_event(defines.events.on_entity_died,ONREMOVE)