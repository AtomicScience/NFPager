local GUI = require("GUI")

local FOOTER_COLOR = 0xFAFAFA
local FOOTER_TRANSPARENCY = 0

local FILENAME_TEXT_COLOR = 0x262626

local ELEMENT_TEXT_COLOR = 0x363636

local NEW_FILE_BUTTON_COLOR = 0x66FF00
local SAVE_BUTTON_COLOR = 0xFFDB40
local CLOSE_BUTTON_COLOR = 0xFF2440

-- 160 - width, 1 - height

local footer = {}

function footer.functions:setEditedFile(editedFileName)
    self.filename.text = editedFileName
end

function footer.new()
    local footerObject = GUI.container(1, 50, 160, 1)

    footerObject.backgroundPanel = GUI.panel(1, 1, 160, 1, FOOTER_COLOR, FOOTER_TRANSPARENCY)
    footerObject.filename        = GUI.text (1, 1, FILENAME_TEXT_COLOR, "UNINITIALIZED")
    footerObject.elementName     = GUI.text (60, 1, ELEMENT_TEXT_COLOR, "UNINITIALIZED, BUT LONGER, lol")

    footerObject.newFileButton   = GUI.button(132, 1, 11, 1, NEW_FILE_BUTTON_COLOR, FILENAME_TEXT_COLOR, NEW_FILE_BUTTON_COLOR, FILENAME_TEXT_COLOR, "НОВЫЙ")
    footerObject.saveButton      = GUI.button(143, 1, 15, 1, SAVE_BUTTON_COLOR, FILENAME_TEXT_COLOR, SAVE_BUTTON_COLOR, FILENAME_TEXT_COLOR, "СОХРАНИТЬ")
    footerObject.closeButton     = GUI.button(158, 1, 3, 1, CLOSE_BUTTON_COLOR, FILENAME_TEXT_COLOR, CLOSE_BUTTON_COLOR, FILENAME_TEXT_COLOR, "X")

    footerObject:addChild(footerObject.backgroundPanel)
    footerObject:addChild(footerObject.filename)
    footerObject:addChild(footerObject.elementName)
    footerObject:addChild(footerObject.saveButton)
    footerObject:addChild(footerObject.closeButton)
    footerObject:addChild(footerObject.newFileButton)
end



return footer