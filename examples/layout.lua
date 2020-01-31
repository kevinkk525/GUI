local GUI       = require("GUI")

------------------------------------------------------------------------------------------

local workspace = GUI.workspace()
workspace:addChild(GUI.panel(1, 1, workspace.width, workspace.height, 0x2D2D2D))

-- Add an layout with 5x1 grid size to workspace
local layout = workspace:addChild(GUI.layout(1, 1, workspace.width, workspace.height, 5, 1))

-- Add 9 buttons to layout and assign specified grid position to them
-- As you can see, button object is being created first - after that it's being added as child object to layout
-- Finally, a specified grid position is being assigned to added child object
layout:setPosition(1, 1, layout:addChild(GUI.button(1, 1, 26, 3, 0xEEEEEE, 0x000000, 0xAAAAAA, 0x0, "Button 1")))
layout:setPosition(2, 1, layout:addChild(GUI.button(1, 1, 26, 3, 0xEEEEEE, 0x000000, 0xAAAAAA, 0x0, "Button 2")))
layout:setPosition(2, 1, layout:addChild(GUI.button(1, 1, 26, 3, 0xEEEEEE, 0x000000, 0xAAAAAA, 0x0, "Button 3")))
layout:setPosition(3, 1, layout:addChild(GUI.button(1, 1, 26, 3, 0xEEEEEE, 0x000000, 0xAAAAAA, 0x0, "Button 4")))
layout:setPosition(3, 1, layout:addChild(GUI.button(1, 1, 26, 3, 0xEEEEEE, 0x000000, 0xAAAAAA, 0x0, "Button 5")))
layout:setPosition(3, 1, layout:addChild(GUI.button(1, 1, 26, 3, 0xEEEEEE, 0x000000, 0xAAAAAA, 0x0, "Button 6")))
layout:setPosition(4, 1, layout:addChild(GUI.button(1, 1, 26, 3, 0xEEEEEE, 0x000000, 0xAAAAAA, 0x0, "Button 7")))
layout:setPosition(4, 1, layout:addChild(GUI.button(1, 1, 26, 3, 0xEEEEEE, 0x000000, 0xAAAAAA, 0x0, "Button 8")))
layout:setPosition(5, 1, layout:addChild(GUI.button(1, 1, 26, 3, 0xEEEEEE, 0x000000, 0xAAAAAA, 0x0, "Button 9")))

-- Assign an callback function to the first added button
layout.children[1].onTouch = function()
    -- Enable layout grid rendering
    layout.showGrid = true
    -- Change layout grid size
    layout:setGridSize(3, 1)
    -- Change cell spacing for each column
    for column = 1, 3 do
        layout:setSpacing(column, 1, 4)
    end
    -- Change position of last 3 buttons to make them belong to last column
    for child = 7, 9 do
        layout:setPosition(3, 1, layout.children[child])
    end
    -- Enable automatic children width calculation for last column with offset of 4 pixels (2 on each side)
    layout:setFitting(3, 1, true, false, 4, 0)
    -- Draw changes on screen
    workspace:draw()
end

------------------------------------------------------------------------------------------

workspace:draw()
workspace:start()