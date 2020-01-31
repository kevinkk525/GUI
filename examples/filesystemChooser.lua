local GUI       = require("GUI")

--------------------------------------------------------------------------------

local workspace = GUI.workspace()
workspace:addChild(GUI.panel(1, 1, workspace.width, workspace.height, 0x262626))

local filesystemChooser = workspace:addChild(GUI.filesystemChooser(2, 2, 30, 3, 0xE1E1E1, 0x888888, 0x3C3C3C, 0x888888, nil, "Open", "Cancel", "Choose", "/"))
filesystemChooser:setMode(GUI.IO_MODE_OPEN, GUI.IO_MODE_FILE)
filesystemChooser.onSubmit = function(path)
    GUI.alert("File \"" .. path .. "\" was selected")
end

--------------------------------------------------------------------------------

workspace:draw()
workspace:start()