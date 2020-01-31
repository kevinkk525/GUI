local GUI       = require("GUI")

--------------------------------------------------------------------------------

local workspace = GUI.workspace()
workspace:addChild(GUI.panel(1, 1, workspace.width, workspace.height, 0x2D2D2D))

-- Add vertical scrollBar to workspace
local verticalScrollBar     = workspace:addChild(GUI.scrollBar(2, 3, 1, 15, 0x444444, 0x888888, 1, 100, 1, 10, 1, true))
verticalScrollBar.onTouch   = function()
    GUI.alert("Vertical scrollbar was touched")
end

-- Add horizontal too
local horizontalScrollBar   = workspace:addChild(GUI.scrollBar(3, 2, 60, 1, 0x444444, 0x888888, 1, 100, 1, 10, 1, true))
horizontalScrollBar.onTouch = function()
    -- Do something on scrollBar touch
end

--------------------------------------------------------------------------------

workspace:draw()
workspace:start()