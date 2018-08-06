require("lua.basic_event_handler")
require("lua.logic_event_handler")


-- basic_event_handler
---------------------------------------------------------------------------------------------------

script.on_init(OnInit)
script.on_configuration_changed(OnConfigurationChanged)


-- logic_event_handler
---------------------------------------------------------------------------------------------------

script.on_event(defines.events.on_tick,OnTick)
script.on_event({defines.events.on_built_entity,defines.events.on_robot_built_entity,defines.events.script_raised_built},OnBuilt)