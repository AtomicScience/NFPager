local GUI = require("GUI")
local nfpager = require("umfal")("NFPager.app")

local functions = {}

function functions:setEditedFile(editedFileName)
    self.filename.text = editedFileName
end

return functions