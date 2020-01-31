local GUI       = dofile("/lib/GUI.lua")

--------------------------------------------------------------------------------

local workspace = GUI.workspace()
workspace:addChild(GUI.panel(1, 1, workspace.width, workspace.height, 0x262626))

-- Add a text label for size comparison
workspace:addChild(GUI.label(3, 2, 30, 1, 0xFFFFFF, "Text for size comparison"))
-- Add BrailleCanvas with 30x15 screen pixels
local brailleCanvas              = workspace:addChild(GUI.brailleCanvas(3, 4, 30, 15))

-- Let's draw! First we will create "border" around object with two vertical lines
local canvasWidthInBraillePixels = brailleCanvas.width * 2
for i = 1, brailleCanvas.height * 4 do
    brailleCanvas:set(1, i, true, 0xFFFFFF)
    brailleCanvas:set(canvasWidthInBraillePixels, i, true, 0xFFFFFF)
end

-- After that let's add two horizontal lines
local canvasHeightInBraillePixels = brailleCanvas.height * 4
for i = 1, brailleCanvas.width * 2 do
    brailleCanvas:set(i, 1, true, 0xFFFFFF)
    brailleCanvas:set(i, canvasHeightInBraillePixels, true, 0xFFFFFF)
end

-- Now we're drawing one red diagonal
for i = 1, 60 do
    brailleCanvas:set(i, i, true, 0xFF4940)
end

-- Drawing yellow rectangle
brailleCanvas:fill(20, 20, 20, 20, true, 0xFFDB40)
-- Drawing smaller rectangle, but with pixels state = false
brailleCanvas:fill(25, 25, 10, 10, false)

--------------------------------------------------------------------------------

workspace:draw()
workspace:start()