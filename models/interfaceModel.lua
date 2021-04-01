local nfpager = require("umfal")("NFPager.app")
local GUI = require("GUI")
nfpager = nfpager.view.loader.initViews()
--------------------------------------------------------------------------------

local interfaceModel = {}

function interfaceModel.startWorkspace()
    local workspace = interfaceModel.drawInterace()

    workspace:draw()
    workspace:start()
end

function interfaceModel.drawInterace()
    local workspace = GUI.workspace()

    local footer = nfpager.views.footer:newInstance()
    local fileLoader = nfpager.views.fileSelector:newInstance()

    local background = nfpager.widgets.widgetFactory.panel({
        xCoordinate      = 1,
        yCoordinate      = 1,
        widgetWidth      = 160,
        widgetHeight     = 50,
        panelColor       = 0xEEEEEE
    })

    workspace:addChild(background)
    workspace:addChild(fileLoader)
    workspace:addChild(footer)

    return workspace
end


return interfaceModel