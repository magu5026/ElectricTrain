local eloc = table.deepcopy(data.raw['item-with-entity-data']['locomotive'])
eloc.name = "electric-locomotive"
eloc.subgroup = "electric-transport-log"
eloc.order = "b"
eloc.place_result = "electric-locomotive"

local eloc2 = table.deepcopy(data.raw['item-with-entity-data']['locomotive'])
eloc2.name = "electric-locomotive-mk2"
eloc2.subgroup = "electric-transport-log"
eloc2.order = "c"
eloc2.place_result = "electric-locomotive-mk2"

local eloc3 = table.deepcopy(data.raw['item-with-entity-data']['locomotive'])
eloc3.name = "electric-locomotive-mk3"
eloc3.subgroup = "electric-transport-log"
eloc3.order = "d"
eloc3.place_result = "electric-locomotive-mk3"


data:extend({eloc,eloc2,eloc3})


local cwag2 = table.deepcopy(data.raw['item-with-entity-data']['cargo-wagon'])
cwag2.name = "cargo-wagon-mk2"
cwag2.subgroup = "electric-transport-cargo"
cwag2.order = "b"
cwag2.place_result = "cargo-wagon-mk2"

local cwag3 = table.deepcopy(data.raw['item-with-entity-data']['cargo-wagon'])
cwag3.name = "cargo-wagon-mk3"
cwag3.subgroup = "electric-transport-cargo"
cwag3.order = "c"
cwag3.place_result = "cargo-wagon-mk3"


data:extend({cwag2,cwag3})	


local fwag2 = table.deepcopy(data.raw['item-with-entity-data']['fluid-wagon'])
fwag2.name = "fluid-wagon-mk2"
fwag2.subgroup = "electric-transport-fluid"
fwag2.order = "b"
fwag2.place_result = "fluid-wagon-mk2"

local fwag3 = table.deepcopy(data.raw['item-with-entity-data']['fluid-wagon'])
fwag3.name = "fluid-wagon-mk3"
fwag3.subgroup = "electric-transport-fluid"
fwag3.order = "c"
fwag3.place_result = "fluid-wagon-mk3"


data:extend({fwag2,fwag3})


local ppro = table.deepcopy(data.raw['item']['accumulator'])
ppro.name = "power-provider"
ppro.icon = "__ElectricTrain__/graphics/power-provider-icon.png"
ppro.subgroup = "electric-transport-log"
ppro.order = "e"
ppro.place_result = "power-provider"


data:extend({ppro})