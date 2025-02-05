local nfpager = require("umfal")("NFPager.app")
local GUI = require("GUI")
nfpager = nfpager.view.loader.initViews()
--------------------------------------------------------------------------------

local interface = {}

function interface.startWorkspace()
    interface.workspace = interface.constructInterface()

    interface.workspace:draw()
    interface.workspace:start()
end

function interface.constructInterface()
    local workspace = GUI.workspace()

    interface.footer = nfpager.views.footer:newInstance()
    -- interface.fileLoader = nfpager.views.fileSelector:newInstance()

    local background = nfpager.widgets.widgetFactory.panel({
        xCoordinate      = 1,
        yCoordinate      = 1,
        widgetWidth      = 160,
        widgetHeight     = 50,
        panelColor       = 0xEEEEEE
    })

    workspace:addChild(background)
    -- workspace:addChild(interface.fileLoader)
    workspace:addChild(interface.footer)

    return workspace
end


return interface