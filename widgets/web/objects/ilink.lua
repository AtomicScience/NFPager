local GUI = require("GUI")
local screen = require("Screen")
local nfpager = require("umfal")("NFPager.app")
local unicode = require("unicode")
local imageLib = require("image")

local pathUtilities = nfpager.widgets.utilities.pathUtilities

local image = {}

-- Object format:
-- {'image', x, y, picpath}
--     1     2  3     4

local function getAbsolutePathToPicture(pathToPage, relativePath)
    -- TODO: Proper format should require this string
    -- local pathToFolder = pathUtilities.concat(pathToPage, "/..")

    return pathUtilities.concat(pathToPage, relativePath)
end

function image.newInstance(tbl, pageObject)
    local pathToImage = getAbsolutePathToPicture(pageObject.pathToPage, tbl[4])

    local loadedImage, reason = imageLib.load(pathToImage)

    if not loadedImage then
        error("Failed to load image " .. pathToImage .. ", reason: " .. reason)
    end

    local instance = GUI.image(tbl[2], tbl[3], loadedImage)

    instance.path         = tbl[4]
    instance.absolutePath = pathToImage

    return instance
end

return image