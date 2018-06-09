ElectricTrains = ElectricTrains or {}
ElectricTrains.Trains = ElectricTrains.Trains or {}
ElectricTrains.Functions = ElectricTrains.Functions or {}

MaxPower = 10666.6666666667


function ElectricTrains.Functions.ADDTRAIN ( nama, multie )
	table.insert( ElectricTrains.Trains, { name = nama, multy = multie } )
end


ElectricTrains.Functions.ADDTRAIN( "electric-locomotive", 1 )
ElectricTrains.Functions.ADDTRAIN( "electric-locomotive-mk2", 1.5 )
ElectricTrains.Functions.ADDTRAIN( "electric-locomotive-mk3", 2 )


local function ONLOAD ()
	global.TrainsList = global.TrainsList or {}
	global.AccuList = global.AccuList or {}
end


local function ONTICK ()
	local PowerNeed = 0
	local PowerStorage = 0
	local PowerAvaible = 0
	local PowerPer = 0
	if global.TrainsList ~= nil and global.AccuList ~= nil then
		for _, p in pairs( global.TrainsList ) do
			PowerNeed = PowerNeed + ( ( MaxPower * p.multi ) - p.entitie.energy )
		end
		for _, p in pairs( global.AccuList ) do
			PowerStorage = PowerStorage + p.energy
		end
		PowerAvaible = PowerStorage - PowerNeed
		if PowerAvaible >= 0 then
			for _, p in pairs( global.TrainsList ) do
				p.entitie.energy = MaxPower * p.multi
			end
			PowerPer = PowerAvaible / #global.AccuList
			for _, p in pairs( global.AccuList ) do
				p.energy = PowerPer
			end
		else
			for _, p in pairs( global.AccuList ) do
				p.energy = 0
			end
			PowerPer = ( PowerNeed + PowerAvaible ) / #global.TrainsList
			for _, p in pairs( global.TrainsList ) do
				p.entitie.energy = PowerPer
			end
		end
	end
end


local function ONBUILT ( event )
	local entity = event.created_entity
	if entity.name == "power-provider" then
		table.insert( global.AccuList, entity )
	end
	if entity.type == "locomotive" then
		for _, o in pairs( ElectricTrains.Trains ) do
			if entity.name == o.name then
				table.insert( global.TrainsList, { multi = o.multy, entitie = entity } )
			end
		end
	end

end


local function ONREMOVE ( event )
	local entity = event.entity
	if entity.name == "power-provider" then
		if global.AccuList ~= nil then
			for index, l in pairs( global.AccuList ) do
				if entity == l then
					global.AccuList[index] = nil
				end
			end
		end
	end
	if entity.type == "locomotive" then
		if global.TrainsList ~= nil then
			for index, l in pairs( global.TrainsList ) do
				if entity == l.entitie then
					global.TrainsList[index] = nil
				end
			end
		end
	end
end


script.on_configuration_changed( function() ONLOAD() end )


script.on_init( function()
	ONLOAD()
end )


script.on_event( defines.events.on_tick, ONTICK )
script.on_event( defines.events.on_built_entity, ONBUILT )
script.on_event( defines.events.on_robot_built_entity, ONBUILT )
script.on_event( defines.events.on_preplayer_mined_item, ONREMOVE )
script.on_event( defines.events.on_robot_pre_mined, ONREMOVE )
script.on_event( defines.events.on_entity_died, ONREMOVE )