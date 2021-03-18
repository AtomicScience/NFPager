local GUI = require("GUI")
local nfpager = require("umfal")("NFPager.app")
local widgetConstructor = nfpager.utilities.widgetConstructor

local template = {}

function template.new(viewName)
    local viewTemplate = {}
    viewTemplate.viewName = viewName

    viewTemplate.newInstance = template.newInstance

    return viewTemplate
end

function template:newInstance(...)
    local view = template.constructView(self.viewName)

    return view
end

function template.constructView(viewName)
    local tableRootContainer, tableWidgets = table.unpack(nfpager.view.viewsSource[viewName].widgets)

    local rootContainer = widgetConstructor.constructFromTableProperty(tableRootContainer)

    rootContainer.viewName = viewName
    rootContainer.widgets = {}

    for i = 1, #tableWidgets do
        local tableWidget = tableWidgets[i]

        local widget, widgetID = widgetConstructor.constructFromTableProperty(tableWidget)

        rootContainer.widgets[widgetID] = widget
        rootContainer:addChild(widget)
    end

    return rootContainer
end

return template