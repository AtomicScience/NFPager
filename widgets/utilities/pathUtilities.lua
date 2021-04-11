local unicode = require("unicode")

local pathUtilities = {}
-- Three functions below are just a copy from Filesystem API
-- That's because MineOS's Filesystem API does not have them
local function segments(path)
    local parts = {}
    for part in path:gmatch("[^\\/]+") do
      local current, up = part:find("^%.?%.$")
      if current then
        if up == 2 then
          table.remove(parts)
        end
      else
        table.insert(parts, part)
      end
    end
    return parts
end

function pathUtilities.canonical(path)
    local result = table.concat(segments(path), "/")
    if unicode.sub(path, 1, 1) == "/" then
      return "/" .. result
    else
      return result
    end
end

function pathUtilities.concat(...)
    local set = table.pack(...)

    return pathUtilities.canonical(table.concat(set, "/"))
end

return pathUtilities