for index, force in pairs(game.forces) do
	if force.technologies['electric-railway'].researched then
		force.recipes['et-electric-locomotive-mk1'].enabled = true
		force.recipes['et-electricity-provider'].enabled = true
	end
	if force.technologies['et-electric-locomotive-mk2'] and force.technologies['et-electric-locomotive-mk2'].researched then
		force.recipes['et-electric-locomotive-mk2'].enabled = true
	end
	if force.technologies['et-electric-locomotive-mk3'] and force.technologies['et-electric-locomotive-mk3'].researched then
		force.recipes['et-electric-locomotive-mk3'].enabled = true
	end
	if force.technologies['et-cargo-wagon-mk2'] and force.technologies['et-cargo-wagon-mk2'].researched then
		force.recipes['et-cargo-wagon-mk2'].enabled = true
	end
	if force.technologies['et-cargo-wagon-mk3'] and force.technologies['et-cargo-wagon-mk3'].researched then
		force.recipes['et-cargo-wagon-mk3'].enabled = true
	end
	if force.technologies['et-fluid-wagon-mk2'] and force.technologies['et-fluid-wagon-mk2'].researched then
		force.recipes['et-fluid-wagon-mk2'].enabled = true
	end
	if force.technologies['et-fluid-wagon-mk3'] and force.technologies['et-fluid-wagon-mk3'].researched then
		force.recipes['et-fluid-wagon-mk3'].enabled = true
	end
end



