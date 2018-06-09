for i, force in pairs(game.forces) do 
 force.reset_technologies()
 force.reset_recipes()
 
end

for _,f in pairs(game.forces) do
	f.recipes["cargo-wagon-mk2"].enabled = false
	f.recipes["cargo-wagon-mk2"].reload()
	f.recipes["cargo-wagon-mk3"].enabled = false
	f.recipes["cargo-wagon-mk3"].reload()
end


for _,f in pairs(game.forces) do
	if f.technologies['cargo-wagon-mk2'] then
		if f.technologies['cargo-wagon-mk2'].researched then 
			f.recipes["cargo-wagon-mk2"].enabled = true
			f.recipes["cargo-wagon-mk2"].reload()
		end
	end

	if f.technologies["cargo-wagon-mk3"] then
		if f.technologies["cargo-wagon-mk3"].researched then
			f.recipes["cargo-wagon-mk3"].enabled = true
			f.recipes["cargo-wagon-mk3"].reload()
		end
	end
end