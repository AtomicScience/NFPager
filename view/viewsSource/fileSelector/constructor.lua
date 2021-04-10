local GUI = require("GUI")
local nfpager = require("umfal")("NFPager.app")

local function constructor(view, ...)
    view.widgets.fileList:updateFileList()
end

return constructor