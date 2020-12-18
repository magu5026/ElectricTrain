for _,force in pairs(game.forces) do
	local tech = force.technologies['et-electric-railway']
	if tech and tech.researched then 
		force.recipes['et-control-station-1'].enabled = true
		force.recipes['et-current-collector'].enabled = true
	end
end	
