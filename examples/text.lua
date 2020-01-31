local GUI       = require("GUI")

--------------------------------------------------------------------------------

local workspace = GUI.workspace()
workspace:addChild(GUI.panel(1, 1, workspace.width, workspace.height, 0x2D2D2D))

workspace:addChild(GUI.text(3, 2, 0xFFFFFF, "Hello, world!"))
workspace:addChild(GUI.text(3, 3, 0xFFFFFF, "How are you? Wanna cast some EEWRD meatballs?"))

--------------------------------------------------------------------------------

workspace:draw()
workspace:start()