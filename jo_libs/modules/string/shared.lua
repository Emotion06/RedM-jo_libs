---@param str stringlib
---@return string str String with first letter in uppercase
function string:firstToUpper()
  if not self then return "" end
  return (self:gsub("^%l", string.upper))
end

function string:split(inSplitPattern, outResults)
  if not outResults then
    outResults = {}
  end
  if not self then return {} end
  local theStart = 1
  local theSplitStart, theSplitEnd = self:find(inSplitPattern, theStart)
  while theSplitStart do
    table.insert(outResults, self:sub(theStart, theSplitStart - 1))
    theStart = theSplitEnd + 1
    theSplitStart, theSplitEnd = self:find(inSplitPattern, theStart)
  end
  table.insert(outResults, self:sub(theStart))
  return outResults
end

function string:convertVersion()
  if not self then return 1 end
  local converted = 0
  if type(self) == "string" then
    local array = self:split("%.")
    local multiplicator = 1
    for i = #array, 1, -1 do
      converted = converted + multiplicator * array[i]
      multiplicator = multiplicator * 1000
    end
  end
  return converted
end

function string:trim()
  if not self then return "" end
  return self:match("^%s*(.-)%s*$")
end

jo.string = {}
return jo.string
