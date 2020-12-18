data:extend(
{
	{
		type = "recipe",
		name = "et-electric-locomotive-1",
		enabled = false,
		ingredients =
		{
			{"locomotive", 1},
			{"et-current-collector", 2},
			{"battery", 10},
			{"electric-engine-unit", 10}
		},
		result = "et-electric-locomotive-1"
	},
	
	{
		type = "recipe",
		name = "et-control-station-1",
		enabled = false,
		ingredients =
		{
			{"electronic-circuit", 20},
			{"advanced-circuit", 20},
			{"steel-plate", 10},
			{"copper-cable", 10}
		},
		result = "et-control-station-1"
	},

	{
		type = "recipe",
		name = "et-current-collector",
		enabled = false,
		ingredients =
		{
			{"low-density-structure", 10},
			{"copper-cable", 5},
			{"iron-plate", 2}
		},
		result = "et-current-collector"
	}
})


function UnlockTrainRecipe()
	data:extend(
	{
		{	
			type = "recipe",
			name = "et-electric-locomotive-2",
			enabled = false,
			ingredients =
			{
				{"et-electric-locomotive-1", 1},
				{"low-density-structure", 10},
				{"electric-engine-unit", 10},
				{"advanced-circuit", 10}
			},
			result = "et-electric-locomotive-2"
		},
		
		{	
			type = "recipe",
			name = "et-electric-locomotive-3",
			enabled = false,
			ingredients =
			{
				{"et-electric-locomotive-2", 1},
				{"low-density-structure", 10},
				{"electric-engine-unit", 10},
				{"processing-unit", 10}	
			},
			result = "et-electric-locomotive-3"
		}
	})
end

function UnlockCargoRecipe()
	data:extend(
	{
		{	
			type = "recipe",
			name = "et-cargo-wagon-2",
			enabled = false,
			ingredients =
			{
				{"cargo-wagon", 1},
				{"iron-gear-wheel", 20},
				{"steel-plate", 20},
				{"low-density-structure", 10}	
			},
			result = "et-cargo-wagon-2"
		},
		
		{	
			type = "recipe",
			name = "et-cargo-wagon-3",
			enabled = false,
			ingredients =
			{
				{"et-cargo-wagon-2", 1},
				{"iron-gear-wheel", 20},
				{"steel-plate", 20},
				{"low-density-structure", 10}
			},
			result = "et-cargo-wagon-3"
		}
	})
end

function UnlockFluidRecipe()
	data:extend(
	{
		{	
			type = "recipe",
			name = "et-fluid-wagon-2",
			enabled = false,
			ingredients =
			{
				{"fluid-wagon", 1},
				{"iron-gear-wheel", 10},
				{"steel-plate", 16},
				{"pipe", 8},
				{"storage-tank", 1},
				{"low-density-structure", 10}
			},
			result = "et-fluid-wagon-2"
		},
		
		{	
			type = "recipe",
			name = "et-fluid-wagon-3",
			enabled = false,
			ingredients =
			{
				{"et-fluid-wagon-2", 1},
				{"iron-gear-wheel", 10},
				{"steel-plate", 16},
				{"pipe", 8},
				{"storage-tank", 1},
				{"low-density-structure", 10}	
			},
			result = "et-fluid-wagon-3"
		}
	})
end