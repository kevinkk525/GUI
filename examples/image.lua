local image     = require("image")
local GUI       = require("GUI")

--------------------------------------------------------------------------------

local workspace = GUI.workspace()
workspace:addChild(GUI.panel(1, 1, workspace.width, workspace.height, 0x2D2D2D))

-- Load image, create widget from it and add it to workspace
workspace:addChild(GUI.image(2, 2, image.load("/home/examples/HDD.pic")))

--------------------------------------------------------------------------------

workspace:draw()
workspace:start()