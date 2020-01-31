local GUI       = require("GUI")

--------------------------------------------------------------------------------

local workspace = GUI.workspace()
workspace:addChild(GUI.panel(1, 1, workspace.width, workspace.height, 0x2D2D2D))

-- Add a regular button
local regularButton                                                                                                   = workspace:addChild(GUI.button(2, 2, 30, 3, 0xFFFFFF, 0x555555, 0x880000, 0xFFFFFF, "Regular button"))
regularButton.onTouch                                                                                                 = function()
    GUI.alert("Regular button was pressed")
end

-- Add a regular button with disabled state
local disabledButton                                                                                                  = workspace:addChild(GUI.button(2, 6, 30, 3, 0xFFFFFF, 0x555555, 0x880000, 0xFFFFFF, "Disabled button"))
disabledButton.disabled                                                                                               = true

-- Add a regular button with switchMode state
local switchButton                                                                                                    = workspace:addChild(GUI.button(2, 10, 30, 3, 0xFFFFFF, 0x555555, 0x880000, 0xFFFFFF, "Switch button"))
switchButton.switchMode                                                                                               = true
switchButton.onTouch                                                                                                  = function()
    GUI.alert("Switch button was pressed")
end

-- Add a regular button with disabled animation
local notAnimatedButton                                                                                               = workspace:addChild(GUI.button(2, 14, 30, 3, 0xFFFFFF, 0x555555, 0x880000, 0xFFFFFF, "Not animated button"))
notAnimatedButton.animated                                                                                            = false
notAnimatedButton.onTouch                                                                                             = function()
    GUI.alert("Not animated button was pressed")
end

-- Add a rounded button
workspace:addChild(GUI.roundedButton(2, 18, 30, 3, 0xFFFFFF, 0x555555, 0x880000, 0xFFFFFF, "Rounded button")).onTouch = function()
    GUI.alert("Rounded button was pressed")
end

-- Add a framed button
workspace:addChild(GUI.framedButton(2, 22, 30, 3, 0xFFFFFF, 0xFFFFFF, 0x880000, 0x880000, "Framed button")).onTouch   = function()
    GUI.alert("Framed button was pressed")
end

--------------------------------------------------------------------------------

workspace:draw()
workspace:start()