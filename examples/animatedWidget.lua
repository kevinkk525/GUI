local color  = require("color")
local buffer = require("doubleBuffering")
local GUI    = require("GUI")

--------------------------------------------------------------------------------

-- Create a function that will draw your switch to buffer buffer
-- It's recommended to use local function because it will exists in memory as single copy for each switch
local function switchDraw(switch)
    local bodyX = switch.x + switch.width - switch.bodyWidth
    -- Draw a switch text
    buffer.drawText(switch.x, switch.y, switch.colors.text, switch.text)
    -- Draw a background with passive color
    buffer.drawRectangle(bodyX, switch.y, switch.bodyWidth, 1, switch.colors.passive, 0x0, " ")
    buffer.drawText(bodyX + switch.bodyWidth, switch.y, switch.colors.passive, "⠆")
    -- Draw a background with active color
    buffer.drawText(bodyX - 1, switch.y, switch.colors.active, "⠰")
    buffer.drawRectangle(bodyX, switch.y, switch.pipePosition - 1, 1, switch.colors.active, 0x0, " ")
    -- Draw a switch "pipe"
    buffer.drawText(bodyX + switch.pipePosition - 2, switch.y, switch.colors.pipe, "⠰")
    buffer.drawRectangle(bodyX + switch.pipePosition - 1, switch.y, 2, 1, switch.colors.pipe, 0x0, " ")
    buffer.drawText(bodyX + switch.pipePosition + 1, switch.y, switch.colors.pipe, "⠆")
end

-- Create a switch event handler that is called after clicking on it.
-- Again, use local functions for stuff like this
local function switchEventHandler(workspace, switch, event)
    if event == "touch" then
        -- Change switch state to opposite
        switch.state    = not switch.state
        -- Add an animation to switch that fill move "pipe" to correct side
        local animation = switch:addAnimation(
        -- As an animation frame handler you need a function that will set "pipe" position dependent of current animation position
        -- Remember that animation.position is always in [0.0; 1.0] range
        -- If switch state has a false value, you need to invert animation position to play it reversed visually
                function(animation)
                    if switch.state then
                        switch.pipePosition = math.round(1 + animation.position * (switch.bodyWidth - 2))
                    else
                        switch.pipePosition = math.round(1 + (1 - animation.position) * (switch.bodyWidth - 2))
                    end
                end,
        -- Specify a function that is called after animation finishing
                function(animation)
                    -- Remove animation object from switch
                    animation:remove()
                    -- You can also create callback-functions support like this
                    if switch.onStateChanged then
                        switch.onStateChanged()
                    end
                end
        )
        -- Start playing your animation
        animation:start(switch.animationDuration)
    end
end

-- This function will create a new switch object and fill it with required properties
local function newSwitch(x, y, totalWidth, bodyWidth, activeColor, passiveColor, pipeColor, textColor, text, switchState)
    -- Create object that inherits GUI.object
    local switch             = GUI.object(x, y, totalWidth, 1)
    
    -- Specify some variables for you purpose
    switch.colors            = {
        active  = activeColor,
        passive = passiveColor,
        pipe    = pipeColor,
        text    = textColor
    }
    switch.bodyWidth         = bodyWidth
    switch.text              = text
    switch.state             = switchState
    -- You can set any animation duration, even a few hours if you want to
    switch.animationDuration = 0.3
    -- Position of "pipe" will be in range [1; bodyWidth - 1] cause it have 2 pixels width
    switch.pipePosition      = switch.state and switch.bodyWidth - 1 or 1
    
    switch.draw              = switchDraw
    switch.eventHandler      = switchEventHandler
    
    return switch
end

--------------------------------------------------------------------------------

-- Now let's create workspace and fill it with our cool widget
local workspace = GUI.workspace()
workspace:addChild(GUI.panel(1, 1, workspace.width, workspace.height, 0x2D2D2D))

-- First, specify required switch count
-- Next, create some variables dependent of it: HUE from HSB color space, coordinates and animation duration
-- So in fact every next switch will have different color and longer animation duration
local count                 = 168
local hue                   = 0
local hueStep               = 360 / count
local x, y                  = 3, 2
local animationDurationMin  = 0.3
local animationDurationMax  = 1.5
local animationDuration     = animationDurationMin
local animationDurationStep = (animationDurationMax - animationDurationMin) / count

-- Add specified count of swithes to workspace
for i = 1, count do
    local switchColor        = color.HSBToInteger(hue, 1, 1)
    local switch             = workspace:addChild(
            newSwitch(x, y, 19, 7,
                      switchColor,
                      0x1D1D1D,
                      0xEEEEEE,
                      switchColor,
                      "Switch " .. i .. ":",
                      math.random(2) == 2
            )
    )
    
    switch.animationDuration = animationDuration
    
    y                        = y + switch.height + 1
    hue                      = hue + hueStep
    animationDuration        = animationDuration + animationDurationStep
    
    if y >= workspace.height then
        x, y = x + switch.width + 3, 2
    end
end

--------------------------------------------------------------------------------

workspace:draw()
workspace:start()