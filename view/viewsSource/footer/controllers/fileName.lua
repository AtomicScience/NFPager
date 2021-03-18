local GUI = require("GUI")
local nfpager = require("umfal")("NFPager.app")

local fileName = {}

fileName.eventHandler = function(workspace, object, eventName, ...)
    if eventName == "touch" then
        GUI.alert(...)
    end
end

return fileName