local eloc = table.deepcopy(data.raw['recipe']['locomotive'])
eloc.name = "electric-locomotive"
eloc.ingredients =
	{
		{"locomotive", 1},
		{"battery", 10},
		{"electric-engine-unit", 20}	
	}
eloc.result = "electric-locomotive"

local eloc2 = table.deepcopy(data.raw['recipe']['locomotive'])
eloc2.name = "electric-locomotive-mk2"
eloc2.ingredients =
	{
		{"electric-locomotive", 1},
		{"battery", 5},
		{"electric-engine-unit", 10},
		{"advanced-circuit", 10}
	}
eloc2.result = "electric-locomotive-mk2"

local eloc3 = table.deepcopy(data.raw['recipe']['locomotive'])
eloc3.name = "electric-locomotive-mk3"
eloc3.ingredients =
	{
		{"electric-locomotive-mk2", 1},
		{"battery", 10},
		{"processing-unit", 10}	
	}
eloc3.result = "electric-locomotive-mk3"

local cwag2 = table.deepcopy(data.raw['recipe']['cargo-wagon'])
cwag2.name = "cargo-wagon-mk2"
cwag2.ingredients =
	{
		{"cargo-wagon", 1},
		{"iron-gear-wheel", 20},
		{"steel-plate", 20}	
	}
cwag2.result = "cargo-wagon-mk2"

local cwag3 = table.deepcopy(data.raw['recipe']['cargo-wagon'])
cwag3.name = "cargo-wagon-mk3"
cwag3.ingredients =
	{
		{"cargo-wagon-mk2", 1},
		{"iron-gear-wheel", 20},
		{"steel-plate", 20}	
	}
cwag3.result = "cargo-wagon-mk3"

local fwag2 = table.deepcopy(data.raw['recipe']['fluid-wagon'])
fwag2.name = "fluid-wagon-mk2"
fwag2.ingredients =
	{
		{"fluid-wagon", 1},
		{"iron-gear-wheel", 10},
		{"steel-plate", 16},
		{"pipe", 8},
		{"storage-tank", 1}	
	}
fwag2.result = "fluid-wagon-mk2"

local fwag3 = table.deepcopy(data.raw['recipe']['fluid-wagon'])
fwag3.name = "fluid-wagon-mk3"
fwag3.ingredients =
	{
		{"fluid-wagon-mk2", 1},
		{"iron-gear-wheel", 10},
		{"steel-plate", 16},
		{"pipe", 8},
		{"storage-tank", 1}	
	}
fwag3.result = "fluid-wagon-mk3"

local ppro = table.deepcopy(data.raw['recipe']['accumulator'])
ppro.name = "power-provider"
ppro.ingredients =
	{
		{"accumulator", 2},
		{"advanced-circuit", 1}
	}
ppro.result = "power-provider"


data:extend({eloc,ppro})


function train_rec()
	data:extend({eloc2,eloc3})
end

function cargo_rec()
	data:extend({cwag2,cwag3})
end

function fluid_rec()
	data:extend({fwag2,fwag3})
end