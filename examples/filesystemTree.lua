local GUI       = require("GUI")

--------------------------------------------------------------------------------

local workspace = GUI.workspace()
workspace:addChild(GUI.panel(1, 1, workspace.width, workspace.height, 0x262626))

local tree1 = workspace:addChild(GUI.filesystemTree(3, 2, 30, 41, 0xCCCCCC, 0x3C3C3C, 0x3C3C3C, 0x999999, 0x3C3C3C, 0xE1E1E1, 0xBBBBBB, 0xAAAAAA, 0xBBBBBB, 0x444444, GUI.IO_MODE_BOTH, GUI.IO_MODE_FILE))
tree1:updateFileList()
tree1.onItemSelected = function(path)
    GUI.alert("Something was selected, the path is: \"" .. path .. "\"")
end

local tree2          = workspace:addChild(GUI.filesystemTree(34, 2, 30, 41, 0xCCCCCC, 0x3C3C3C, 0x3C3C3C, 0x999999, 0x3C3C3C, 0xE1E1E1, 0xBBBBBB, 0xAAAAAA, 0xBBBBBB, 0x444444, GUI.IO_MODE_FILE, GUI.IO_MODE_FILE))
tree2:updateFileList()
tree2.onItemSelected = function(path)
    GUI.alert("File was selected, the path is: \"" .. path .. "\"")
end

local tree3          = workspace:addChild(GUI.filesystemTree(66, 2, 30, 41, 0xCCCCCC, 0x3C3C3C, 0x3C3C3C, 0x999999, 0x3C3C3C, 0xE1E1E1, 0xBBBBBB, 0xAAAAAA, 0xBBBBBB, 0x444444, GUI.IO_MODE_DIRECTORY, GUI.IO_MODE_DIRECTORY))
tree3:updateFileList()
tree3.onItemSelected = function(path)
    GUI.alert("Directory was selected, the path is: \"" .. path .. "\"")
end

--------------------------------------------------------------------------------

workspace:draw()
workspace:start()