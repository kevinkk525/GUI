local GUI       = require("GUI")

--------------------------------------------------------------------------------

-- Create new workspace
local workspace = GUI.workspace()

-- Add panel that fits workspace
workspace:addChild(GUI.panel(1, 1, workspace.width, workspace.height, 0x262626))
-- Add smaller red panel
workspace:addChild(GUI.panel(10, 10, workspace.width - 20, workspace.height - 20, 0x880000))

--------------------------------------------------------------------------------

workspace:draw()
workspace:start()