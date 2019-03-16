require("lib")


function OnBuilt(event)
	local entity = event.created_entity
	if entity and entity.valid then
		if entity.name == "et-electricity-provider" and entity.type == "electric-energy-interface" then
			table.insert(global.ProviderList,entity)
		elseif entity.name:find("et-electric-locomotive-mk",1,true) and entity.type == "locomotive" then 
			table.insert(global.TrainList,{entity = entity, last_fuel = nil, last_fuel_value = 0, stored_energy = 0})
			entity.burner.currently_burning = global.Fuel
			entity.burner.remaining_burning_fuel = global.Fuel.fuel_value
		end
	end
end


function OnRemove(event)
	local entity = event.entity
	if entity and entity.valid then
		if entity.name == "et-electricity-provider" and entity.type == "electric-energy-interface" then
			for i,provider in pairs(global.ProviderList) do
				if entity == provider then
					table.remove(global.ProviderList,i)
					break
				end
			end
		elseif entity.name:find("et-electric-locomotive-mk",1,true) and entity.type == "locomotive" then 
			for i,train in pairs(global.TrainList) do
				if entity == train.entity then
					table.remove(global.TrainList,i)
					break
				end
			end
		end
	end
end


function OnTick()
	if #global.TrainList == 0 then
		return
	end

	local provider_energy  = 0

	for i,provider in pairs(global.ProviderList) do
		if provider and provider.valid then
			provider_energy = provider_energy + provider.energy
		else
			table.remove(global.ProviderList,i)
		end
	end

	local available_energy = provider_energy * 0.1
	local need_energy = 0
	local Fuel = global.Fuel
	local fuel_value = Fuel.fuel_value

	for i,train in pairs(global.TrainList) do
		if train and train.entity and train.entity.valid then
			local burner = train.entity.burner
			local currently_burning = burner.currently_burning
			local remaining_fuel = burner.remaining_burning_fuel
			local stored_energy = train.stored_energy or 0

			if currently_burning ~= Fuel then
				train.last_fuel = currently_burning
				train.last_fuel_value = remaining_fuel
				burner.currently_burning = Fuel
				remaining_fuel = 0
			end

			remaining_fuel = remaining_fuel + stored_energy

			if remaining_fuel > fuel_value then
				remaining_fuel = fuel_value
			end

                        need_energy = need_energy + fuel_value - remaining_fuel

			burner.remaining_burning_fuel = remaining_fuel
			train.stored_energy = 0
		else
			table.remove(global.TrainList,i)
		end
	end

	if available_energy > need_energy then
		for _,train in pairs(global.TrainList) do
			train.entity.burner.remaining_burning_fuel = fuel_value
		end
		local remainder_ratio = 1 - (need_energy / provider_energy)
		for _,provider in pairs(global.ProviderList) do
			provider.energy = remainder_ratio * provider.energy
		end
	else
		local remainder_ratio = 1 - (available_energy / provider_energy)
		for _,provider in pairs(global.ProviderList) do
			provider.energy = remainder_ratio * provider.energy
		end
		local minimum_fuel = 0.1 * fuel_value
		local available_ratio = available_energy / need_energy
		for _,train in pairs(global.TrainList) do
			local burner = train.entity.burner
			local remaining_fuel = burner.remaining_burning_fuel
			remaining_fuel = remaining_fuel + available_ratio * (fuel_value - remaining_fuel)
			if remaining_fuel >= minimum_fuel then
				burner.remaining_burning_fuel = remaining_fuel
			else
				train.stored_energy = remaining_fuel
				if train.last_fuel then
					burner.currently_burning = train.last_fuel
					burner.remaining_burning_fuel = train.last_fuel_value
					train.last_fuel = nil
				else
					burner.currently_burning = nil
					burner.remaining_burning_fuel = 0
				end
			end
		end
	end
end