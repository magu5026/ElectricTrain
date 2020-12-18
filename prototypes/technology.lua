data:extend
({
	{
		type = "technology",
		name = "et-electric-railway",
		icon_size = 128,
		icon = "__ElectricTrain__/graphics/tech.png",
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "et-electric-locomotive-1"
			},
			{
				type = "unlock-recipe",
				recipe = "et-control-station-1"
			},
			{
				type = "unlock-recipe",
				recipe = "et-current-collector"
			}		
		},
		prerequisites = {"railway", "electric-engine", "battery", "low-density-structure"},
		unit =
		{
			count = 300,
			ingredients =
			{
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1}
			},
			time = 30
		},
		order = "c-g-a-a"
	}
})

function UnlockTrainTechnology()
	data:extend
	({	
		{
			type = "technology",
			name = "et-electric-railway-2",
			icon_size = 128,
			icon = "__ElectricTrain__/graphics/tech.png",
			effects =
			{
				{
					type = "unlock-recipe",
					recipe = "et-electric-locomotive-2"
				}
			},
			prerequisites = {"et-electric-railway"},
			unit =
			{
				count = 300,
				ingredients =
				{
					{"automation-science-pack", 2},
					{"logistic-science-pack", 2},
					{"chemical-science-pack", 1},
				},
				time = 30
			},
			order = "c-g-a-a-a-b"
		},
	
		{
			type = "technology",
			name = "et-electric-railway-3",
			icon_size = 128,
			icon = "__ElectricTrain__/graphics/tech.png",
			effects =
			{
				{
					type = "unlock-recipe",
					recipe = "et-electric-locomotive-3"
				}
			},
			prerequisites = {"et-electric-railway-2", "utility-science-pack"},
			unit =
			{
				count = 300,
				ingredients =
				{
					{"automation-science-pack", 3},
					{"logistic-science-pack", 3},
					{"chemical-science-pack", 1},
					{"utility-science-pack", 1}
				},
				time = 30
			},
			order = "c-g-a-a-a-c"
		}
	})
end

function UnlockCargoTechnology()
	data:extend
	({	
		{
			type = "technology",
			name = "et-cargo-wagon-2",
			icon_size = 128,
			icon = "__ElectricTrain__/graphics/cargo.png",
			effects =
			{
				{
					type = "unlock-recipe",
					recipe = "et-cargo-wagon-2"
				}
			},
			prerequisites = {"railway", "low-density-structure"},
			unit =
			{
				count = 50,
				ingredients =
				{
					{"automation-science-pack", 3},
					{"logistic-science-pack", 2},
					{"chemical-science-pack", 1},
				},
				time = 30
			},
			order = "c-g-a-a-c"
		},
	
		{
			type = "technology",
			name = "et-cargo-wagon-3",
			icon_size = 128,
			icon = "__ElectricTrain__/graphics/cargo.png",
			effects =
			{
				{
					type = "unlock-recipe",
					recipe = "et-cargo-wagon-3"
				}
			},
			prerequisites = {"et-cargo-wagon-2", "utility-science-pack"},
			unit =
			{
				count = 100,
				ingredients =
				{
					{"automation-science-pack", 4},
					{"logistic-science-pack", 3},
					{"chemical-science-pack", 2},
					{"utility-science-pack", 1}
				},
				time = 30
			},
			order = "c-g-a-a-c-b"
		}
	})
end


function UnlockFluidTechnology()
	data:extend
	({	
		{
			type = "technology",
			name = "et-fluid-wagon-2",
			icon_size = 128,
			icon = "__base__/graphics/technology/fluid-wagon.png",
			effects =
			{
				{
					type = "unlock-recipe",
					recipe = "et-fluid-wagon-2"
				}
			},
			prerequisites = {"fluid-wagon", "low-density-structure"},
			unit =
			{
				count = 50,
				ingredients =
				{
					{"automation-science-pack", 3},
					{"logistic-science-pack", 2},
					{"chemical-science-pack", 1},
				},
				time = 30
			},
			order = "c-g-a-b-b"
		},
	
		{
			type = "technology",
			name = "et-fluid-wagon-3",
			icon_size = 128,
			icon = "__base__/graphics/technology/fluid-wagon.png",
			effects =
			{
				{
					type = "unlock-recipe",
					recipe = "et-fluid-wagon-3"
				}
			},
			prerequisites = {"et-fluid-wagon-2", "utility-science-pack"},
			unit =
			{
				count = 100,
				ingredients =
				{
					{"automation-science-pack", 4},
					{"logistic-science-pack", 3},
					{"chemical-science-pack", 2},
					{"utility-science-pack", 1}
				},
				time = 30
			},
			order = "c-g-a-b-c"
		}
	})
end