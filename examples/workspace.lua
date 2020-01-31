-- Import the library
local GUI              = require("GUI")

--------------------------------------------------------------------------------

-- Create new workspace
local workspace        = GUI.workspace()

-- Create simple event handler for it
workspace.eventHandler = function(workspace, object, ...)
    GUI.alert("It works! The event data was: ", ...)
end

--------------------------------------------------------------------------------

-- Start processing events for workspace
workspace:start()