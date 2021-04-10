local nfpager = require("umfal")("NFPager.app")
local GUI = require("GUI")
local filesystem = require("Filesystem")
nfpager = nfpager.view.loader.initViews()
--------------------------------------------------------------------------------
local file = {}

function file.attemptToLoadFile(path)
    if not filesystem.exists(path) then
        GUI.alert("File not found")
    end
end

return file