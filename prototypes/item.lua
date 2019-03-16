local eloc = table.deepcopy(data.raw['item-with-entity-data']['locomotive'])
eloc.name = "et-electric-locomotive-mk1"
eloc.subgroup = "electric-transport-log"
eloc.order = "b"
eloc.place_result = "et-electric-locomotive-mk1"

local eloc2 = table.deepcopy(data.raw['item-with-entity-data']['locomotive'])
eloc2.name = "et-electric-locomotive-mk2"
eloc2.subgroup = "electric-transport-log"
eloc2.order = "c"
eloc2.place_result = "et-electric-locomotive-mk2"

local eloc3 = table.deepcopy(data.raw['item-with-entity-data']['locomotive'])
eloc3.name = "et-electric-locomotive-mk3"
eloc3.subgroup = "electric-transport-log"
eloc3.order = "d"
eloc3.place_result = "et-electric-locomotive-mk3"

data:extend({eloc,eloc2,eloc3})


local cwag2 = table.deepcopy(data.raw['item-with-entity-data']['cargo-wagon'])
cwag2.name = "et-cargo-wagon-mk2"
cwag2.subgroup = "electric-transport-cargo"
cwag2.order = "b"
cwag2.place_result = "et-cargo-wagon-mk2"

local cwag3 = table.deepcopy(data.raw['item-with-entity-data']['cargo-wagon'])
cwag3.name = "et-cargo-wagon-mk3"
cwag3.subgroup = "electric-transport-cargo"
cwag3.order = "c"
cwag3.place_result = "et-cargo-wagon-mk3"

data:extend({cwag2,cwag3})	


local fwag2 = table.deepcopy(data.raw['item-with-entity-data']['fluid-wagon'])
fwag2.name = "et-fluid-wagon-mk2"
fwag2.subgroup = "electric-transport-fluid"
fwag2.order = "b"
fwag2.place_result = "et-fluid-wagon-mk2"

local fwag3 = table.deepcopy(data.raw['item-with-entity-data']['fluid-wagon'])
fwag3.name = "et-fluid-wagon-mk3"
fwag3.subgroup = "electric-transport-fluid"
fwag3.order = "c"
fwag3.place_result = "et-fluid-wagon-mk3"

data:extend({fwag2,fwag3})


local ppro = table.deepcopy(data.raw['item']['accumulator'])
ppro.name = "et-electricity-provider"
ppro.icon = "__ElectricTrain__/graphics/power-provider-icon.png"
ppro.subgroup = "electric-transport-log"
ppro.order = "e"
ppro.place_result = "et-electricity-provider"

data:extend({ppro})


local fuel = table.deepcopy(data.raw['item']['raw-wood'])
fuel.name = "et-electric-locomotive-fuel"
fuel.flags = {"hidden"}
fuel.fuel_value = "1MJ"

data:extend({fuel})