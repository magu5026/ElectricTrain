local e_loc = table.deepcopy(data.raw['locomotive']['locomotive'])
e_loc.name = "electric-locomotive"
e_loc.minable = {mining_time = 1, result = "electric-locomotive"}
e_loc.burner =	{
					effectivity = 1,
					fuel_inventory_size = 1
				}

				
local e_loc2 = table.deepcopy(data.raw['locomotive']['locomotive'])
e_loc2.name = "electric-locomotive-mk2"
e_loc2.minable = {mining_time = 1, result = "electric-locomotive-mk2"}
e_loc2.max_health = 1350
e_loc2.max_speed = 1.5
e_loc2.max_power = "900kW"
e_loc2.reversing_power_modifier = 0.8
e_loc2.braking_force = 15
e_loc2.friction_force = 0.375
e_loc2.air_resistance = 0.005625
e_loc2.burner =	{
					effectivity = 1,
					fuel_inventory_size = 2
				}				
				
				
local e_loc3 = table.deepcopy(data.raw['locomotive']['locomotive'])
e_loc3.name = "electric-locomotive-mk3"
e_loc3.minable = {mining_time = 1, result = "electric-locomotive-mk3"}
e_loc3.max_health = 1700
e_loc3.max_speed = 2
e_loc3.max_power = "1200kW"
e_loc3.reversing_power_modifier = 1
e_loc3.braking_force = 20
e_loc3.friction_force = 0.25
e_loc3.air_resistance = 0.00375
e_loc3.burner =	{
					effectivity = 1,
					fuel_inventory_size = 3
				}
				
				
local cargo2 = table.deepcopy(data.raw['cargo-wagon']['cargo-wagon'])				
cargo2.name = "cargo-wagon-mk2"
cargo2.inventory_size = 60				
cargo2.minable = {mining_time = 1, result = "cargo-wagon-mk2"}				
cargo2.max_health = 800
cargo2.weight = 1500
cargo2.max_speed = 2.5
cargo2.braking_force = 4
cargo2.friction_force = 0.375
cargo2.air_resistance = 0.003


local cargo3 = table.deepcopy(data.raw['cargo-wagon']['cargo-wagon'])				
cargo3.name = "cargo-wagon-mk3"
cargo3.inventory_size = 80
cargo3.minable = {mining_time = 1, result = "cargo-wagon-mk3"}				
cargo3.max_health = 1000
cargo3.weight = 2000
cargo3.max_speed = 3.5
cargo3.braking_force = 5
cargo3.friction_force = 0.25
cargo3.air_resistance = 0.002


local provider = table.deepcopy(data.raw['electric-energy-interface']['electric-energy-interface'])	
provider.name = "power-provider"
provider.icon = "__ElectricTrain__/graphics/power-provider-icon.png"
provider.minable = {hardness = 0.2, mining_time = 0.5, result = "power-provider"}
provider.enable_gui = false
provider.allow_copy_paste = false
provider.energy_source =
						{
							type = "electric",
							buffer_capacity = "2000KJ",
							usage_priority = "primary-input",
							input_flow_limit = "2000KW",
							output_flow_limit = "0W"
						}
provider.energy_production = "0W"
provider.picture =
					{
						filename = "__ElectricTrain__/graphics/power-provider.png",
						priority = "extra-high",
						width = 124,
						height = 103,
						shift = {0.6875, -0.203125},
					}


data:extend{e_loc,e_loc2,e_loc3,cargo2,cargo3,provider,test}











