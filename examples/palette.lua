local GUI       = require("GUI")

------------------------------------------------------------------------------------------

local workspace = GUI.workspace()
workspace:addChild(GUI.panel(1, 1, workspace.width, workspace.height, 0x1E1E1E))

-- Add a palette window to workspace
local palette                = workspace:addChild(GUI.palette(3, 2, 0x9900FF))
-- Specify an .onTouch() callback-function to submit button
palette.submitButton.onTouch = function()
    GUI.alert("You've been selected a color: " .. string.format("0x%X", palette.color.integer))
end

------------------------------------------------------------------------------------------

workspace:draw()
workspace:start()