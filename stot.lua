local tins = table.insert
local tableStr = '{ _player = "aPLayeear", _mode = "urMom", _name = "Pistol", _df = false}' --your string here
local char = {
	EQU_SIGN = "=",
	SPACE = " ",
	QUOTE = '"',
	t = 't'
}

local function getCharTable(tableStr)
	local tableStrLen = string.len(tableStr)
	local charTable = {}
	for i = 1,tableStrLen do
		local thisChar = string.sub(tableStr, i, i)
		tins(charTable, thisChar)
	end

	return charTable
end

local function stringToTable(tableStr)
	local charTable = getCharTable(tableStr)
	local actualTable = {}
	
	for chari, charv in pairs(charTable) do
		if charv == char.EQU_SIGN then
			local kEnd = chari-2
			local kStart = kEnd
			local key = ""
			while charTable[kStart] ~= char.SPACE do
				kStart -= 1
			end
			for i = kStart,kEnd do
				key = key..charTable[i]
			end
			local vStart = chari+2
			local vEnd = vStart
			local value
			if charTable[vStart] == char.QUOTE then
				vStart += 1
				value = ""
				vEnd += 1
				while charTable[vEnd] ~= char.QUOTE do
					vEnd += 1
				end
				for i = vStart,vEnd-1 do
					value = value..charTable[i]
				end
				print(value)
			else
				if charTable[vStart] == char.t then
					value = true
				else
					value = false
				end
			end
			actualTable[key] = value
		end
	end
	
	return actualTable
end

local actualTable = stringToTable(tableStr) --turns a string into a table
for k,v in pairs(actualTable) do --print for proof
	print(k.." "..tostring(v))
end
