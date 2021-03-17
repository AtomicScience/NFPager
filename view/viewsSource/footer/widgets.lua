local FOOTER_COLOR = 0xFAFAFA

local FILENAME_TEXT_COLOR = 0x262626
local ELEMENT_TEXT_COLOR = 0x363636

local NEW_FILE_BUTTON_COLOR = 0x66FF00
local SAVE_BUTTON_COLOR = 0xFFDB40
local CLOSE_BUTTON_COLOR = 0xFF2440
---
local rootContainer =
{
    widgetType         = "container",
    xCoordinate        = 1,
    yCoordinate        = 50,
    widgetWidth        = 160,
    widgetHeight       = 1
}

local widgets = {
    {
        widgetType         = "panel",
        widgetID           = "backgroundPanel",
        xCoordinate        = 1,
        yCoordinate        = 1,
        widgetWidth        = 160,
        widgetHeight       = 1,
        panelColor         = FOOTER_COLOR
    },
    {
        widgetType  = "text",
        widgetID    = "fileName",
        xCoordinate = 1,
        yCoordinate = 1,
        textColor   = FILENAME_TEXT_COLOR
    },
    {
        widgetType  = "text",
        widgetID    = "elementName",
        xCoordinate = 60,
        yCoordinate = 1,
        textColor = ELEMENT_TEXT_COLOR
    },
    {
        widgetType         = "button",
        widgetID           = "newFileButton",
        xCoordinate        = 132,
        yCoordinate        = 1,
        widgetWidth        = 11,
        widgetHeight       = 1,
        buttonColor        = NEW_FILE_BUTTON_COLOR,
        textColor          = FILENAME_TEXT_COLOR,
        pressedButtonColor = NEW_FILE_BUTTON_COLOR,
        pressedTextColor   = FILENAME_TEXT_COLOR,
        buttonText         = "Новый"
    },
    {
        widgetType         = "button",
        widgetID           = "saveButton",
        xCoordinate        = 143,
        yCoordinate        = 1,
        widgetWidth        = 15,
        widgetHeight       = 1,
        buttonColor        = SAVE_BUTTON_COLOR,
        textColor          = FILENAME_TEXT_COLOR,
        pressedButtonColor = SAVE_BUTTON_COLOR,
        pressedTextColor   = FILENAME_TEXT_COLOR,
        buttonText         = "Сохранить"
    },
    {
        widgetType         = "button",
        widgetID           = "closeButton",
        xCoordinate        = 158,
        yCoordinate        = 1,
        widgetWidth        = 3,
        widgetHeight       = 1,
        buttonColor        = CLOSE_BUTTON_COLOR,
        textColor          = FILENAME_TEXT_COLOR,
        pressedButtonColor = CLOSE_BUTTON_COLOR,
        pressedTextColor   = FILENAME_TEXT_COLOR,
        buttonText         = "X"
    }
}

-- Returning these two values in a table, to table.unpack() them later
return {rootContainer, widgets}