local nfpager = require("umfal")("NFPager.app")
local GUI = require("GUI")
nfpager = nfpager.view.loader.initViews()
--------------------------------------------------------------------------------
local shortcuts = {}

shortcuts.locked = false

function shortcuts.lock()
    shortcuts.locked = true
end

function shortcuts.unlock()
    shortcuts.locked = false
end

return shortcuts