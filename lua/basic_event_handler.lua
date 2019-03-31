require("lib")


function OnInit()
	global = {}
	global.TrainList = {}
	global.ProviderList = {}
	global.Fuel = game.item_prototypes['nuclear-fuel']
	--global.Fuel = game.item_prototypes['et-electric-locomotive-fuel']
end


function OnConfigurationChanged(data)
	local mod_name = "ElectricTrain"
	if IsModChanged(data,mod_name) then
		if data.mod_changes[mod_name].old_version == "0.17.201" then
			OnInit()
			for _,surface in pairs(game.surfaces) do
				local trains = surface.find_entities_filtered{type="locomotive"}
				for _,train in pairs(trains) do
					if train.name:find("et-electric-locomotive-mk",1,true) then
						table.insert(global.TrainList,{entity = train, last_fuel = {}})
						train.burner.currently_burning = global.Fuel
						train.burner.remaining_burning_fuel = global.Fuel.fuel_value
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