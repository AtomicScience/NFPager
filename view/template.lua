local GUI = require("GUI")
local nfpager = require("umfal")("NFPager.app")
local widgetFactory = nfpager.widgets.widgetFactory

local template = {}

function template.new(viewName)
    local viewTemplate = {}
    viewTemplate.viewName = viewName

    viewTemplate.newInstance = template.newInstance

    return viewTemplate
end

function template:newInstance(...)
    local view = template.constructView(self.viewName)

    template.addControllers(view)

    template.invokeConstructor(view, ...)

    return view
end

function template.constructView(viewName)
    -- Since each widgets.lua must return two values, it must pack them in a table.
    -- So, we have to unpack them here
    -- TODO: Make the line below more straightforward
    local tableRootContainer, tableWidgets = table.unpack(nfpager.view.viewsSource[viewName].widgets)

    local rootContainer = widgetFactory.constructFromTableProperty(tableRootContainer)

    rootContainer.viewName = viewName
    rootContainer.widgets = {}

    for i = 1, #tableWidgets do
        local tableWidget = tableWidgets[i]

        local widget, widgetID = widgetFactory.constructFromTableProperty(tableWidget)

        rootContainer.widgets[widgetID] = widget
        rootContainer:addChild(widget)
    end

    return rootContainer
end

function template.addControllers(view)
    local controllers = template.attemptToLoadModule(nfpager.view.viewsSource[view.viewName], "controllers")

    if not controllers then
        return
    end

    for widgetName, widget in pairs(view.widgets) do
        local loadedModule = template.attemptToLoadModule(controllers, widgetName)

        if loadedModule then
            template.addControllerToWidget(widget, loadedModule)
        end
    end
end

function template.invokeConstructor(view, ...)
    local constructor = template.attemptToLoadModule(nfpager.view.viewsSource[view.viewName], "constructor")

    if not constructor then
        return
    end

    constructor(view, ...)
end

function template.addControllerToWidget(widget, controllerTable)
    -- TODO: Add a validation of controller names
    for controllerName, controller in pairs(controllerTable) do
        widget[controllerName] = controller
    end
end

function template.attemptToLoadModule(rootModule, moduleName)
    local success, loadedModule = pcall(function() return rootModule[moduleName] end)

    if success then
        return loadedModule
    else
        return nil
    end
end

return template