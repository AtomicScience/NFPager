local GUI = require("GUI")
local nfpager = require("umfal")("NFPager.app")

local webpage = {}

function webpage.newInstance()
    local instance = GUI.container(1, 1, 160, 49)

    instance.draw       = webpage.draw
    instance.label      = nil
    instance.background = nil

    return instance
end

function webpage:draw()

end

return webpage