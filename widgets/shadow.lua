local GUI = require("GUI")
local screen = require("Screen")
local nfpager = require("umfal")("NFPager.app")

local shadow = {}

local TRANSPARENCY = GUI.WINDOW_SHADOW_TRANSPARENCY

function shadow.newInstance(tbl)
    local instance = GUI.object(tbl.xCoordinate, tbl.yCoordinate, tbl.widgetWidth, tbl.widgetHeight)

    instance.passScreenEvents = true

    instance.toDrawTop = tbl.toDrawTop
    instance.toDrawRight = tbl.toDrawRight
    instance.toDrawBottom = tbl.toDrawBottom
    instance.toDrawLeft = tbl.toDrawLeft

    instance.draw = shadow.draw

    return instance
end

function shadow:draw()
    shadow.drawEdges(self)
    shadow.drawCorners(self)
end

function shadow:drawEdges()
    if self.toDrawTop then
        shadow.drawTopLine(self.x + 1, self.y - 1, self.width - 2)
    end

    if self.toDrawRight then
        shadow.drawVerticalLine(self.x + self.width, self.y + 1, self.height - 2)
    end

    if self.toDrawBottom then
        shadow.drawBottomLine(self.x + 1, self.y + self.height, self.width - 2)
    end

    if self.toDrawLeft then
        shadow.drawVerticalLine(self.x - 1, self.y + 1, self.height - 2)
    end
end

function shadow:drawCorners()
    if self.toDrawTop and self.toDrawRight then
        shadow.drawTopRightCorner(self.x + self.width, self.y - 1)
    end

    if self.toDrawRight and self.toDrawBottom then
        shadow.drawBottomRightCorner(self.x + self.width, self.y + self.height)
    end

    if self.toDrawBottom and self.toDrawLeft then
        shadow.drawBottomLeftCorner(self.x - 1, self.y + self.height)
    end

    if self.toDrawLeft and self.toDrawTop then
        shadow.drawTopLeftCorner(self.x - 1, self.y - 1)
    end
end

function shadow.drawTopLine(x, y, width)
    screen.drawText(x, y, 0x0, string.rep("▄", width), TRANSPARENCY)
end

function shadow.drawBottomLine(x, y, width)
    screen.drawText(x, y, 0x0, string.rep("▀", width), TRANSPARENCY)
end

function shadow.drawVerticalLine(x, y, height)
    screen.drawRectangle(x, y, 1, height, 0x0, 0x0, " ", TRANSPARENCY)
end

function shadow.drawTopRightCorner(x, y)
    shadow.drawTopLine(x - 1, y, 2)
    shadow.drawVerticalLine(x, y + 1, 1)
end

function shadow.drawTopLeftCorner(x, y)
    shadow.drawTopLine(x, y, 2)
    shadow.drawVerticalLine(x, y + 1, 1)
end

function shadow.drawBottomRightCorner(x, y)
    shadow.drawBottomLine(x - 1, y, 2)
    shadow.drawVerticalLine(x, y - 1, 1)
end

function shadow.drawBottomLeftCorner(x, y)
    shadow.drawBottomLine(x, y, 2)
    shadow.drawVerticalLine(x, y - 1, 1)
end

return shadow