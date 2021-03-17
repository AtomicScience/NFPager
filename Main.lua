local nfpager = require("umfal")("NFPager.app")
local GUI = require("GUI")
--------------------------------------------------------------------------------

-- Create new workspace
local workspace = GUI.workspace()

local footer = nfpager.views.footer
local background = nfpager.views.background

workspace:addChild(background)
workspace:addChild(footer)

footer:

--------------------------------------------------------------------------------

workspace:draw()
workspace:start()