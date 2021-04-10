local ELEMENT_TEXT_COLOR = 0x363636

local SELECTOR_WIDTH  = 47
local SELECTOR_HEIGHT = 34
---
local rootContainer =
{
    widgetType         = "container",
    xCoordinate        = 3,
    yCoordinate        = 50 - SELECTOR_HEIGHT - 1,
    widgetWidth        = SELECTOR_WIDTH + 1,
    widgetHeight       = SELECTOR_HEIGHT + 1,
}

local widgets = {
    {
        widgetType         = "panel",
        widgetID           = "topPanel",
        xCoordinate        = 1,
        yCoordinate        = 2,
        widgetWidth        = SELECTOR_WIDTH,
        widgetHeight       = 3,
        panelColor         = 0xE2E2E2
    },
    {
        widgetType         = "filesystemTree",
        widgetID           = "fileList",
        xCoordinate        = 1,
        yCoordinate        = 5,
        widgetWidth        = 47,
        widgetHeight       = 31
    },
    {
        widgetType   = "shadow",
        widgetID     = "selectorShadow",
        xCoordinate  = 1,
        yCoordinate  = 2,
        widgetWidth  = SELECTOR_WIDTH,
        widgetHeight = SELECTOR_HEIGHT + 1,
        toDrawTop    = true,
        toDrawRight  = true
    },
    {
        widgetType         = "label",
        widgetID           = "loadFilePrompt",
        xCoordinate        = 1,
        yCoordinate        = 2,
        widgetWidth        = SELECTOR_WIDTH,
        widgetHeight       = 3,
        textColor          = ELEMENT_TEXT_COLOR,
        text               = "Choose a .ywp file to load"
    }
}

-- Returning these two values in a table, to table.unpack() them later
return {rootContainer, widgets}