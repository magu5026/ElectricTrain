data:extend(
{
	{
		type = "technology",
		name = "electric-railway",
		icon = "__ElectricTrain__/graphics/tech.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "electric-locomotive"
			},
			{
				type = "unlock-recipe",
				recipe = "power-provider"
			}			
		},
		prerequisites = {"railway", "electric-engine", "battery" },
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
		order = "c-g-a-a",
	},
	
	{
		type = "technology",
		name = "electric-locomotive-mk2",
		icon = "__ElectricTrain__/graphics/tech_mk2.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "electric-locomotive-mk2"
			}			
		},
		prerequisites = {"electric-railway"},
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
		order = "c-g-a-b",
	},
	
	{
		type = "technology",
		name = "electric-locomotive-mk3",
		icon = "__ElectricTrain__/graphics/tech_mk3.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "electric-locomotive-mk3"
			}
		},
		prerequisites = {"electric-locomotive-mk2"},
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
		order = "c-g-a-c",
	},
	
	{
		type = "technology",
		name = "cargo-wagon-mk2",
		icon = "__ElectricTrain__/graphics/railway_mk2.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "cargo-wagon-mk2"
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
		order = "c-g-b-a",
	},
	
	{
		type = "technology",
		name = "cargo-wagon-mk3",
		icon = "__ElectricTrain__/graphics/railway_mk3.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "cargo-wagon-mk3"
			}
		},
		prerequisites = {"cargo-wagon-mk2"},
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
		order = "c-g-b-b",
	},

})