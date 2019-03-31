local electric_locomotive_1 = table.deepcopy(data.raw['item-with-entity-data']['locomotive'])
electric_locomotive_1.name = "et-electric-locomotive-1"
electric_locomotive_1.subgroup = "electric-transport-log"
electric_locomotive_1.order = "b"
electric_locomotive_1.place_result = "et-electric-locomotive-1"

local electric_locomotive_2 = table.deepcopy(data.raw['item-with-entity-data']['locomotive'])
electric_locomotive_2.name = "et-electric-locomotive-2"
electric_locomotive_2.subgroup = "electric-transport-log"
electric_locomotive_2.order = "c"
electric_locomotive_2.place_result = "et-electric-locomotive-2"

local electric_locomotive_3 = table.deepcopy(data.raw['item-with-entity-data']['locomotive'])
electric_locomotive_3.name = "et-electric-locomotive-3"
electric_locomotive_3.subgroup = "electric-transport-log"
electric_locomotive_3.order = "d"
electric_locomotive_3.place_result = "et-electric-locomotive-3"

data:extend({electric_locomotive_1,electric_locomotive_2,electric_locomotive_3})


local cargo_wagon_2 = table.deepcopy(data.raw['item-with-entity-data']['cargo-wagon'])
cargo_wagon_2.name = "et-cargo-wagon-2"
cargo_wagon_2.subgroup = "electric-transport-cargo"
cargo_wagon_2.order = "b"
cargo_wagon_2.place_result = "et-cargo-wagon-2"

local cargo_wagon_3 = table.deepcopy(data.raw['item-with-entity-data']['cargo-wagon'])
cargo_wagon_3.name = "et-cargo-wagon-3"
cargo_wagon_3.subgroup = "electric-transport-cargo"
cargo_wagon_3.order = "c"
cargo_wagon_3.place_result = "et-cargo-wagon-3"

data:extend({cargo_wagon_2,cargo_wagon_3})	


local fluid_wagon_2 = table.deepcopy(data.raw['item-with-entity-data']['fluid-wagon'])
fluid_wagon_2.name = "et-fluid-wagon-2"
fluid_wagon_2.subgroup = "electric-transport-fluid"
fluid_wagon_2.order = "b"
fluid_wagon_2.place_result = "et-fluid-wagon-2"

local fluid_wagon_3 = table.deepcopy(data.raw['item-with-entity-data']['fluid-wagon'])
fluid_wagon_3.name = "et-fluid-wagon-3"
fluid_wagon_3.subgroup = "electric-transport-fluid"
fluid_wagon_3.order = "c"
fluid_wagon_3.place_result = "et-fluid-wagon-3"

data:extend({fluid_wagon_2,fluid_wagon_3})


local electricity_provider = table.deepcopy(data.raw['item']['accumulator'])
electricity_provider.name = "et-electricity-provider"
electricity_provider.icon = "__ElectricTrain__/graphics/power-provider-icon.png"
electricity_provider.subgroup = "electric-transport-log"
electricity_provider.order = "e"
electricity_provider.place_result = "et-electricity-provider"

data:extend({electricity_provider})


data:extend(
{
	{
		type = "item",
		name = "et-electric-locomotive-fuel",
		icon = "__base__/graphics/icons/wood.png",
		icon_size = 32,
		flags = { "hidden" },
		fuel_value = "2GJ",
		fuel_category = "chemical",
		stack_size = 1
	}
})


--local fuel = table.deepcopy(data.raw['item']['wood'])
--fuel.name = "et-electric-locomotive-fuel"
--fuel.flags = {"hidden"}
--fuel.fuel_value = "10GJ"
	
--data:extend({fuel})