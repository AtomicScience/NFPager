local GUI = require("GUI")
local nfpager = require("umfal")("NFPager.app")

local loader = {}

function loader.initViews()
    local views = {}
    local mt = {}

    mt.__index = function(self, name)
        local template = loader.loadViewTemplate(name)

        self[name] = template
        return template
    end

    setmetatable(views, mt)

    nfpager.views = views

    return nfpager
end
----------------------------------------------------------------

function loader.loadViewTemplate(name)
    if nfpager.view.viewsSource[name] and nfpager.view.viewsSource[name].widgets then
        local view = nfpager.view.template.new(name)
        return view
    else
        error("View " .. name .. " is absent or it does not contain widgets.lua")
    end
end

return loader