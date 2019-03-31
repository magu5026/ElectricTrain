local electric_railway = table.deepcopy(data.raw['technology']['railway'])
electric_railway.name = "et-electric-railway"
electric_railway.icon = "__ElectricTrain__/graphics/tech.png"
electric_railway.icon_size = 128
electric_railway.effects = 
	{
		{
			type = "unlock-recipe",
			recipe = "et-electric-locomotive-1"
		},
		{
			type = "unlock-recipe",
			recipe = "et-electricity-provider"
		}	
	}
electric_railway.prerequisites = {"railway", "electric-engine", "electric-energy-accumulators", "advanced-electronics"}
electric_railway.unit =
	{
		count = 300,
		ingredients =
		{
			{"automation-science-pack", 1},
			{"logistic-science-pack", 1}
		},
		time = 20
	}
electric_railway.order = "c-g-a-a-a"

data:extend({electric_railway})

function train_tech()
	local electric_railway_2 = table.deepcopy(data.raw['technology']['et-electric-railway'])
	electric_railway_2.name = "et-electric-railway-2"
	electric_railway_2.effects = 
		{
			{
				type = "unlock-recipe",
				recipe = "et-electric-locomotive-2"
			}
		}
	electric_railway_2.prerequisites = {"et-electric-railway", "low-density-structure"}
	electric_railway_2.unit =
		{
			count = 200,
			ingredients =
			{
				{"automation-science-pack", 2},
				{"logistic-science-pack", 2},
				{"chemical-science-pack", 1},
			},
			time = 20
		}
	electric_railway_2.upgrade = true
	electric_railway_2.order = "c-g-a-a-b"

	local electric_railway_3 = table.deepcopy(data.raw['technology']['et-electric-railway'])
	electric_railway_3.name = "et-electric-railway-3"
	electric_railway_3.effects = 
		{
			{
				type = "unlock-recipe",
				recipe = "et-electric-locomotive-3"
			}
		}
	electric_railway_3.prerequisites = {"et-electric-railway-2", "utility-science-pack"}
	electric_railway_3.unit =
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
		}
	electric_railway_3.upgrade = true
	electric_railway_3.order = "c-g-a-a-c"

	data:extend({electric_railway_2, electric_railway_3})
end

function cargo_tech()
	local cargo_wagon_2 = table.deepcopy(data.raw['technology']['railway'])
	cargo_wagon_2.name = "et-cargo-wagon-2"
	cargo_wagon_2.effects = 
		{
			{
				type = "unlock-recipe",
				recipe = "et-cargo-wagon-2"
			}
		}
	cargo_wagon_2.prerequisites = {"railway", "low-density-structure"}
	cargo_wagon_2.unit =
		{
			count = 50,
			ingredients =
			{
				{"automation-science-pack", 3},
				{"logistic-science-pack", 2},
				{"chemical-science-pack", 1}
			},
			time = 20
		}
	cargo_wagon_2.upgrade = true
	cargo_wagon_2.order = "c-g-a-a-d"

	local cargo_wagon_3 = table.deepcopy(data.raw['technology']['railway'])
	cargo_wagon_3.name = "et-cargo-wagon-3"
	cargo_wagon_3.effects = 
		{
			{
				type = "unlock-recipe",
				recipe = "et-cargo-wagon-3"
			}
		}
	cargo_wagon_3.prerequisites = {"et-cargo-wagon-2", "utility-science-pack"}
	cargo_wagon_3.unit =
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
		}
	cargo_wagon_3.upgrade = true
	cargo_wagon_3.order = "c-g-a-a-e"

	data:extend({cargo_wagon_2, cargo_wagon_3})
end


function fluid_tech()
	local fluid_wagon_2 = table.deepcopy(data.raw['technology']['fluid-wagon'])
	fluid_wagon_2.name = "et-fluid-wagon-2"
	fluid_wagon_2.effects = 
		{
			{
				type = "unlock-recipe",
				recipe = "et-fluid-wagon-2"
			}
		}
	fluid_wagon_2.prerequisites = {"fluid-wagon", "low-density-structure"}
	fluid_wagon_2.unit =
		{
			count = 50,
			ingredients =
			{
				{"automation-science-pack", 3},
				{"logistic-science-pack", 2},
				{"chemical-science-pack", 1}
			},
			time = 20
		}
	fluid_wagon_2.upgrade = true
	fluid_wagon_2.order = "c-g-a-a-f"

	local fluid_wagon_3 = table.deepcopy(data.raw['technology']['fluid-wagon'])
	fluid_wagon_3.name = "et-fluid-wagon-3"
	fluid_wagon_3.effects = 
		{
			{
				type = "unlock-recipe",
				recipe = "et-fluid-wagon-3"
			}
		}
	fluid_wagon_3.prerequisites = {"et-fluid-wagon-2", "utility-science-pack"}
	fluid_wagon_3.unit =
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
		}
	fluid_wagon_3.upgrade = true
	fluid_wagon_3.order = "c-g-a-a-g"

	data:extend({fluid_wagon_2, fluid_wagon_3})
end