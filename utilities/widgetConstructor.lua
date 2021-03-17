local GUI = require("GUI")
local nfpager = require("umfal")("NFPager.app")

local widgetConstructor = {}

function widgetConstructor.constructFromTableProperty(tbl)
    return widgetConstructor[tbl.widgetType](tbl), tbl.widgetID
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
function widgetConstructor.button(tbl)
    return GUI.button(tbl.xCoordinate, tbl.yCoordinate, tbl.widgetWidth, tbl.widgetHeight, tbl.buttonColor, tbl.textColor, tbl.pressedButtonColor, tbl.pressedTextColor, tbl.buttonText)
end

--[[{
    xCoordinate        =
    yCoordinate        =
    widgetWidth        =
    widgetHeight       =
} ]]
function widgetConstructor.container(tbl)
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
function widgetConstructor.panel(tbl)
    tbl.panelTransparency = tbl.panelTransparency or 0
    return GUI.panel(tbl.xCoordinate, tbl.yCoordinate, tbl.widgetWidth, tbl.widgetHeight, tbl.panelColor, tbl.panelTransparency)
end

--[[{
    xCoordinate        =
    yCoordinate        =
    textColor          =
    text               =
} ]]
function widgetConstructor.text(tbl)
    tbl.text = tbl.text or "PLACEHOLDER"
    return GUI.text(tbl.xCoordinate, tbl.yCoordinate, tbl.textColor, tbl.text)
end

return widgetConstructor