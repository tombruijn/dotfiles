local hotkey = require "hs.hotkey"
local window = require "hs.window"
local screen = require "hs.screen"
local alert = require "hs.alert"
local keys = require "keys"

window.animationDuration = 0

local positions = {
  fullscreen = { x = 0.00, y = 0.00, w = 1.00, h = 1.00 },

  right50    = { x = 0.50, y = 0.00, w = 0.50, h = 1.00 },
  left50     = { x = 0.00, y = 0.00, w = 0.50, h = 1.00 },
  top50      = { x = 0.00, y = 0.00, w = 1.00, h = 0.50 },
  bottom50   = { x = 0.00, y = 0.50, w = 1.00, h = 0.50 },
  right33    = { x = (1 / 3) * 2, y = 0.00, x2 = 1.00, h = 1.00 },
  left33     = { x = 0.00, y = 0.00, w = 1 / 3, h = 1.00 },
  topLeft25  = { x = 0.00, y = 0.00, w = 0.5, h = 0.5 },
  topRight25 = { x = 0.5, y = 0.0, w = 0.5, h = 0.5 },

  center25   = { x = 0.25, y = 0.25, w = 0.5, h = 0.5 },
  bottomCenter50 = { x = 0.25, y = 0.50, w = 0.50, h = 0.50 }
}

function alertCannotManipulateWindow()
  alert.show("Can't move window")
end

function move(position)
  local win = window.focusedWindow()
  if not win then
    alertCannotManipulateWindow()
    return
  end
  win:move(position, nil, true)
end

keys.bindKeyFor("Fullscreen window", function()
  move(positions.fullscreen)
end)

keys.bindKeyFor("Center window", function()
  window.focusedWindow():centerOnScreen(nil, true)
end)

keys.bindKeyFor("Left 50% window", function()
  move(positions.left50)
end)

keys.bindKeyFor("Right 50% window", function()
  move(positions.right50)
end)

keys.bindKeyFor("Left 33% window", function()
  move(positions.left33)
end)

keys.bindKeyFor("Right 33% window", function()
  move(positions.right33)
end)

keys.bindKeyFor("Top left 25% window", function()
  move(positions.topLeft25)
end)

keys.bindKeyFor("Top right 25% window", function()
  move(positions.topRight25)
end)

keys.bindKeyFor("Bottom center 25% window", function()
  move(positions.bottomCenter50)
end)

keys.bindKeyFor("Center 25%", function()
  move(positions.center25)
end)

keys.bindKeyFor("Move window display left", function()
  local win = hs.window.focusedWindow()
  if not win then
    alertCannotManipulateWindow()
    return
  end
  win:moveOneScreenWest()
end)

keys.bindKeyFor("Move window display right", function()
  local win = hs.window.focusedWindow()
  if not win then
    alertCannotManipulateWindow()
    return
  end
  win:moveOneScreenEast()
end)
