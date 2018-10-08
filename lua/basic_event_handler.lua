require("lib")


local function _Init()
	global.TrainList = global.TrainList or {}
	global.TrainCount = global.TrainCount or 0
	global.ProviderList = global.ProviderList or {}
	global.ProviderCount = global.ProviderCount or 0
end


function OnInit()
	_Init()
end


function OnConfigurationChanged(data)
	_Init()

	local mod_name = "ElectricTrain"
	if NeedMigration(data,mod_name) then
		local old_version = GetOldVersion(data,mod_name)
		if old_version < "00.16.09" then
			global = {}
			global.TrainList = {}
			global.ProviderList = {} 
			global.TrainCount = 0
			global.ProviderCount = 0	
						
			for _,surface in pairs(game.surfaces) do
				local trains = surface.find_entities_filtered{type="locomotive"}
				for _,train in pairs(trains) do
					if train.name:find("et-electric-locomotive-mk",1,true) then
						table.insert(global.TrainList,{entity = train, last_fuel = {}})
												
						local fuel = game.item_prototypes['et-electric-locomotive-fuel']
						train.burner.currently_burning = fuel
						train.burner.remaining_burning_fuel = fuel.fuel_value
					end
				end	

				local providers = surface.find_entities_filtered{type="electric-energy-interface"}
				for _,provider in pairs(providers) do
					if provider.name == "et-electricity-provider" then
						table.insert(global.ProviderList,provider)
					end
				end	
			end
			
			global.TrainCount = Count(global.TrainList)
			global.ProviderCount = Count(global.ProviderList)
		end
	end
end