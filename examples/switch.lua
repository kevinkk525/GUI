local GUI       = require("GUI")

--------------------------------------------------------------------------------

local workspace = GUI.workspace()
workspace:addChild(GUI.panel(1, 1, workspace.width, workspace.height, 0x2D2D2D))

local switch1          = workspace:addChild(GUI.switch(3, 2, 8, 0x66DB80, 0x1D1D1D, 0xEEEEEE, true))
local switch2          = workspace:addChild(GUI.switch(3, 4, 8, 0x66DB80, 0x1D1D1D, 0xEEEEEE, false))
switch2.onStateChanged = function(state)
    GUI.alert("Switch state changed!")
end
workspace:addChild(GUI.switchAndLabel(2, 6, 25, 8, 0x66DB80, 0x1D1D1D, 0xEEEEEE, 0x999999, "Sample text 2:", false))

--------------------------------------------------------------------------------

workspace:draw()
workspace:start()