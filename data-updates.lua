data.raw['item-with-entity-data']['locomotive'].subgroup = "electric-transport"
data.raw['item-with-entity-data']['locomotive'].order = "a"
data.raw['item-with-entity-data']['cargo-wagon'].subgroup = "electric-transport"
data.raw['item-with-entity-data']['cargo-wagon'].order = "b"
data.raw['item-with-entity-data']['fluid-wagon'].subgroup = "electric-transport"
data.raw['item-with-entity-data']['fluid-wagon'].order = "c"


if not mods["boblogistics"] then	
	cargo_tech()
	cargo_rec()
end	


if mods["EvenMoreLight"] then

	for index,element in pairs(data.raw["locomotive"]) do
		if element.name == "electric-locomotive" or element.name == "electric-locomotive-mk2" or element.name == "electric-locomotive-mk3" then
			element.front_light =
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
			element.stand_by_light =
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



if mods["bobvehicleequipment"] then

	if settings.startup["bobmods-vehicleequipment-enablevehiclegrids"].value == true then
	
		data.raw['locomotive']['electric-locomotive'].equipment_grid = "bob-locomotive"
		data.raw["locomotive"]["electric-locomotive-mk2"].equipment_grid = "bob-locomotive-2"
		data.raw["locomotive"]["electric-locomotive-mk3"].equipment_grid = "bob-locomotive-3"
		data.raw["cargo-wagon"]["cargo-wagon-mk2"].equipment_grid = "bob-cargo-wagon-2"
		data.raw["cargo-wagon"]["cargo-wagon-mk3"].equipment_grid = "bob-cargo-wagon-3"
		
	end
	
end

if not settings.startup["hybrid-train"].value then

	data.raw['locomotive']['electric-locomotive'].burner = {effectivity = 1, fuel_inventory_size = 0}
	data.raw["locomotive"]["electric-locomotive-mk2"].burner = {effectivity = 1, fuel_inventory_size = 0}
	data.raw["locomotive"]["electric-locomotive-mk3"].burner = {effectivity = 1, fuel_inventory_size = 0}

end