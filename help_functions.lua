ElectricTrainNameList=
{
"electric-locomotive",
"electric-locomotive-mk2",
"electric-locomotive-mk3"
}
VehicleWagonNameList=
{
"loaded-vehicle-wagon-truck",
"loaded-vehicle-wagon-tarp",
"loaded-vehicle-wagon-car",
"loaded-vehicle-wagon-tank",
"vehicle-wagon"
}

function exists(tab,element)
	for _,v in pairs(tab) do
		if v == element then return true end
	end
	return false
end


function count(list)
	local i = 0
	for _ in pairs(list) do
		i = i + 1
	end
	return i
end 