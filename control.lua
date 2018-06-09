require "util"

local TrainEntityList =
	{
		{ name = "electric-locomotive", multi = 1 },
		{ name = "electric-locomotive-mk2", multi = 1.5 },
		{ name = "electric-locomotive-mk3", multi = 2 }
	}
	
	
local ProviderEntityList =
	{
		{ name = "power-provider" }
	}


BasicPower = 10001


local function ONLOAD()
	global.TrainList = global.TrainList or {}
	global.ProviderList = global.ProviderList or {}
end


local function counter( list )
	local i = 0
	for index,element in pairs( list ) do
		i = i + 1
	end
	return i
end 


local function ONTICK()
	local TrainPower = 0
	local ProviderPower = 0
	local RestPower = 0
	local SplitPower = 0
	
	
	if global.TrainList ~= nil and global.ProviderList ~= nil then
	
		for index,element in pairs( global.TrainList ) do
			TrainPower = TrainPower + ( ( BasicPower * element.multi ) - element.train.energy )
			--element.train.insert("test-item")
		end
		for index,element in pairs( global.ProviderList ) do
			ProviderPower = ProviderPower + element.energy
		end
		
		RestPower = ProviderPower - TrainPower
				
		if RestPower >= 0 then
		
			for index,element in pairs( global.TrainList ) do
				element.train.energy = BasicPower * element.multi
			end
			
			SplitPower = RestPower / counter( global.ProviderList )
			
			for index,element in pairs( global.ProviderList ) do
				element.energy = SplitPower
			end
			
		else
		
			for index,element in pairs( global.ProviderList ) do
				element.energy = 0
			end
			
			SplitPower = ProviderPower / counter( global.TrainList)
			
			for index,element in pairs( global.TrainList ) do
				element.train.energy = SplitPower
			end
			
		end
	end
end

local function ONBUILT ( item )
	local entity = item.created_entity
	
	if entity.type == "electric-energy-interface" then
		for index,element in pairs( ProviderEntityList ) do
			if entity.name == element.name then
				table.insert( global.ProviderList, entity )
			end
		end
	end	
	
	if entity.type == "locomotive" then
		for index,element in pairs( TrainEntityList ) do
			if entity.name == element.name then
				table.insert( global.TrainList, { multi = element.multi, train = entity } )
			end
		end
	end
end


local function ONREMOVE ( item )
	local entity = item.entity
	
	if entity.type == "electric-energy-interface" then
		if global.ProviderList ~= nil then
			for index, element in pairs( global.ProviderList ) do
				if entity == element then
					global.ProviderList[index] = nil
				end
			end
		end
	end
		
	if entity.type == "locomotive" then
		if global.TrainList ~= nil then
			for index, element in pairs( global.TrainList ) do
				if entity == element.train then
					global.TrainList[index] = nil
				end
			end
		end
	end
end


script.on_configuration_changed
	( 
		function() 
			ONLOAD() 
			
			if global.TrainsList ~= nil and global.AccuList ~= nil then
			
				for index,element in pairs(global.TrainsList) do
					table.insert( global.TrainList , { multi = element.multi, train = element.entitie } )
				end
				for index,element in pairs(global.AccuList) do
					--element.electric_buffer_size = 10000
					--element.electric_input_flow_limit = 10000		
					table.insert( global.ProviderList , element )
				end
				global.TrainsList = nil
				global.AccuList = nil
			end
		end
	)









script.on_init( function() ONLOAD() end )

script.on_event( defines.events.on_tick, ONTICK )
script.on_event( defines.events.on_built_entity, ONBUILT )
script.on_event( defines.events.on_robot_built_entity, ONBUILT )
script.on_event( defines.events.on_preplayer_mined_item, ONREMOVE )
script.on_event( defines.events.on_robot_pre_mined, ONREMOVE )
script.on_event( defines.events.on_entity_died, ONREMOVE )