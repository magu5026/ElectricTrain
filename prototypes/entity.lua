data:extend({
util.merge{data.raw.locomotive.locomotive,
		{
			name = "et-electric-locomotive-1",
			minable = {mining_time = 0.5, result = "et-electric-locomotive-1"},
			burner = {fuel_inventory_size = 1}
		}
	}
})

local electric_locomotive_1 = table.deepcopy(data.raw['locomotive']['locomotive'])
electric_locomotive_1.name = "et-electric-locomotive-1"
electric_locomotive_1.minable.result = "et-electric-locomotive-1"
electric_locomotive_1.burner =	{effectivity = 1, fuel_inventory_size = 1}

				
local electric_locomotive_2 = table.deepcopy(data.raw['locomotive']['locomotive'])
electric_locomotive_2.name = "et-electric-locomotive-2"
electric_locomotive_2.minable.result = "et-electric-locomotive-2"
electric_locomotive_2.max_health = 1350
electric_locomotive_2.max_speed = 1.8		--216*1.8 = 388.8
electric_locomotive_2.max_power = "900kW"
electric_locomotive_2.reversing_power_modifier = 0.8
electric_locomotive_2.braking_force = 15
electric_locomotive_2.friction_force = 0.375
electric_locomotive_2.air_resistance = 0.005625
electric_locomotive_2.burner =	{effectivity = 1, fuel_inventory_size = 2}				
				
				
local electric_locomotive_3 = table.deepcopy(data.raw['locomotive']['locomotive'])
electric_locomotive_3.name = "et-electric-locomotive-3"
electric_locomotive_3.minable.result = "et-electric-locomotive-3"
electric_locomotive_3.max_health = 1700
electric_locomotive_3.max_speed = 2.4		--216*2.4 = 518.4
electric_locomotive_3.max_power = "1200kW"
electric_locomotive_3.reversing_power_modifier = 1
electric_locomotive_3.braking_force = 20
electric_locomotive_3.friction_force = 0.25
electric_locomotive_3.air_resistance = 0.00375
electric_locomotive_3.burner =	{effectivity = 1, fuel_inventory_size = 3}
	

--data:extend({electric_locomotive_1,electric_locomotive_2,electric_locomotive_3})
data:extend({electric_locomotive_2,electric_locomotive_3})
	
				
local cargo_wagon_2 = table.deepcopy(data.raw['cargo-wagon']['cargo-wagon'])				
cargo_wagon_2.name = "et-cargo-wagon-2"
cargo_wagon_2.inventory_size = 60				
cargo_wagon_2.minable.result = "et-cargo-wagon-2"			
cargo_wagon_2.max_health = 800
cargo_wagon_2.weight = 1500
cargo_wagon_2.max_speed = 2.25
cargo_wagon_2.braking_force = 4
cargo_wagon_2.friction_force = 0.375
cargo_wagon_2.air_resistance = 0.003


local cargo_wagon_3 = table.deepcopy(data.raw['cargo-wagon']['cargo-wagon'])				
cargo_wagon_3.name = "et-cargo-wagon-3"
cargo_wagon_3.inventory_size = 80
cargo_wagon_3.minable.result = "et-cargo-wagon-3"			
cargo_wagon_3.max_health = 1000
cargo_wagon_3.weight = 2000
cargo_wagon_3.max_speed = 3
cargo_wagon_3.braking_force = 5
cargo_wagon_3.friction_force = 0.25
cargo_wagon_3.air_resistance = 0.002


local fluid_wagon_2 = table.deepcopy(data.raw['fluid-wagon']['fluid-wagon'])				
fluid_wagon_2.name = "et-fluid-wagon-2"
fluid_wagon_2.capacity = 25000 * 1.5
fluid_wagon_2.minable.result = "et-fluid-wagon-2"
fluid_wagon_2.max_health = 800
fluid_wagon_2.weight = 1500
fluid_wagon_2.max_speed = 2.25
fluid_wagon_2.braking_force = 4
fluid_wagon_2.friction_force = 0.375
fluid_wagon_2.air_resistance = 0.003


local fluid_wagon_3 = table.deepcopy(data.raw['fluid-wagon']['fluid-wagon'])				
fluid_wagon_3.name = "et-fluid-wagon-3"
fluid_wagon_3.capacity = 25000 * 2
fluid_wagon_3.minable.result = "et-fluid-wagon-3"
fluid_wagon_3.max_health = 1000
fluid_wagon_3.weight = 2000
fluid_wagon_3.max_speed = 3
fluid_wagon_3.braking_force = 5
fluid_wagon_3.friction_force = 0.25
fluid_wagon_3.air_resistance = 0.003


data:extend({cargo_wagon_2,cargo_wagon_3,fluid_wagon_2,fluid_wagon_3})


local electricity_provider = table.deepcopy(data.raw['electric-energy-interface']['electric-energy-interface'])	
electricity_provider.name = "et-electricity-provider"
electricity_provider.icon = "__ElectricTrain__/graphics/power-provider-icon.png"
electricity_provider.minable.result = "et-electricity-provider"
electricity_provider.gui_mode = nil
electricity_provider.allow_copy_paste = false
electricity_provider.energy_source =
						{
							type = "electric",
							buffer_capacity = "2000KJ",
							usage_priority = "secondary-input",
							input_flow_limit = "2100KW",
							output_flow_limit = "0W"
						}
electricity_provider.energy_production = "0W"
electricity_provider.energy_usage = "100KW"
electricity_provider.drain = "200KW"
electricity_provider.picture =
					{
						filename = "__ElectricTrain__/graphics/power-provider.png",
						priority = "extra-high",
						width = 124,
						height = 103,
						shift = {0.6875, -0.203125},
					}


data:extend({electricity_provider})