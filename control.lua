require("help_functions")

function init()
	global.ElectricTrain = global.ElectricTrain or {}
	global.ElectricTrain.TrainList = global.ElectricTrain.TrainList or {}
	global.ElectricTrain.ProviderList = global.ElectricTrain.ProviderList or {}
end
	
function ONLOAD()
	init()
end

function ONTICK(event)
	trainpower(event)	
end

function trainpower(event)
	if #global.ElectricTrain.TrainList == 0 or #global.ElectricTrain.ProviderList == 0 then return end
	local TrainPower = 0
	local ProviderPower = 0
	local RestPower = 0
	local SplitPower = 0
	for _,train in pairs(global.ElectricTrain.TrainList) do
		TrainPower = TrainPower + ((train.prototype.max_energy_usage + 1) - train.energy)
	end
	for _,provider in pairs(global.ElectricTrain.ProviderList) do
		ProviderPower = ProviderPower + provider.energy
	end
	RestPower = ProviderPower - TrainPower
	if RestPower >= 0 then
		for _,train in pairs(global.ElectricTrain.TrainList) do
			train.energy = train.prototype.max_energy_usage + 1
		end
		SplitPower = RestPower / #global.ElectricTrain.ProviderList
		for _,provider in pairs(global.ElectricTrain.ProviderList) do
			provider.energy = SplitPower
		end
	else
		for _,provider in pairs(global.ElectricTrain.ProviderList) do
			provider.energy = 0
		end
		SplitPower = ProviderPower / #global.ElectricTrain.TrainList
		for _,train in pairs(global.ElectricTrain.TrainList) do
			train.energy = SplitPower
		end
	end
end

function ONBUILT(event)
	local entity = event.created_entity
	if entity.name == "power-provider" then
		table.insert(global.ElectricTrain.ProviderList,entity)
	end
	if exists(ElectricTrainNameList,entity.name) then
		table.insert(global.ElectricTrain.TrainList,entity)
	end
end

function ONREMOVE(event)
	local entity = event.entity
	if entity.name == "power-provider" then
		for index,provider in pairs(global.ElectricTrain.ProviderList) do
			if provider == entity then
				table.remove(global.ElectricTrain.ProviderList,index)
				break
			end
		end
	end				
	if exists(ElectricTrainNameList,entity.name) then
		for index,train in pairs(global.ElectricTrain.TrainList) do
			if train == entity then
				table.remove(global.ElectricTrain.TrainList,index)
				break
			end
		end
	end	
end

function ONCONFIG(data)
	init()
	if migration(data) then
		local old_version = versionformat(data.mod_changes["ElectricTrain"].old_version)
		if old_version < "00.15.11" then
			local alltrain = game.surfaces[1].find_entities_filtered{type="locomotive"}
			local e_loclist = {}
			for _,train in pairs(alltrain) do
				if exists(ElectricTrainNameList,train.name) then 
					table.insert(e_loclist,train) 
				end
			end	
			local providerlist = game.surfaces[1].find_entities_filtered{name="power-provider"}
			global.ElectricTrain.TrainList = e_loclist
			global.ElectricTrain.ProviderList = providerlist
		end
	end
end	

function migration(data)
	if data and data.mod_changes["ElectricTrain"] then
		if data.mod_changes["ElectricTrain"].old_version then
			return true
		end
	end
	return false
end

function versionformat(version)
	return string.format("%02d.%02d.%02d", string.match(version, "(%d+).(%d+).(%d+)"))
end


script.on_init(function() ONLOAD() end)
script.on_configuration_changed(function(data) ONCONFIG(data) end)
script.on_event(defines.events.on_tick,ONTICK)
script.on_event({defines.events.on_built_entity,defines.events.on_robot_built_entity},ONBUILT)
script.on_event({defines.events.on_preplayer_mined_item,defines.events.on_robot_pre_mined,defines.events.on_entity_died},ONREMOVE)