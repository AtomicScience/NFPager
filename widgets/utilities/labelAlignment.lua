local GUI = require("GUI")

local utilities = {}

function utilities.getValuesFor(tbl)
    return utilities.getHorizontalLabelAlignmentConstant(tbl), utilities.getVerticalLabelAlignmentConstant(tbl)
end

function utilities.getHorizontalLabelAlignmentConstant(tbl)
    if tbl.horizontal == "left" then
        return GUI.ALIGNMENT_HORIZONTAL_LEFT
    end

    if tbl.horizontal == "right" then
        return GUI.ALIGNMENT_HORIZONTAL_RIGHT
    end

    if tbl.horizontal == "center" then
        return GUI.ALIGNMENT_HORIZONTAL_CENTER
    end

    -- If all the clauses above failed, but tbl.horizontal exists, we should throw a error to let a user know that he made a typo
    if tbl.vertical then
        error("Failed to parse horizontal alignment value " .. tbl.vertical .. "for Label widget with ID " .. tbl.widgetID)
    end

    -- If tbl.vertical is horizontal, returning the default value
    return GUI.ALIGNMENT_HORIZONTAL_CENTER
end

function utilities.getVerticalLabelAlignmentConstant(tbl)
    if tbl.vertical == "top" then
        return GUI.ALIGNMENT_VERTICAL_TOP
    end

    if tbl.vertical == "bottom" then
        return GUI.ALIGNMENT_VERTICAL_BOTTOM
    end

    if tbl.vertical == "center" then
        return GUI.ALIGNMENT_VERTICAL_CENTER
    end

    -- If all the clauses above failed, but tbl.vertical exists, we should throw a error to let a user know that he made a typo
    if tbl.vertical then
        error("Failed to parse vertical alignment value " .. tbl.vertical .. "for Label widget with ID " .. tbl.widgetID)
    end

    -- If tbl.vertical is absent, returning the default value
    return GUI.ALIGNMENT_VERTICAL_CENTER
end

return utilities