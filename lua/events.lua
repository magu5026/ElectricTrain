require("lua.lib")
local MODNAME = "ElectricTrain"


local function Init()
	global.ElectricTrain = global.ElectricTrain or {}
	global.ElectricTrain.TrainList = global.ElectricTrain.TrainList or {}
	global.ElectricTrain.ProviderList = global.ElectricTrain.ProviderList or {}
end

local function Migration(data)
	if NeedMigration(data,MODNAME) then
		local old_version = GetOldVersion(data,MODNAME)
		if old_version < "00.16.00" then
			global.ElectricTrain.TrainList = {}
			global.ElectricTrain.ProviderList = {}
			local all_trains = game.surfaces[1].find_entities_filtered{type="locomotive"}
			for _,train in pairs(all_trains) do
				if train.name:find("electric-") then
					table.insert(global.ElectricTrain.TrainList,train) 
				end
			end	
			local providerlist = game.surfaces[1].find_entities_filtered{name="power-provider"} or {}
			global.ElectricTrain.ProviderList = providerlist
		end
	end
end

local function TrainPower(event)
	if #global.ElectricTrain.TrainList == 0 or #global.ElectricTrain.ProviderList == 0 then return end
	local need_power = 0
	local provider_power = 0
	local rest_power = 0
	local split_power = 0
	for _,train in pairs(global.ElectricTrain.TrainList) do	
		need_power = need_power - train.energy + train.prototype.max_energy_usage + 1
	end
	for _,provider in pairs(global.ElectricTrain.ProviderList) do
		provider_power = provider_power + provider.energy
	end
	rest_power = provider_power - need_power
	if rest_power >= 0 then
		for _,train in pairs(global.ElectricTrain.TrainList) do
			train.energy = train.prototype.max_energy_usage + 1
		end
		split_power = rest_power / #global.ElectricTrain.ProviderList
		for _,provider in pairs(global.ElectricTrain.ProviderList) do
			provider.energy = split_power
		end
	else
		for _,provider in pairs(global.ElectricTrain.ProviderList) do
			provider.energy = 0
		end
		split_power = provider_power / #global.ElectricTrain.TrainList
		for _,train in pairs(global.ElectricTrain.TrainList) do
			train.energy = split_power
		end
	end
	
end

local function ProviderBuild(entity)
	table.insert(global.ElectricTrain.ProviderList,entity)
end

local function LocBuild(entity)
	if entity.name:find("electric-") then
		table.insert(global.ElectricTrain.TrainList,entity)
	end
end

local function ProviderRemove(entity)
	Remove(global.ElectricTrain.ProviderList,entity)
end

local function LocRemove(entity)
	if entity.name:find("electric-") then 
		Remove(global.ElectricTrain.TrainList,entity)
	end
end











function on_init()
	Init()
end

function on_configuration_changed(data)
	Init()
	Migration(data)
end	

function on_tick(event)
	TrainPower(event)
end

function on_built(event)
	local entity = event.created_entity
	if entity.name == "power-provider" then
		ProviderBuild(entity)
	elseif entity.type == "locomotive" then
		LocBuild(entity)
	end
end

function on_remove(event)
	local entity = event.entity
	if entity.name == "power-provider" then
		ProviderRemove(entity)
	elseif entity.type == "locomotive" then
		LocRemove(entity)
	end
end