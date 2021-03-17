local nfpager = require("umfal")("NFPager.app")
local GUI = require("GUI")
nfpager = nfpager.view.loader.initViews()
--------------------------------------------------------------------------------

-- Create new workspace
local workspace = GUI.workspace()

local footer = nfpager.views.footer:newInstance()
local background = GUI.panel(1, 1, 160, 50, 0xEEEEEE)

workspace:addChild(background)
workspace:addChild(footer)

--------------------------------------------------------------------------------

workspace:draw()
workspace:start()