require("help_functions")

if settings.startup['vanilla-order'].value then
	data.raw['item-with-entity-data']['electric-locomotive'].subgroup = "transport"
	data.raw['item-with-entity-data']['electric-locomotive'].order = "a[train-system]-f[diesel-locomotive]-a"
	data.raw['item-with-entity-data']['electric-locomotive-mk2'].subgroup = "transport"
	data.raw['item-with-entity-data']['electric-locomotive-mk2'].order = "a[train-system]-f[diesel-locomotive]-b"
	data.raw['item-with-entity-data']['electric-locomotive-mk3'].subgroup = "transport"
	data.raw['item-with-entity-data']['electric-locomotive-mk3'].order = "a[train-system]-f[diesel-locomotive]-c"
	data.raw['item-with-entity-data']['cargo-wagon-mk2'].subgroup = "transport"
	data.raw['item-with-entity-data']['cargo-wagon-mk2'].order = "a[train-system]-g[cargo-wagon]-a"
	data.raw['item-with-entity-data']['cargo-wagon-mk3'].subgroup = "transport"
	data.raw['item-with-entity-data']['cargo-wagon-mk3'].order = "a[train-system]-g[cargo-wagon]-b"
	data.raw['item-with-entity-data']['fluid-wagon-mk2'].subgroup = "transport"
	data.raw['item-with-entity-data']['fluid-wagon-mk2'].order = "a[train-system]-h[fluid-wagon]-a"
	data.raw['item-with-entity-data']['fluid-wagon-mk3'].subgroup = "transport"
	data.raw['item-with-entity-data']['fluid-wagon-mk3'].order = "a[train-system]-h[fluid-wagon]-b"
	data.raw['item']['power-provider'].subgroup = "transport"
	data.raw['item']['power-provider'].order = "a[train-system]-i"
else
	data.raw['item-with-entity-data']['locomotive'].subgroup = "electric-transport"
	data.raw['item-with-entity-data']['locomotive'].order = "a"
	data.raw['item-with-entity-data']['cargo-wagon'].subgroup = "electric-transport"
	data.raw['item-with-entity-data']['cargo-wagon'].order = "b"
	data.raw['item-with-entity-data']['fluid-wagon'].subgroup = "electric-transport"
	data.raw['item-with-entity-data']['fluid-wagon'].order = "c"
end


if not settings.startup['hybrid-train'].value then
	data.raw['locomotive']['electric-locomotive'].burner = {effectivity = 1, fuel_inventory_size = 0}
	data.raw['locomotive']['electric-locomotive-mk2'].burner = {effectivity = 1, fuel_inventory_size = 0}
	data.raw['locomotive']['electric-locomotive-mk3'].burner = {effectivity = 1, fuel_inventory_size = 0}
end


if settings.startup['mk-train'].value then
	train_tech()
	train_rec()
end


if not mods['boblogistics'] then
	if settings.startup['mk-cargo'].value then
		cargo_tech()
		cargo_rec()
	end
	if settings.startup['mk-fluid'].value then
		fluid_tech()
		fluid_rec()
	end
	if settings.startup['mk-train'].value then
		if not settings.startup['mk-cargo'].value then
			data.raw['cargo-wagon']['cargo-wagon'].max_speed = 3.5
		end
		if not settings.startup['mk-fluid'].value then
			data.raw['fluid-wagon']['fluid-wagon'].max_speed = 3.5
		end
	end	
end


if mods['Vehicle Wagon'] and settings.startup['mk-train'].value then
	wagons = {"loaded-vehicle-wagon-truck","loaded-vehicle-wagon-tarp","loaded-vehicle-wagon-car","loaded-vehicle-wagon-tank","vehicle-wagon"}
	for _,wagon in pairs(data.raw['cargo-wagon']) do
		if exists(wagons,wagon.name) then	
			wagon.max_speed = 3.5
		end
	end
end


if mods['EvenMoreLight'] then
	for _,train in pairs(data.raw['locomotive']) do
		if exists(TrainEntityList,train.name) then
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
		data.raw['locomotive']['electric-locomotive'].equipment_grid = "bob-locomotive"
		if settings.startup['mk-train'] then
			data.raw['locomotive']['electric-locomotive-mk2'].equipment_grid = "bob-locomotive-2"
			data.raw['locomotive']['electric-locomotive-mk3'].equipment_grid = "bob-locomotive-3"
		end
		if settings.startup['mk-cargo'].value then
			data.raw['cargo-wagon']['cargo-wagon-mk2'].equipment_grid = "bob-cargo-wagon-2"
			data.raw['cargo-wagon']['cargo-wagon-mk3'].equipment_grid = "bob-cargo-wagon-3"
		end
	end
end