local eloc = table.deepcopy(data.raw['recipe']['locomotive'])
eloc.name = "et-electric-locomotive-mk1"
eloc.ingredients =
	{
		{"locomotive", 1},
		{"battery", 10},
		{"electric-engine-unit", 20}	
	}
eloc.result = "et-electric-locomotive-mk1"

local eloc2 = table.deepcopy(data.raw['recipe']['locomotive'])
eloc2.name = "et-electric-locomotive-mk2"
eloc2.ingredients =
	{
		{"et-electric-locomotive-mk1", 1},
		{"battery", 5},
		{"electric-engine-unit", 10},
		{"advanced-circuit", 10}
	}
eloc2.result = "et-electric-locomotive-mk2"

local eloc3 = table.deepcopy(data.raw['recipe']['locomotive'])
eloc3.name = "et-electric-locomotive-mk3"
eloc3.ingredients =
	{
		{"et-electric-locomotive-mk2", 1},
		{"battery", 10},
		{"processing-unit", 10}	
	}
eloc3.result = "et-electric-locomotive-mk3"

local cwag2 = table.deepcopy(data.raw['recipe']['cargo-wagon'])
cwag2.name = "et-cargo-wagon-mk2"
cwag2.ingredients =
	{
		{"cargo-wagon", 1},
		{"iron-gear-wheel", 20},
		{"steel-plate", 20}	
	}
cwag2.result = "et-cargo-wagon-mk2"

local cwag3 = table.deepcopy(data.raw['recipe']['cargo-wagon'])
cwag3.name = "et-cargo-wagon-mk3"
cwag3.ingredients =
	{
		{"et-cargo-wagon-mk2", 1},
		{"iron-gear-wheel", 20},
		{"steel-plate", 20}	
	}
cwag3.result = "et-cargo-wagon-mk3"

local fwag2 = table.deepcopy(data.raw['recipe']['fluid-wagon'])
fwag2.name = "et-fluid-wagon-mk2"
fwag2.ingredients =
	{
		{"fluid-wagon", 1},
		{"iron-gear-wheel", 10},
		{"steel-plate", 16},
		{"pipe", 8},
		{"storage-tank", 1}	
	}
fwag2.result = "et-fluid-wagon-mk2"

local fwag3 = table.deepcopy(data.raw['recipe']['fluid-wagon'])
fwag3.name = "et-fluid-wagon-mk3"
fwag3.ingredients =
	{
		{"et-fluid-wagon-mk2", 1},
		{"iron-gear-wheel", 10},
		{"steel-plate", 16},
		{"pipe", 8},
		{"storage-tank", 1}	
	}
fwag3.result = "et-fluid-wagon-mk3"

local ppro = table.deepcopy(data.raw['recipe']['accumulator'])
ppro.name = "et-electricity-provider"
ppro.ingredients =
	{
		{"accumulator", 2},
		{"advanced-circuit", 1}
	}
ppro.result = "et-electricity-provider"


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