local GUI       = require("GUI")

--------------------------------------------------------------------------------

local workspace = GUI.workspace()
workspace:addChild(GUI.panel(1, 1, workspace.width, workspace.height, 0x2D2D2D))

local slider          = workspace:addChild(GUI.slider(4, 2, 30, 0x66DB80, 0x0, 0xFFFFFF, 0xAAAAAA, 0, 100, 50, true, "Prefix: ", " postfix"))
slider.roundValues    = true
slider.onValueChanged = function()
    -- Do something when slider's value changed
end

--------------------------------------------------------------------------------

workspace:draw()
workspace:start()