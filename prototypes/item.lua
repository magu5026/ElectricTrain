local electric_locomotive_1 = table.deepcopy(data.raw['item-with-entity-data']['locomotive'])
electric_locomotive_1.name = "et-electric-locomotive-1"
electric_locomotive_1.icon = "__AdvElectricTrain__/graphics/loc1.png"
electric_locomotive_1.subgroup = "electric-transport-loc"
electric_locomotive_1.order = "b"
electric_locomotive_1.place_result = "et-electric-locomotive-1"
electric_locomotive_1.icon_size = 32
electric_locomotive_1.icon_mipmaps = nil

local electric_locomotive_2 = table.deepcopy(data.raw['item-with-entity-data']['locomotive'])
electric_locomotive_2.name = "et-electric-locomotive-2"
electric_locomotive_2.icon = "__AdvElectricTrain__/graphics/loc2.png"
electric_locomotive_2.subgroup = "electric-transport-loc"
electric_locomotive_2.order = "c"
electric_locomotive_2.place_result = "et-electric-locomotive-2"
electric_locomotive_2.icon_size = 32
electric_locomotive_2.icon_mipmaps = nil

local electric_locomotive_3 = table.deepcopy(data.raw['item-with-entity-data']['locomotive'])
electric_locomotive_3.name = "et-electric-locomotive-3"
electric_locomotive_3.description = "et-electric-locomotive-3"
electric_locomotive_3.icon = "__AdvElectricTrain__/graphics/loc3.png"
electric_locomotive_3.subgroup = "electric-transport-loc"
electric_locomotive_3.order = "d"
electric_locomotive_3.place_result = "et-electric-locomotive-3"
electric_locomotive_3.icon_size = 32
electric_locomotive_3.icon_mipmaps = nil

local electric_locomotive_4 = table.deepcopy(data.raw['item-with-entity-data']['locomotive'])
electric_locomotive_4.name = "et-electric-locomotive-4"
electric_locomotive_4.description = "et-electric-locomotive-4"
electric_locomotive_4.icon = "__AdvElectricTrain__/graphics/loc4.png"
electric_locomotive_4.subgroup = "electric-transport-loc"
electric_locomotive_4.order = "d"
electric_locomotive_4.place_result = "et-electric-locomotive-4"
electric_locomotive_4.icon_size = 32
electric_locomotive_4.icon_mipmaps = nil


data:extend({electric_locomotive_1,electric_locomotive_2,electric_locomotive_3,electric_locomotive_4})


local cargo_wagon_2 = table.deepcopy(data.raw['item-with-entity-data']['cargo-wagon'])
cargo_wagon_2.name = "et-cargo-wagon-2"
cargo_wagon_2.icon = "__AdvElectricTrain__/graphics/cargo2.png"
cargo_wagon_2.subgroup = "electric-transport-cargo"
cargo_wagon_2.order = "b"
cargo_wagon_2.place_result = "et-cargo-wagon-2"
cargo_wagon_2.icon_size = 32
cargo_wagon_2.icon_mipmaps = nil

local cargo_wagon_3 = table.deepcopy(data.raw['item-with-entity-data']['cargo-wagon'])
cargo_wagon_3.name = "et-cargo-wagon-3"
cargo_wagon_3.icon = "__AdvElectricTrain__/graphics/cargo3.png"
cargo_wagon_3.subgroup = "electric-transport-cargo"
cargo_wagon_3.order = "c"
cargo_wagon_3.place_result = "et-cargo-wagon-3"
cargo_wagon_3.icon_size = 32
cargo_wagon_3.icon_mipmaps = nil

data:extend({cargo_wagon_2,cargo_wagon_3})	


local fluid_wagon_2 = table.deepcopy(data.raw['item-with-entity-data']['fluid-wagon'])
fluid_wagon_2.name = "et-fluid-wagon-2"
fluid_wagon_2.icon = "__AdvElectricTrain__/graphics/fluid2.png"
fluid_wagon_2.subgroup = "electric-transport-fluid"
fluid_wagon_2.order = "b"
fluid_wagon_2.place_result = "et-fluid-wagon-2"
fluid_wagon_2.icon_size = 32
fluid_wagon_2.icon_mipmaps = nil

local fluid_wagon_3 = table.deepcopy(data.raw['item-with-entity-data']['fluid-wagon'])
fluid_wagon_3.name = "et-fluid-wagon-3"
fluid_wagon_3.icon = "__AdvElectricTrain__/graphics/fluid3.png"
fluid_wagon_3.subgroup = "electric-transport-fluid"
fluid_wagon_3.order = "c"
fluid_wagon_3.place_result = "et-fluid-wagon-3"
fluid_wagon_3.icon_size = 32
fluid_wagon_3.icon_mipmaps = nil

data:extend({fluid_wagon_2,fluid_wagon_3})


data:extend(
{
	{
		type = "item",
		name = "et-electric-locomotive-fuel",
		icon = "__base__/graphics/icons/wood.png",
		icon_size = 32,
		flags = { "hidden" },
		fuel_value = "2000kJ",
		fuel_category = "chemical",
		stack_size = 1
	}
})


local control_station_1 = table.deepcopy(data.raw['item']['small-lamp'])
control_station_1.name = "et-control-station-1"
control_station_1.icon = "__AdvElectricTrain__/graphics/relais-icon-1.png"
control_station_1.subgroup = "electric-transport-basic"
control_station_1.order = "b"
control_station_1.place_result = "et-control-station-1"
control_station_1.icon_size = 32
control_station_1.icon_mipmaps = nil

data:extend({control_station_1})


data:extend(
{
	{
		type = "item",
		name = "et-current-collector",
		icon = "__AdvElectricTrain__/graphics/current-collector-icon.png",
		icon_size = 32,
		subgroup = "electric-transport-basic",
		order = "a",
		stack_size = 200
	}
})


data:extend(
{
	{
		type = "item",
		name = "et-rocket-part",
		icon = "__base__/graphics/icons/rocket-part.png",
		icon_size = 32,
		flags = {"hidden"},
		subgroup = "intermediate-product",
		order = "q[et-rocket-part]",
		stack_size = 100
	}
})