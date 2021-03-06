---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Kevin.
--- DateTime: 10.12.2019 17:43
---

local GUI      = require("GUI")
local buffer   = require("doubleBuffering")
local image    = require("image")
local thread   = require("thread")
local computer = require("computer")

-- notice will leave menu accessible

function notice(workspace, timeout, message, callback, button_active, button_delay)
    local sign                      = image.fromString([[06030000FF 0000FF 00F7FF▟00F7FF▙0000FF 0000FF 0000FF 00F7FF▟F7FF00 F7FF00 00F7FF▙0000FF 00F7FF▟F7FF00NF7FF00oF7FF00tF7FF00e00F7FF▙]])
    local offset                    = 2
    --local lines                     = #args > 1 and "\"" .. table.concat(args, "\", \"") .. "\"" or args[1]
    local lines                     = message
    local bufferWidth, bufferHeight = buffer.getResolution()
    local width                     = math.floor(bufferWidth * 0.5)
    local textWidth                 = width - image.getWidth(sign) - 2
    
    lines                           = string.wrap(lines, textWidth)
    local height                    = image.getHeight(sign)
    if #lines + 2 > height then
        height = #lines + 2
    end
    
    local x, y            = math.floor(bufferWidth / 2 - width / 2), offset + 1
    local panel           = workspace:addChild(GUI.panel(1, 2, workspace.width, workspace.height, 0xFFFFFF, 0.5))
    local panel2          = workspace:addChild(GUI.panel(1, math.floor(bufferHeight / 2 - height / 2), workspace.width, height + offset * 2, 0x1D1D1D))
    local image_ch        = workspace:addChild(GUI.image(x, math.floor(bufferHeight / 2 - height / 2) + y - 1, sign))
    local textbox         = workspace:addChild(GUI.textBox(x + image.getWidth(sign) + 2, math.floor(bufferHeight / 2 - height / 2) + y, textWidth, #lines, 0x1D1D1D, 0xE1E1E1, lines, 1, 0, 0))
    textbox.eventHandler  = nil
    local label_countdown = workspace:addChild(GUI.label(panel2.x + panel2.width - 2, panel2.y + 1, 3, 1, 0x33DB40, ""))
    
    local buttonWidth     = 10
    local button          = workspace:addChild(GUI.roundedButton(x + image.getWidth(sign) + textWidth - buttonWidth + 2, panel2.y + height + offset, buttonWidth, 1, 0x3366CC, 0xE1E1E1, 0xE1E1E1, 0x3366CC, "OK"))
    
    local function await_timeout()
        for i = timeout, 1, -1 do
            label_countdown.text = tostring(i)
            workspace:draw()
            os.sleep(1)
        end
        button.onTouch()
    end
    local function await_button_delay()
        local st = computer.uptime()
        while computer.uptime() - st < button_delay do
            os.sleep(0.5)
        end
        button.hidden = false
        workspace:draw()
    end
    local notice_thread
    local button_delay_thread
    if timeout then
        notice_thread = thread.create(await_timeout)
    end
    if button_delay then
        button.hidden       = true
        button_delay_thread = thread.create(await_button_delay)
    end
    if button_active == false then
        button.hidden = true
    elseif button_delay then
    
    end
    
    button.onTouch = function()
        panel:remove()
        panel2:remove()
        image_ch:remove()
        textbox:remove()
        button:remove()
        label_countdown:remove()
        workspace:draw()
        if notice_thread then
            notice_thread:kill()
        end
        if button_delay_thread then
            button_delay_thread:kill()
        end
        if callback then
            callback()
        end
    end
    workspace:draw()
    return button.onTouch
end

GUI.notice = notice