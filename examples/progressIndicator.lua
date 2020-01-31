local GUI       = require("GUI")
local internet  = require("Internet")

------------------------------------------------------------------------------------------

local workspace = GUI.workspace()
workspace:addChild(GUI.panel(1, 1, workspace.width, workspace.height, 0x1E1E1E))

-- Adding progress indicator to display data downloading
local progressIndicator                                                                                        = workspace:addChild(GUI.progressIndicator(3, 2, 0x3C3C3C, 0x00B640, 0x99FF80))

-- Adding button that performs internet-request to download *something*
workspace:addChild(GUI.adaptiveButton(3, 6, 2, 1, 0x2D2D2D, 0xD2D2D2, 0x5A5A5A, 0xE1E1E1, "Download")).onTouch = function()
    -- Switching indicator to active state
    progressIndicator.active = true
    workspace:draw()
    
    -- Sending a GET-request to download data as string
    local downloadedData     = ""
    local result, reason     = internet.rawRequest(
    -- Url (will return server IP-address)
            "http://httpbin.org/ip",
    -- POST data
            nil,
    -- Headers
            nil,
    -- Downloaded chunk hanlder
            function(chunk)
                downloadedData = downloadedData .. chunk
                
                -- Rolling indicator to a next state
                progressIndicator:roll()
                workspace:draw()
            end,
    -- Count of bytes to download per chunk (2 will simulate slow download)
            2
    )
    
    -- Switching indicator to passive state when download is finished
    progressIndicator.active = false
    workspace:draw()
    
    -- Displaying result on screen if request was successfull
    if result then
        GUI.alert("Download complete: " .. downloadedData)
    end
end


------------------------------------------------------------------------------------------

workspace:draw()
workspace:start()