require("lib")


function OnBuilt(event)
	local entity = event.created_entity
	if entity and entity.valid then
		if entity.name == "power-provider" and entity.type == "electric-energy-interface" then
			table.insert(global.ProviderList,entity)
			global.ProviderCount = Count(global.ProviderList)
		elseif entity.name:find("electric-locomotive-mk",1,true) and entity.type == "locomotive" then 
			table.insert(global.TrainList,{entity = entity, last_fuel = {}})
			global.TrainCount = Count(global.TrainList)
			
			local fuel = game.item_prototypes['electric-locomotive-fuel']
			entity.burner.currently_burning = fuel
			entity.burner.remaining_burning_fuel = fuel.fuel_value
		end
	end
end


function OnRemove(event)
	local entity = event.entity
	if entity and entity.valid then
		if entity.name == "power-provider" and entity.type == "electric-energy-interface" then
			for i,provider in pairs(global.ProviderList) do
				if entity == provider then
					table.remove(global.ProviderList,i)
					break
				end
			end
			global.ProviderCount = Count(global.ProviderList)
		elseif entity.name:find("electric-locomotive-mk",1,true) and entity.type == "locomotive" then 
			for i,train in pairs(global.TrainList) do
				if entity == train.entity then
					table.remove(global.TrainList,i)
					break
				end
			end
			global.TrainCount = Count(global.TrainList)
		end
	end
end


local function _ChangeTrainFuel()
	for i,train in pairs(global.TrainList) do
		if train and train.entity and train.entity.valid then
			if train.entity.burner.currently_burning and train.entity.burner.currently_burning.name == "electric-locomotive-fuel" then
				train.entity.burner.currently_burning = nil
	
				if train.last_fuel.fuel then
					train.entity.burner.currently_burning = train.last_fuel.fuel
					train.entity.burner.remaining_burning_fuel = train.last_fuel.fuel_value
				end
			end
		end
	end
end
	
	
function OnTick()
	if global.TrainCount > 0 and global.ProviderCount > 0 then
		local need_power = 0
		local provider_power = 0
		local rest_power = 0
		local split_power = 0
		local fuel = game.item_prototypes['electric-locomotive-fuel']
		
		for i,provider in pairs(global.ProviderList) do
			if provider and provider.valid then
				provider_power = provider_power + provider.energy
			else
				table.remove(global.ProviderList,i)
				global.ProviderCount = Count(global.ProviderList)
			end
		end
			
		if provider_power > 0 then 
			for i,train in pairs(global.TrainList) do
				if train and train.entity and train.entity.valid then
					if not train.entity.burner.currently_burning or train.entity.burner.currently_burning.name ~= "electric-locomotive-fuel" then
						train.last_fuel['fuel'] = train.entity.burner.currently_burning
						train.last_fuel['fuel_value'] = train.entity.burner.remaining_burning_fuel
				
						train.entity.burner.currently_burning = fuel
						train.entity.burner.remaining_burning_fuel = fuel.fuel_value
					end
					need_power = need_power + fuel.fuel_value - train.entity.burner.remaining_burning_fuel				
				else
					table.remove(global.TrainList,i)
					global.TrainCount = Count(global.TrainList)
				end
			end
		
			rest_power = provider_power - need_power
			if rest_power >= 0 then
				for _,train in pairs(global.TrainList) do
					train.entity.burner.remaining_burning_fuel = fuel.fuel_value
				end
				split_power = rest_power / global.ProviderCount
				for _,provider in pairs(global.ProviderList) do
					provider.energy = split_power
				end
			else
				for _,provider in pairs(global.ProviderList) do
					provider.energy = 0
				end
				split_power = provider_power / global.TrainCount
				for _,train in pairs(global.TrainList) do
					train.entity.burner.remaining_burning_fuel = train.entity.burner.remaining_burning_fuel + split_power
				end
			end
		else
			_ChangeTrainFuel()
		end
	else
		if global.TrainCount > 0 and global.ProviderCount == 0 then
			_ChangeTrainFuel()
		end
	end
end