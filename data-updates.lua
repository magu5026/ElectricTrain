data.raw['item-with-entity-data']['locomotive'].subgroup = "electric-transport-log"
data.raw['item-with-entity-data']['locomotive'].order = "a"
data.raw['item-with-entity-data']['cargo-wagon'].subgroup = "electric-transport-cargo"
data.raw['item-with-entity-data']['cargo-wagon'].order = "a"
data.raw['item-with-entity-data']['fluid-wagon'].subgroup = "electric-transport-fluid"
data.raw['item-with-entity-data']['fluid-wagon'].order = "a"


if settings.startup['mk-train'].value then
	train_tech()
	train_rec()
end


if not (mods['boblogistics'] or mods['FactorioExtended-Trains']) then
	if settings.startup['mk-cargo'].value then
		cargo_tech()
		cargo_rec()
	end
	if settings.startup['mk-fluid'].value then
		fluid_tech()
		fluid_rec()
	end
	if settings.startup['mk-train'].value then
		data.raw['artillery-wagon']['artillery-wagon'].max_speed = 3
		if not settings.startup['mk-cargo'].value then
			data.raw['cargo-wagon']['cargo-wagon'].max_speed = 3
		end
		if not settings.startup['mk-fluid'].value then
			data.raw['fluid-wagon']['fluid-wagon'].max_speed = 3
		end
	end	
end


if mods['Vehicle Wagon'] and settings.startup['mk-train'].value then
	for _,wagon in pairs(data.raw['cargo-wagon']) do
		if wagon.name:match("vehicle%-wagon") then	
			wagon.max_speed = 3
		end
	end
end

if mods['FactorioExtended-Trains'] and settings.startup['mk-train'].value then
	data.raw['cargo-wagon']['cargo-wagon-2'].max_speed = 2.25
	data.raw['cargo-wagon']['cargo-wagon-3'].max_speed = 3
	data.raw['fluid-wagon']['fluid-wagon-2'].max_speed = 2.25
	data.raw['fluid-wagon']['fluid-wagon-3'].max_speed = 3	
end


if mods['EvenMoreLight'] then
	for _,train in pairs(data.raw['locomotive']) do
		if train.name:match("^et%-electric%-locomotive%-%d$") then
			train.front_light =
				{
					{
						minimum_darkness = 0.3,
						intensity = 0.9,
						size = 60,
					},
					{
						minimum_darkness = 0.3,
						intensity = 0.9,
						size = 60,
					}
				}
			train.stand_by_light =
				{
					{
						minimum_darkness = 0.3,
						color = {b=1},
						shift = {-0.6, -3.5},
						size = 2,
						intensity = 0.5
					},
					{
						minimum_darkness = 0.3,
						color = {b=1},
						shift = {0.6, -3.5},
						size = 2,
						intensity = 0.5
					},
					{
						minimum_darkness = 0.3,
						intensity = 0.9,
						size = 60,
					},
					{
						minimum_darkness = 0.3,
						intensity = 0.9,
						size = 60,
					}
				}
		end				
	end
end



if mods['bobvehicleequipment'] then
	if settings.startup['bobmods-vehicleequipment-enablevehiclegrids'].value then
		data.raw['locomotive']['et-electric-locomotive-1'].equipment_grid = "bob-locomotive"
		if settings.startup['mk-train'] then
			data.raw['locomotive']['et-electric-locomotive-2'].equipment_grid = "bob-locomotive-2"
			data.raw['locomotive']['et-electric-locomotive-3'].equipment_grid = "bob-locomotive-3"
		end
		if settings.startup['mk-cargo'].value then
			data.raw['cargo-wagon']['et-cargo-wagon-2'].equipment_grid = "bob-cargo-wagon-2"
			data.raw['cargo-wagon']['et-cargo-wagon-3'].equipment_grid = "bob-cargo-wagon-3"
		end
	end
end


--if mods['reverse-factory'] then
--	for _,item in pairs(data.raw['item-with-entity-data']) do
--		if item.type == "locomotive" or item.type == "cargo-wagon" or item.type == "fluid-wagon" then
--			local recipe = data.raw['recipe'][item.name]
--			if recipe then
--				data:extend
--					({
--						{
--							type = "recipe",
--							name = "rf-" .. item.name,
--							category = "recycle",
--							hidden = true,
--							icon = item.icon,
--							subgroup = "rf-multiple-outputs",
--							energy_required = 30,
--							ingredients = {{item.name, 1}},
--							results = recipe.ingredients
--						}
--					})
--			end
--		end
--	end
--end