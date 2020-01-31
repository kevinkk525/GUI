local GUI       = require("GUI")
local unicode   = require("unicode")

--------------------------------------------------------------------------------

local workspace = GUI.workspace()
workspace:addChild(GUI.panel(1, 1, workspace.width, workspace.height, 0x0))

-- Add codeView object to workspace
local codeView = workspace:addChild(GUI.codeView(2, 2, 72, 22, 1, 1, 1, {}, {}, GUI.LUA_SYNTAX_PATTERNS, GUI.LUA_SYNTAX_COLOR_SCHEME, true, {}))

-- Open file and read it's lines
local counter  = 1
for line in io.lines("/lib/advancedLua.lua") do
    -- Replace tab symbols to 2 whitespaces and Windows line endings to UNIX line endings
    line                       = line:gsub("\t", "  "):gsub("\r\n", "\n")
    codeView.maximumLineLength = math.max(codeView.maximumLineLength, unicode.len(line))
    table.insert(codeView.lines, line)
    
    counter = counter + 1
    if counter > codeView.height then
        break
    end
end

--------------------------------------------------------------------------------

workspace:draw()
workspace:start()