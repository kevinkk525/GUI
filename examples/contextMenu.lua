local GUI                                                                                     = require("GUI")

--------------------------------------------------------------------------------

local workspace                                                                               = GUI.workspace()

-- Add an background panel and attack event handler to it
workspace:addChild(GUI.panel(1, 1, workspace.width, workspace.height, 0x2D2D2D)).eventHandler = function(workspace, object, e1, e2, e3, e4)
    if e1 == "touch" then
        -- Add context menu object to workspace and some items to it
        local contextMenu = GUI.addContextMenu(workspace, e3, e4)
        contextMenu:addItem("New")
        contextMenu:addItem("Open").onTouch = function()
            -- Do something to open file or whatever
        end
        
        -- Add a sub menu and some items to it
        local subMenu                       = contextMenu:addSubMenuItem("Open with")
        subMenu:addItem("Explorer.app")
        subMenu:addItem("Viewer.app")
        subMenu:addItem("Finder.app")
        subMenu:addSeparator()
        subMenu:addItem("Browse...")
        
        contextMenu:addSeparator()
        contextMenu:addItem("Save", true)
        contextMenu:addItem("Save as")
        contextMenu:addSeparator()
        
        -- Of course, you can use loops to do the same
        for i = 1, 25 do
            contextMenu:addItem("Do something " .. i)
        end
        
        workspace:draw()
    end
end

--------------------------------------------------------------------------------

workspace:draw()
workspace:start()