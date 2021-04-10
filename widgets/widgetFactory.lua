local GUI = require("GUI")
local nfpager = require("umfal")("NFPager.app")

local widgetFactory = {}

function widgetFactory.constructFromTableProperty(tbl)
    return widgetFactory[tbl.widgetType](tbl), tbl.widgetID
end

--[[{
    xCoordinate        =
    yCoordinate        =
    widgetWidth        =
    widgetHeight       =
    buttonColor        =
    textColor          =
    pressedButtonColor =
    pressedTextColor   =
    buttonText         =
} ]]
function widgetFactory.button(tbl)
    return GUI.button(tbl.xCoordinate, tbl.yCoordinate, tbl.widgetWidth, tbl.widgetHeight, tbl.buttonColor, tbl.textColor, tbl.pressedButtonColor, tbl.pressedTextColor, tbl.buttonText)
end

--[[{
    xCoordinate        =
    yCoordinate        =
    widgetWidth        =
    widgetHeight       =
} ]]
function widgetFactory.container(tbl)
    return GUI.container(tbl.xCoordinate, tbl.yCoordinate, tbl.widgetWidth, tbl.widgetHeight)
end

--[[{
    xCoordinate        =
    yCoordinate        =
    widgetWidth        =
    widgetHeight       =
    panelColor         =
    panelTransparency  =
} ]]
function widgetFactory.panel(tbl)
    tbl.panelTransparency = tbl.panelTransparency or 0
    return GUI.panel(tbl.xCoordinate, tbl.yCoordinate, tbl.widgetWidth, tbl.widgetHeight, tbl.panelColor, tbl.panelTransparency)
end

--[[{
    xCoordinate        =
    yCoordinate        =
    textColor          =
    text               =
} ]]
function widgetFactory.text(tbl)
    tbl.text = tbl.text or "PLACEHOLDER"
    return GUI.text(tbl.xCoordinate, tbl.yCoordinate, tbl.textColor, tbl.text)
end

--[[{
    xCoordinate              =
    yCoordinate              =
    widgetWidth              =
    widgetHeight             =
    backgroundColor          =
    directoryColor           =
    arrowColor               =
    backgroundSelectionColor =
    textSelectionColor       =
    arrowSelectionColor      =
    disabledColor            =
    scrollBarBackground      =
    scrollBarForeground      =
    filesystemShowMode       =
    filesystemSelectionMode  =
} ]]
function widgetFactory.filesystemTree(tbl)
    tbl.backgroundColor = tbl.backgroundColor or 0xCCCCCC
    tbl.directoryColor  = tbl.directoryColor  or 0x3C3C3C
    tbl.arrowColor      = tbl.arrowColor      or 0x3C3C3C
    tbl.disabledColor   = tbl.disabledColor   or 0xBBBBBB

    tbl.backgroundSelectionColor = tbl.backgroundSelectionColor or 0x999999
    tbl.textSelectionColor       = tbl.textSelectionColor       or 0x3C3C3C
    tbl.arrowSelectionColor      = tbl.arrowSelectionColor      or 0xE1E1E1
    tbl.scrollBarBackground      = tbl.scrollBarBackground      or 0xAAAAAA
    tbl.scrollBarForeground      = tbl.scrollBarForeground      or 0xBBBBBB

    tbl.filesystemShowMode      = tbl.filesystemShowMode      or GUI.IO_MODE_BOTH
    tbl.filesystemSelectionMode = tbl.filesystemSelectionMode or GUI.IO_MODE_BOTH

    return GUI.filesystemTree(tbl.xCoordinate, tbl.yCoordinate, tbl.widgetWidth, tbl.widgetHeight, tbl.backgroundColor, tbl.directoryColor, tbl.arrowColor, tbl.backgroundSelectionColor, tbl.textSelectionColor, tbl.arrowSelectionColor, tbl.disabledColor, tbl.scrollBarBackground, tbl.scrollBarForeground, tbl.filesystemShowMode, tbl.filesystemSelectionMode)
end

--[[{
    xCoordinate              =
    yCoordinate              =
    widgetWidth              =
    widgetHeight             =
    toDrawTop                =
    toDrawRight              =
    toDrawBottom             =
    toDrawLeft               =
} ]]
function widgetFactory.shadow(tbl)
    return nfpager.widgets.custom.shadow.newInstance(tbl)
end

--[[{
    xCoordinate   =
    yCoordinate   =
    widgetWidth   =
    widgetHeight  =
    textColor     =
    text          =
    horizontal    =
    vertical      =
} ]]
function widgetFactory.label(tbl)
    tbl.text = tbl.text or "PLACEHOLDER"

    local horizontalAlignment, verticalAlignment = nfpager.widgets.utilities.labelAlignment.getValuesFor(tbl)

    local label = GUI.label(tbl.xCoordinate, tbl.yCoordinate, tbl.widgetWidth, tbl.widgetHeight, tbl.textColor, tbl.text)
    label:setAlignment(horizontalAlignment, verticalAlignment)

    return label
end

-- TODO: properly implement this method
function widgetFactory.addFilesystemDialog(tbl)
    local filesystemDialog = GUI.addFilesystemDialog(nfpager.models.interface.workspace, true, 50, 40, "Open", "Cancel", "File name", "/")
    filesystemDialog.onSubmit = tbl.onSubmitFunction
    filesystemDialog.onCancel = tbl.onCancelFunction

    -- That's a tricky way to get the background panel object
    -- Refer to /Libraries/GUI.lua:2012 and :3514
    local backgroundPanel = filesystemDialog.parent.panel

    nfpager.models.shortcuts.lock()
    backgroundPanel.eventHandler = function(parentContainer, object, e1)
        if e1 == "touch" then
            -- Two lines below are just a copy of the default panel method (/Libraries/GUI.lua:3516)
            backgroundPanel.parent:remove()
            backgroundPanel.parent.parent:draw()

            tbl.onCancelFunction()
        end
    end
    nfpager.models.shortcuts.unlock()

    filesystemDialog:show()
    -- filesystemDialog:addExtensionFilter(".nfp")
end

return widgetFactory