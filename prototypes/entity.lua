local electric_locomotive_1 = table.deepcopy(data.raw['locomotive']['locomotive'])
electric_locomotive_1.name = "et-electric-locomotive-1"
electric_locomotive_1.icon = "__ElectricTrain__/graphics/loc1.png"
electric_locomotive_1.minable.result = "et-electric-locomotive-1"
electric_locomotive_1.burner = {fuel_inventory_size = 0}

local electric_locomotive_2 = table.deepcopy(data.raw['locomotive']['locomotive'])
electric_locomotive_2.name = "et-electric-locomotive-2"
electric_locomotive_2.icon = "__ElectricTrain__/graphics/loc2.png"
electric_locomotive_2.minable.result = "et-electric-locomotive-2"
electric_locomotive_2.burner = {fuel_inventory_size = 0}
electric_locomotive_2.max_health = 1350
electric_locomotive_2.max_speed = 1.8		--216*1.8 = 388.8
electric_locomotive_2.max_power = "900kW"
electric_locomotive_2.reversing_power_modifier = 0.8
electric_locomotive_2.braking_force = 15
electric_locomotive_2.friction_force = 0.375
electric_locomotive_2.air_resistance = 0.005625

local electric_locomotive_3 = table.deepcopy(data.raw['locomotive']['locomotive'])
electric_locomotive_3.name = "et-electric-locomotive-3"
electric_locomotive_3.icon = "__ElectricTrain__/graphics/loc3.png"
electric_locomotive_3.minable.result = "et-electric-locomotive-3"
electric_locomotive_3.burner = {fuel_inventory_size = 0}
electric_locomotive_3.max_health = 1700
electric_locomotive_3.max_speed = 2.4		--216*2.4 = 518.4
electric_locomotive_3.max_power = "1200kW"
electric_locomotive_3.reversing_power_modifier = 1
electric_locomotive_3.braking_force = 20
electric_locomotive_3.friction_force = 0.25
electric_locomotive_3.air_resistance = 0.00375

data:extend({electric_locomotive_1,electric_locomotive_2,electric_locomotive_3})


data:extend
({
	{
		type = "electric-energy-interface",
		name = "et-control-station-1",
		icon = "__ElectricTrain__/graphics/relais-icon-1.png",
		icon_size = 32,
		flags = {"placeable-neutral", "player-creation"},
		minable = {mining_time = 1, result = "et-control-station-1"},
		max_health = 100,
		corpse = "small-remnants",
		collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
		selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
		fast_replaceable_group = "electric-energy-interface",
		vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		energy_source =
		{
			type = "electric",
			buffer_capacity = "200KW",
			usage_priority = "secondary-input",
		},
		energy_usage = "100KW",
		picture =
		{
			filename = "__ElectricTrain__/graphics/relais-1.png",
			priority = "low",
			width = 196,
			height = 254,
			shift = util.by_pixel(1, -16),
			scale = 0.5			
		}
	}
})


local cargo_wagon_2 = table.deepcopy(data.raw['cargo-wagon']['cargo-wagon'])
cargo_wagon_2.name = "et-cargo-wagon-2"
cargo_wagon_2.icon = "__ElectricTrain__/graphics/cargo2.png"
cargo_wagon_2.inventory_size = 60
cargo_wagon_2.minable.result = "et-cargo-wagon-2"
cargo_wagon_2.max_health = 800
cargo_wagon_2.weight = 1500
cargo_wagon_2.max_speed = 1.8
cargo_wagon_2.braking_force = 4
cargo_wagon_2.friction_force = 0.375
cargo_wagon_2.air_resistance = 0.003

local cargo_wagon_3 = table.deepcopy(data.raw['cargo-wagon']['cargo-wagon'])
cargo_wagon_3.name = "et-cargo-wagon-3"
cargo_wagon_3.icon = "__ElectricTrain__/graphics/cargo3.png"
cargo_wagon_3.inventory_size = 80
cargo_wagon_3.minable.result = "et-cargo-wagon-3"
cargo_wagon_3.max_health = 1000
cargo_wagon_3.weight = 2000
cargo_wagon_3.max_speed = 2.4
cargo_wagon_3.braking_force = 5
cargo_wagon_3.friction_force = 0.25
cargo_wagon_3.air_resistance = 0.002

data:extend({cargo_wagon_2,cargo_wagon_3})


local fluid_wagon_2 = table.deepcopy(data.raw['fluid-wagon']['fluid-wagon'])
fluid_wagon_2.name = "et-fluid-wagon-2"
fluid_wagon_2.icon = "__ElectricTrain__/graphics/fluid2.png"
fluid_wagon_2.capacity = 25000 * 1.5
fluid_wagon_2.minable.result = "et-fluid-wagon-2"
fluid_wagon_2.max_health = 800
fluid_wagon_2.weight = 1500
fluid_wagon_2.max_speed = 1.8
fluid_wagon_2.braking_force = 4
fluid_wagon_2.friction_force = 0.375
fluid_wagon_2.air_resistance = 0.003

local fluid_wagon_3 = table.deepcopy(data.raw['fluid-wagon']['fluid-wagon'])
fluid_wagon_3.name = "et-fluid-wagon-3"
fluid_wagon_3.icon = "__ElectricTrain__/graphics/fluid3.png"
fluid_wagon_3.capacity = 25000 * 2
fluid_wagon_3.minable.result = "et-fluid-wagon-3"
fluid_wagon_3.max_health = 1000
fluid_wagon_3.weight = 2000
fluid_wagon_3.max_speed = 2.4
fluid_wagon_3.braking_force = 5
fluid_wagon_3.friction_force = 0.25
fluid_wagon_3.air_resistance = 0.002

data:extend({fluid_wagon_2,fluid_wagon_3})


function format_number(number_string)
	local number = number_string:match('%d+%.?%d+')
	local append_suffix = number_string:match('%a+')
	
	local pre = ""
	local typ = ""
	
	if append_suffix:len() == 2 then
		pre =  append_suffix:sub(1, 1):upper()
		typ =  append_suffix:sub(2):upper()
	elseif append_suffix:len() == 1 then
		typ = append_suffix:upper()
	end

	
	if pre == "K" then
		number = number * 1000
	elseif pre == "M" then
		number = number * 1000000
	end
		
	if typ == "W" then
		number = number / 60
	end
	return number
end

function CreateTrainInterface(train)	
	local power = format_number(train.max_power)	
	local energy = power * 1.1

	data:extend(
	{
		{
			type = "electric-energy-interface",
			name = train.name .. "-power",
			icon = train.icon,
			icon_size = 32,
			localised_name = {"entity-name." .. train.name},
			collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
			selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
			collision_mask = {"ground-tile"},
			selectable_in_game = false,
			energy_source =
			{
				type = "electric",
				buffer_capacity = (energy * 2) .. "J",
				usage_priority = "secondary-input",
				input_flow_limit = energy .. "J" ,
				drain = power / 10 .. "J" ,
				render_no_network_icon = false,
				render_no_power_icon = false
			},
			picture =
			{
				filename = "__core__/graphics/empty.png",
				priority = "extra-high",
				width = 1,
				height = 1
			},
			order = "z"
		}
	})
end

CreateTrainInterface(data.raw['locomotive']['et-electric-locomotive-1'])	
CreateTrainInterface(data.raw['locomotive']['et-electric-locomotive-2'])
CreateTrainInterface(data.raw['locomotive']['et-electric-locomotive-3'])

function InsertMUControl(name)
	data:extend(
	{
		{
			type = "electric-energy-interface",
			name = name .. "-power",
			icon = "__core__/graphics/empty.png",
			icon_size = 32,
			collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
			selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
			collision_mask = {"ground-tile"},
			selectable_in_game = false,
			energy_source =
			{
				type = "void"
			},
			picture =
			{
				filename = "__core__/graphics/empty.png",
				priority = "extra-high",
				width = 1,
				height = 1
			},
			order = "z"
		}
	})
end

if mods['MultipleUnitTrainControl'] then
	InsertMUControl("et-electric-locomotive-1-mu")
	InsertMUControl("et-electric-locomotive-2-mu")
	InsertMUControl("et-electric-locomotive-3-mu")
end