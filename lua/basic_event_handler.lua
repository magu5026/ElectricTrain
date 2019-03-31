require("lib")


function OnInit()
	global = {}
	global.TrainList = {}
	global.ProviderList = {}
	global.Fuel = game.item_prototypes["et-electric-locomotive-fuel"]
	--global.Fuel = game.item_prototypes['et-electric-locomotive-fuel']
end


function OnConfigurationChanged(data)
	local mod_name = "ElectricTrain"
	if IsModChanged(data,mod_name) then
		if data.mod_changes[mod_name].old_version == "0.17.201" or GetOldVersion(data,mod_name) < "00.17.04"  then
			OnInit()
			for _,surface in pairs(game.surfaces) do
				local trains = surface.find_entities_filtered{type="locomotive"}
				for _,train in pairs(trains) do
					if train.name:match("^et%-electric%-locomotive%-%d$") then
						table.insert(global.TrainList,{entity = train, last_fuel = {}})
						
						if not (global.Fuel and global.Fuel.valid and global.Fuel.fuel_value) then
							global.Fuel = game.item_prototypes["et-electric-locomotive-fuel"]
							global.Fuel.fuel_value = global.Fuel.fuel_value or "2GJ"
						end
						
						train.burner.currently_burning = global.Fuel
						train.burner.remaining_burning_fuel = global.Fuel.fuel_value or global.FailOverFuelValue
					end
				end	
				local providers = surface.find_entities_filtered{type="electric-energy-interface"}
				for _,provider in pairs(providers) do
					if provider.name == "et-electricity-provider" then
						table.insert(global.ProviderList,provider)
					end
				end	
			end
		end
	end
end