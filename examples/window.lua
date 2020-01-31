local GUI       = require("GUI")

------------------------------------------------------------------------------------------

local workspace = GUI.workspace()
workspace:addChild(GUI.panel(1, 1, workspace.width, workspace.height, 0x1E1E1E))

-- First, add an empty window to workspace
local window1 = workspace:addChild(GUI.window(90, 6, 60, 20))
-- Add a background panel and text widget to it
window1:addChild(GUI.panel(1, 1, window1.width, window1.height, 0xF0F0F0))
window1:addChild(GUI.text(3, 2, 0x2D2D2D, "Regular window example"))

-- Next add tabbed window
local window2 = workspace:addChild(GUI.tabbedWindow(4, 3, 60, 20))
-- Use pointer to GUI.tabBar object to add some tabs
window2.tabBar:addItem("Apps")
window2.tabBar:addItem("Libs")
window2.tabBar:addItem("Pictures")
window2.tabBar:addItem("Updates")
-- Add and .onTouch() method to close button to make window be able to close
window2.actionButtons.close.onTouch    = function()
    window2:remove()
    workspace:draw()
end
-- Do the same with maximize button
window2.actionButtons.maximize.onTouch = function()
    window2:maximize()
    workspace:draw()
end
-- Add callback method which is called on window resize. Use passed parameters to set sizes of window child objects
window2.onResize                       = function(newWidth, newHeight)
    window2.tabBar.width           = newWidth
    window2.backgroundPanel.width  = newWidth
    window2.backgroundPanel.height = newHeight - window2.tabBar.height
    workspace:draw()
end

-- Finally add titled window
local window3                          = workspace:addChild(GUI.titledWindow(50, 22, 60, 20, "Titled window example", true))
-- Attach an single cell layout to it
local layout                           = window3:addChild(GUI.layout(1, 2, window3.width, window3.height - 1, 1, 1))
-- Add some stuff to layout
layout:addChild(GUI.button(1, 1, 36, 3, 0xB4B4B4, 0xFFFFFF, 0x969696, 0xB4B4B4, "Press me"))
layout:addChild(GUI.button(1, 1, 36, 3, 0xB4B4B4, 0xFFFFFF, 0x969696, 0xB4B4B4, "And me"))

------------------------------------------------------------------------------------------

workspace:draw()
workspace:start()