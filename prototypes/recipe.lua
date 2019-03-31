local electric_locomotive_1 = table.deepcopy(data.raw['recipe']['locomotive'])
electric_locomotive_1.name = "et-electric-locomotive-1"
electric_locomotive_1.ingredients =
	{
		{"locomotive", 1},
		{"battery", 10},
		{"electric-engine-unit", 10}	
	}
electric_locomotive_1.result = "et-electric-locomotive-1"

local electric_locomotive_2 = table.deepcopy(data.raw['recipe']['locomotive'])
electric_locomotive_2.name = "et-electric-locomotive-2"
electric_locomotive_2.ingredients =
	{
		{"et-electric-locomotive-1", 1},
		{"battery", 10},
		{"low-density-structure", 10},
		{"electric-engine-unit", 10},
		{"advanced-circuit", 10}
	}
electric_locomotive_2.result = "et-electric-locomotive-2"

local electric_locomotive_3 = table.deepcopy(data.raw['recipe']['locomotive'])
electric_locomotive_3.name = "et-electric-locomotive-3"
electric_locomotive_3.ingredients =
	{
		{"et-electric-locomotive-2", 1},
		{"battery", 10},
		{"low-density-structure", 10},
		{"electric-engine-unit", 10},
		{"processing-unit", 10}	
	}
electric_locomotive_3.result = "et-electric-locomotive-3"

local cargo_wagon_2 = table.deepcopy(data.raw['recipe']['cargo-wagon'])
cargo_wagon_2.name = "et-cargo-wagon-2"
cargo_wagon_2.ingredients =
	{
		{"cargo-wagon", 1},
		{"iron-gear-wheel", 20},
		{"steel-plate", 20},
		{"low-density-structure", 10}		
	}
cargo_wagon_2.result = "et-cargo-wagon-2"

local cargo_wagon_3 = table.deepcopy(data.raw['recipe']['cargo-wagon'])
cargo_wagon_3.name = "et-cargo-wagon-3"
cargo_wagon_3.ingredients =
	{
		{"et-cargo-wagon-2", 1},
		{"iron-gear-wheel", 20},
		{"steel-plate", 20},
		{"low-density-structure", 10}		
	}
cargo_wagon_3.result = "et-cargo-wagon-3"

local fluid_wagon_2 = table.deepcopy(data.raw['recipe']['fluid-wagon'])
fluid_wagon_2.name = "et-fluid-wagon-2"
fluid_wagon_2.ingredients =
	{
		{"fluid-wagon", 1},
		{"iron-gear-wheel", 10},
		{"steel-plate", 16},
		{"pipe", 8},
		{"storage-tank", 1},
		{"low-density-structure", 10}		
	}
fluid_wagon_2.result = "et-fluid-wagon-2"

local fluid_wagon_3 = table.deepcopy(data.raw['recipe']['fluid-wagon'])
fluid_wagon_3.name = "et-fluid-wagon-3"
fluid_wagon_3.ingredients =
	{
		{"et-fluid-wagon-2", 1},
		{"iron-gear-wheel", 10},
		{"steel-plate", 16},
		{"pipe", 8},
		{"storage-tank", 1},
		{"low-density-structure", 10}		
	}
fluid_wagon_3.result = "et-fluid-wagon-3"

local electricity_provider = table.deepcopy(data.raw['recipe']['accumulator'])
electricity_provider.name = "et-electricity-provider"
electricity_provider.ingredients =
	{
		{"accumulator", 2},
		{"advanced-circuit", 1}
	}
electricity_provider.result = "et-electricity-provider"


data:extend({electric_locomotive_1,electricity_provider})


function train_rec()
	data:extend({electric_locomotive_2,electric_locomotive_3})
end

function cargo_rec()
	data:extend({cargo_wagon_2,cargo_wagon_3})
end

function fluid_rec()
	data:extend({fluid_wagon_2,fluid_wagon_3})
end