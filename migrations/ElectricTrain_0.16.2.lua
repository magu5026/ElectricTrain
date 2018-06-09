for index, force in pairs(game.forces) do
	if force.technologies["electric-railway"].researched then
		force.recipes['electric-locomotive-mk1'].enabled = true
	end
end