local nfpager = require("umfal")("NFPager.app")

local fileName = {}

fileName.eventHandler = function(workspace, object, eventName, ...)
    if eventName == "touch" then
        nfpager.widgets.widgetFactory.addFilesystemDialog({
            parentWorkspace  = workspace,
            onSubmitFunction = nfpager.models.file.attemptToLoadFile
        })
    end
end

return fileName