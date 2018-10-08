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
	prerequisites = {"railway", "electric-engine", "electric-energy-accumulators-1" },
	unit =
	{
		count = 50,
		ingredients =
		{
			{"science-pack-1", 2},
			{"science-pack-2", 2},
			{"science-pack-3", 1},
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
				name = "et-electric-locomotive-mk2",
				icon = "__ElectricTrain__/graphics/tech_mk2.png",
				icon_size = 128,
				effects =
				{
					{
						type = "unlock-recipe",
						recipe = "et-electric-locomotive-mk2"
					}			
				},
				prerequisites = {"et-electric-railway"},
				unit =
				{
					count = 100,
					ingredients =
					{
						{"science-pack-1", 2},
						{"science-pack-2", 2},
						{"science-pack-3", 1},
					},
					time = 20
				},
				order = "c-g-a-a-b",
			},
			{
				type = "technology",
				name = "et-electric-locomotive-mk3",
				icon = "__ElectricTrain__/graphics/tech_mk3.png",
				icon_size = 128,
				effects =
				{
					{
						type = "unlock-recipe",
						recipe = "et-electric-locomotive-mk3"
					}
				},
				prerequisites = {"et-electric-locomotive-mk2", "advanced-electronics-2"},
				unit =
				{
					count = 150,
					ingredients =
					{
						{"science-pack-1", 2},
						{"science-pack-2", 2},
						{"science-pack-3", 1},
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
				name = "et-cargo-wagon-mk2",
				icon = "__ElectricTrain__/graphics/railway_mk2.png",
				icon_size = 128,
				effects =
				{
					{
						type = "unlock-recipe",
						recipe = "et-cargo-wagon-mk2"
					}
				},
				prerequisites = {"railway"},
				unit =
				{
					count = 100,
					ingredients =
					{
						{"science-pack-1", 2},
						{"science-pack-2", 1}				
					},
					time = 20
				},
				order = "c-g-a-a-d",
			},
			{
				type = "technology",
				name = "et-cargo-wagon-mk3",
				icon = "__ElectricTrain__/graphics/railway_mk3.png",
				icon_size = 128,
				effects =
				{
					{
						type = "unlock-recipe",
						recipe = "et-cargo-wagon-mk3"
					}
				},
				prerequisites = {"et-cargo-wagon-mk2"},
				unit =
				{
					count = 100,
					ingredients =
					{
						{"science-pack-1", 2},
						{"science-pack-2", 1},
						{"science-pack-3", 1},
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
				name = "et-fluid-wagon-mk2",
				icon = "__ElectricTrain__/graphics/fluid_mk2.png",
				icon_size = 128,
				effects =
				{
					{
						type = "unlock-recipe",
						recipe = "et-fluid-wagon-mk2"
					}
				},
				prerequisites = {"fluid-wagon"},
				unit =
				{
					count = 100,
					ingredients =
					{
						{"science-pack-1", 2},
						{"science-pack-2", 1}				
					},
					time = 20
				},
				order = "c-g-a-a-f",
			},
			{
				type = "technology",
				name = "et-fluid-wagon-mk3",
				icon = "__ElectricTrain__/graphics/fluid_mk3.png",
				icon_size = 128,
				effects =
				{
					{
						type = "unlock-recipe",
						recipe = "et-fluid-wagon-mk3"
					}
				},
				prerequisites = {"et-fluid-wagon-mk2"},
				unit =
				{
					count = 100,
					ingredients =
					{
						{"science-pack-1", 2},
						{"science-pack-2", 1},
						{"science-pack-3", 1},
					},
					time = 20
				},
				order = "c-g-a-a-g",
			},
		}
	)	
end