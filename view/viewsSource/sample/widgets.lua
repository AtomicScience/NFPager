local nfpager = require("umfal")("NFPager.app")
local widgetConstructor = nfpager.utilities.widgetConstructor

---
local function rootContainer()
    return widgetConstructor.container({
        xCoordinate        = 1,
        yCoordinate        = 1,
        widgetWidth        = 160,
        widgetHeight       = 50
    })
end

local widgets = {}

function widgets.backgroundPanel()
    return widgetConstructor.panel({
        xCoordinate        = 3,
        yCoordinate        = 2,
        widgetWidth        = 156,
        widgetHeight       = 48,
        panelColor         = 0xEE0000
    })
end

return {rootContainer, widgets}