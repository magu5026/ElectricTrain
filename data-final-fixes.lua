function UpdateMUControl(train,mu_power)	
	local power = format_number(train.max_power)	
	local energy = power * 1.1

	mu_power.icon = train.icon
	mu_power.localised_name = {"entity-name." .. train.name}
	mu_power.energy_source =
	{
		type = "electric",
		buffer_capacity = (energy * 2) .. "J",
		usage_priority = "secondary-input",
		input_flow_limit = energy .. "J" ,
		drain = power / 10 .. "J" ,
		render_no_network_icon = false,
		render_no_power_icon = false
	}
end

if mods['MultipleUnitTrainControl'] then
	UpdateMUControl(data.raw['locomotive']['et-electric-locomotive-1-mu'],data.raw['electric-energy-interface']['et-electric-locomotive-1-mu-power'])	
	UpdateMUControl(data.raw['locomotive']['et-electric-locomotive-2-mu'],data.raw['electric-energy-interface']['et-electric-locomotive-2-mu-power'])
	UpdateMUControl(data.raw['locomotive']['et-electric-locomotive-3-mu'],data.raw['electric-energy-interface']['et-electric-locomotive-3-mu-power'])
end