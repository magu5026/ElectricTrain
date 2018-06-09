if not (bobmods and bobmods.logistics) then	
	cargo()
end	


data.raw['item-with-entity-data']['locomotive'].subgroup = "electric-transport"
data.raw['item-with-entity-data']['locomotive'].order = "a"
data.raw['item-with-entity-data']['cargo-wagon'].subgroup = "electric-transport"
data.raw['item-with-entity-data']['cargo-wagon'].order = "b"
data.raw['item-with-entity-data']['fluid-wagon'].subgroup = "electric-transport"
data.raw['item-with-entity-data']['fluid-wagon'].order = "c"