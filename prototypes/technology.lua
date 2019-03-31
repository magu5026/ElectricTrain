data:extend
({{
	type = "technology",
	name = "et-electric-railway",
	icon = "__ElectricTrain__/graphics/tech.png",
	icon_size = 128,
	effects =
	{
		{
			type = "unlock-recipe",
			recipe = "et-electric-locomotive-mk1"
		},
		{
			type = "unlock-recipe",
			recipe = "et-electricity-provider"
		}			
	},
	prerequisites = {"railway", "electric-engine", "electric-energy-accumulators-1", "advanced-electronics"},
	unit =
	{
		count = 300,
		ingredients =
		{
			{"automation-science-pack", 1},
			{"logistic-science-pack", 1}
		},
		time = 20
	},
	order = "c-g-a-a-a",
}})


function train_tech()
	data:extend(
		{
			{
				type = "technology",
				name = "et-electric-locomotive-2",
				icon = "__ElectricTrain__/graphics/tech_mk2.png",
				icon_size = 128,
				effects =
				{
					{
						type = "unlock-recipe",
						recipe = "et-electric-locomotive-mk2"
					}			
				},
				prerequisites = {"et-electric-railway", "low-density-structure"},
				unit =
				{
					count = 200,
					ingredients =
					{
						{"automation-science-pack", 2},
						{"logistic-science-pack", 2},
						{"chemical-science-pack", 1},
					},
					time = 20
				},
				order = "c-g-a-a-b",
			},
			{
				type = "technology",
				name = "et-electric-locomotive-3",
				icon = "__ElectricTrain__/graphics/tech_mk3.png",
				icon_size = 128,
				effects =
				{
					{
						type = "unlock-recipe",
						recipe = "et-electric-locomotive-mk3"
					}
				},
				prerequisites = {"et-electric-locomotive-2", "utility-science-pack"},
				unit =
				{
					count = 200,
					ingredients =
					{
						{"automation-science-pack", 3},
						{"logistic-science-pack", 3},
						{"chemical-science-pack", 1},
						{"utility-science-pack", 1}
					},
					time = 20
				},
				order = "c-g-a-a-c",
			},
		}
	)
end

function cargo_tech()
	data:extend(
		{
			{			
				type = "technology",
				name = "et-cargo-wagon-2",
				icon = "__ElectricTrain__/graphics/railway_mk2.png",
				icon_size = 128,
				effects =
				{
					{
						type = "unlock-recipe",
						recipe = "et-cargo-wagon-mk2"
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
						{"chemical-science-pack", 1}						
					},
					time = 20
				},
				order = "c-g-a-a-d",
			},
			{
				type = "technology",
				name = "et-cargo-wagon-3",
				icon = "__ElectricTrain__/graphics/railway_mk3.png",
				icon_size = 128,
				effects =
				{
					{
						type = "unlock-recipe",
						recipe = "et-cargo-wagon-mk3"
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
					time = 20
				},
				order = "c-g-a-a-e",
			},
		}
	)	
end


function fluid_tech()
	data:extend(
		{
			{			
				type = "technology",
				name = "et-fluid-wagon-2",
				icon = "__ElectricTrain__/graphics/fluid_mk2.png",
				icon_size = 128,
				effects =
				{
					{
						type = "unlock-recipe",
						recipe = "et-fluid-wagon-mk2"
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
						{"chemical-science-pack", 1}
					},
					time = 20
				},
				order = "c-g-a-a-f",
			},
			{
				type = "technology",
				name = "et-fluid-wagon-3",
				icon = "__ElectricTrain__/graphics/fluid_mk3.png",
				icon_size = 128,
				effects =
				{
					{
						type = "unlock-recipe",
						recipe = "et-fluid-wagon-mk3"
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
					time = 20
				},
				order = "c-g-a-a-g",
			},
		}
	)	
end