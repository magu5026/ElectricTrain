function IsModChanged(data,modname)
	if data 
	 and data.mod_changes 
	 and data.mod_changes[modname] 
	 and data.mod_changes[modname].old_version then 
		return true 
	end
	return false
end

function GetOldVersion(data,modname)
	return FormatVersion(data.mod_changes[modname].old_version)
end

function GetNewVersion(data,modname)
	return FormatVersion(data.mod_changes[modname].new_version)
end

function FormatVersion(version)
	return string.format("%02d.%02d.%02d", string.match(version, "(%d+).(%d+).(%d+)"))
end

function table.contains(self,item)
	for _,v in pairs(self) do
		if v == item then
			return true
		elseif type(v) == "table" then
			if table.contains(v,item) then
				return true
			end
		end
	end
	return false
end

function table.count(self)
	if self == nil or self == {} then return 0 end
		
	local i = 0
	for _ in pairs(self) do
		i = i + 1
	end
	return i
end