require("lua.events")

function ON_INIT()
	on_init()
end

function ON_CONFIGURATION_CHANGED(data)
	on_configuration_changed(data)
end	

function ON_TICK(event)
	on_tick(event)
end

function ON_BUILT(event)
	on_built(event)
end

function ON_REMOVE(event)
	on_remove(event)
end



script.on_init(ON_INIT)
script.on_configuration_changed(ON_CONFIGURATION_CHANGED)
script.on_event(defines.events.on_tick,ON_TICK)
script.on_event({defines.events.on_built_entity,defines.events.on_robot_built_entity},ON_BUILT)
script.on_event({defines.events.on_pre_player_mined_item,defines.events.on_robot_pre_mined,defines.events.on_entity_died},ON_REMOVE)
script.on_event(defines.events.script_raised_built, function(event)
	if event.created_entity and event.created_entity.valid then
		ON_BUILT(event)
	end
end)
script.on_event(defines.events.script_raised_destroy, function(event)
	if event.entity and event.entity.valid then
		ON_REMOVE(event)
	end
end)
