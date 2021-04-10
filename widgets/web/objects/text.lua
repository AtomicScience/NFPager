local GUI = require("GUI")
local screen = require("Screen")
local nfpager = require("umfal")("NFPager.app")
local unicode = require("unicode")

local text = {}

-- Object format:
-- {'text', x, y, foreground, background, string, [transparency]}
--    1     2  3      4           5          6          7

function text.newInstance(tbl)
    local textLength = unicode.len(tbl[6])

    local instance = GUI.object(tbl[2], tbl[3], textLength, 1)
    instance.draw = text.draw

    instance.text       = tbl.text
    instance.textLength = textLength
    instance.text       = tbl[6]
    instance.foreground = tbl[4]
    if tbl[5] == "DEF" then
        instance.background = nil
    else
        instance.background = tbl[5]
    end

    if tbl[7] then
        instance.transparency = tbl[7]
    else
        instance.transparency = 0
    end

    return instance
end

function text:draw()
    if self.background then
        screen.drawRectangle(self.x, self.y, self.textLength, 1, 0x228420, self.background, " ", self.transparency)    
    end
    screen.drawText(self.x, self.y, self.foreground, self.text, self.transparency)
end

return text