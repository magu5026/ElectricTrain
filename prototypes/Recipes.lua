data:extend(
{
	{
		type = "recipe",
		name = "electric-locomotive",
		enabled = false,
		ingredients =
		{
			{"locomotive", 1},
			{"battery", 10},
			{"electric-engine-unit", 20}
		},
		result = "electric-locomotive"
	},
	{
		type = "recipe",
		name = "power-provider",
		energy_required = 10,
		enabled = false,
		ingredients =
		{
			{"accumulator", 2},
			{"advanced-circuit", 1}
		},
		result = "power-provider"
	},	
})


function train_rec()
	data:extend(
		{
			{
				type = "recipe",
				name = "electric-locomotive-mk2",
				enabled = false,
				ingredients =
				{
					{"electric-locomotive", 1},
					{"battery", 5},
					{"electric-engine-unit", 10},
					{"advanced-circuit", 10},
				},
				result = "electric-locomotive-mk2"
			},	
			{
				type = "recipe",
				name = "electric-locomotive-mk3",
				enabled = false,
				ingredients =
				{
					{"electric-locomotive-mk2", 1},
					{"battery", 10},
					{"processing-unit", 10}
				},
				result = "electric-locomotive-mk3"
			}
		}
	)
end


function cargo_rec()
	data:extend(
		{
			{
				type = "recipe",
				name = "cargo-wagon-mk2",
				enabled = false,
				ingredients =
				{
					{"cargo-wagon", 1},
					{"iron-gear-wheel", 20},
					{"steel-plate", 20}
				},
				result = "cargo-wagon-mk2"
			},
			
			{
				type = "recipe",
				name = "cargo-wagon-mk3",
				enabled = false,
				ingredients =
				{
					{"cargo-wagon-mk2", 1},
					{"iron-gear-wheel", 20},
					{"steel-plate", 20}
				},
				result = "cargo-wagon-mk3"
			},
		})	

end


function fluid_rec()
	data:extend(
		{
			{
				type = "recipe",
				name = "fluid-wagon-mk2",
				enabled = false,
				ingredients =
				{
					{"fluid-wagon", 1},
					{"iron-gear-wheel", 10},
					{"steel-plate", 16},
					{"pipe", 8},
					{"storage-tank", 3}
				},
				result = "fluid-wagon-mk2"
			},
			
			{
				type = "recipe",
				name = "fluid-wagon-mk3",
				enabled = false,
				ingredients =
				{
					{"fluid-wagon-mk2", 1},
					{"iron-gear-wheel", 10},
					{"steel-plate", 16},
					{"pipe", 8},
					{"storage-tank", 3}
				},
				result = "fluid-wagon-mk3"
			},
		})	

end