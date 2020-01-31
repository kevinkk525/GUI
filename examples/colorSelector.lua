local GUI       = require("GUI")

--------------------------------------------------------------------------------

local workspace = GUI.workspace()
workspace:addChild(GUI.panel(1, 1, workspace.width, workspace.height, 0x2D2D2D))

workspace:addChild(GUI.colorSelector(2, 2, 30, 3, 0xFF55FF, "Choose color")).onColorSelected = function()
    -- Do something after choosing color
end

--------------------------------------------------------------------------------

workspace:draw()
workspace:start()