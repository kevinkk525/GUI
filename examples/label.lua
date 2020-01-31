local GUI       = require("GUI")

--------------------------------------------------------------------------------

local workspace = GUI.workspace()
workspace:addChild(GUI.panel(1, 1, workspace.width, workspace.height, 0x2D2D2D))

-- Add 10 labels with different alignment states
workspace:addChild(GUI.label(1, 1, workspace.width, workspace.height, 0xFFFFFF, "Label with [left, top] alighment")):setAlignment(GUI.ALIGNMENT_HORIZONTAL_LEFT, GUI.ALIGNMENT_VERTICAL_TOP)
workspace:addChild(GUI.label(1, 1, workspace.width, workspace.height, 0xFFFFFF, "Label with [center, top] alighment")):setAlignment(GUI.ALIGNMENT_HORIZONTAL_CENTER, GUI.ALIGNMENT_VERTICAL_TOP)
workspace:addChild(GUI.label(1, 1, workspace.width, workspace.height, 0xFFFFFF, "Label with [right, top] alighment")):setAlignment(GUI.ALIGNMENT_HORIZONTAL_RIGHT, GUI.ALIGNMENT_VERTICAL_TOP)
workspace:addChild(GUI.label(1, 1, workspace.width, workspace.height, 0xFFFFFF, "Label with [left, center] alighment")):setAlignment(GUI.ALIGNMENT_HORIZONTAL_LEFT, GUI.ALIGNMENT_VERTICAL_CENTER)
workspace:addChild(GUI.label(1, 1, workspace.width, workspace.height, 0xFFFFFF, "Label with [center, center] alighment")):setAlignment(GUI.ALIGNMENT_HORIZONTAL_CENTER, GUI.ALIGNMENT_VERTICAL_CENTER)
workspace:addChild(GUI.label(1, 1, workspace.width, workspace.height, 0xFFFFFF, "Label with [right, center] alighment")):setAlignment(GUI.ALIGNMENT_HORIZONTAL_RIGHT, GUI.ALIGNMENT_VERTICAL_CENTER)
workspace:addChild(GUI.label(1, 1, workspace.width, workspace.height, 0xFFFFFF, "Label with [left, bottom] alighment")):setAlignment(GUI.ALIGNMENT_HORIZONTAL_LEFT, GUI.ALIGNMENT_VERTICAL_BOTTOM)
workspace:addChild(GUI.label(1, 1, workspace.width, workspace.height, 0xFFFFFF, "Label with [center, bottom] alighment")):setAlignment(GUI.ALIGNMENT_HORIZONTAL_CENTER, GUI.ALIGNMENT_VERTICAL_BOTTOM)
workspace:addChild(GUI.label(1, 1, workspace.width, workspace.height, 0xFFFFFF, "Label with [right, bottom] alighment")):setAlignment(GUI.ALIGNMENT_HORIZONTAL_RIGHT, GUI.ALIGNMENT_VERTICAL_BOTTOM)

--------------------------------------------------------------------------------

workspace:draw()
workspace:start()