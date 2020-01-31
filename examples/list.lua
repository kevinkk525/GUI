local GUI       = require("GUI")

--------------------------------------------------------------------------------

local workspace = GUI.workspace()
workspace:addChild(GUI.panel(1, 1, workspace.width, workspace.height, 0x2D2D2D))

-- Create vertically oriented list
local verticalList = workspace:addChild(GUI.list(3, 2, 25, 30, 3, 0, 0xE1E1E1, 0x4B4B4B, 0xD2D2D2, 0x4B4B4B, 0x3366CC, 0xFFFFFF, false))
verticalList:addItem("Hello world")
verticalList:addItem("This is test").onTouch = function()
    GUI.alert("Selected item: " .. verticalList.selectedItem)
end
verticalList:addItem("Beautiful")
verticalList:addItem("Like a shit")

-- Create horizontally oriented list
local horizontalList = workspace:addChild(GUI.list(34, 2, 100, 3, 2, 0, 0xE1E1E1, 0x4B4B4B, 0xE1E1E1, 0x4B4B4B, 0x696969, 0xFFFFFF, true))
horizontalList:setDirection(GUI.DIRECTION_HORIZONTAL)
horizontalList:setAlignment(GUI.ALIGNMENT_HORIZONTAL_CENTER, GUI.ALIGNMENT_VERTICAL_TOP)
horizontalList:addItem("Applications")
horizontalList:addItem("Libraries")
horizontalList:addItem("Scripts")
horizontalList:addItem("Wallpapers")

--------------------------------------------------------------------------------

workspace:draw()
workspace:start()