local GUI       = require("GUI")

--------------------------------------------------------------------------------

local workspace = GUI.workspace()
workspace:addChild(GUI.panel(1, 1, workspace.width, workspace.height, 0x2D2D2D))

local textBox            = workspace:addChild(GUI.textBox(2, 2, 32, 16, 0xEEEEEE, 0x2D2D2D, {}, 1, 1, 0))
textBox.scrollBarEnabled = true
table.insert(textBox.lines, { text = "Sample colored line ", color = 0x880000 })
for i = 1, 100 do
    table.insert(textBox.lines, "Sample line " .. i)
end

--------------------------------------------------------------------------------

workspace:draw()
workspace:start()