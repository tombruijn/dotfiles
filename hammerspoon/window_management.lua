local hotkey = require "hs.hotkey"
local window = require "hs.window"
local screen = require "hs.screen"
local alert = require "hs.alert"

window.animationDuration = 0

function alertCannotManipulateWindow()
  alert.show("Can't move window")
end

-- Make window full screen
hotkey.bind({"cmd", "alt"}, "F", function()
  local win = window.focusedWindow()
  if not win then
    alertCannotManipulateWindow()
    return
  end
  local screen = win:screen()
  local max = screen:frame()

  win:setFrame(max)
end)

-- Align window to center of the screen
hotkey.bind({"cmd", "alt"}, "C", function()
  local win = window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  if not win then
    alertCannotManipulateWindow()
    return
  end

  f.x = (max.w - f.w) / 2
  f.y = (max.h - f.h) / 2
  win:setFrame(f)
end)

-- Align window to left 50% of the screen
hotkey.bind({"cmd", "alt"}, "[", function()
  local win = window.focusedWindow()
  if not win then
    alertCannotManipulateWindow()
    return
  end
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

-- Align window to right 50% of the screen
hotkey.bind({"cmd", "alt"}, "]", function()
  local win = window.focusedWindow()
  if not win then
    alertCannotManipulateWindow()
    return
  end
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
  win:ensureIsInScreenBounds()
end)

-- Align window to top left of the screen
hotkey.bind({"ctrl", "alt"}, "[", function()
  local win = window.focusedWindow()
  if not win then
    alertCannotManipulateWindow()
    return
  end
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = 0
  f.y = 0
  f.w = max.w / 2
  f.h = max.h / 2
  win:setFrame(f)
end)

-- Align window to top right of the screen
hotkey.bind({"ctrl", "alt"}, "]", function()
  local win = window.focusedWindow()
  if not win then
    alertCannotManipulateWindow()
    return
  end
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.w / 2
  f.y = 0
  f.w = max.w / 2
  f.h = max.h / 2
  win:setFrame(f)
  win:ensureIsInScreenBounds()
end)

-- Move window to the display on the left
hotkey.bind({"cmd", "ctrl"}, "-", function()
  local win = hs.window.focusedWindow()
  if not win then
    alertCannotManipulateWindow()
    return
  end
  win:moveOneScreenWest()
end)

-- Move window to the display on the right
hotkey.bind({"cmd", "ctrl"}, "=", function()
  local win = hs.window.focusedWindow()
  if not win then
    alertCannotManipulateWindow()
    return
  end
  win:moveOneScreenEast()
end)

-- Shrink window
hotkey.bind({"ctrl", "alt"}, "-", function()
  local win = window.focusedWindow()
  if not win then
    alertCannotManipulateWindow()
    return
  end
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  if f.x + f.w >= (max.w - 5) then
    -- Aligned to the right
    f.w = f.w - 20
    f.x = max.w - f.w
  elseif (max.w - 10) <= (f.x * 2) + f.w then
    -- Center window shrinking
    f.w = f.w - 20
    f.x = (max.w - f.w) / 2
  else
    f.w = f.w - 20
  end

  win:setFrame(f)
  win:ensureIsInScreenBounds()
end)

-- Grow window
hotkey.bind({"ctrl", "alt"}, "=", function()
  local win = window.focusedWindow()
  if not win then
    alertCannotManipulateWindow()
    return
  end
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  if f.x + f.w >= (max.w - 5) then
    -- Aligned to the right
    f.w = f.w + 20
    f.x = max.w - f.w
  elseif (max.w - 10) <= (f.x * 2) + f.w then
    -- Center window growing
    f.w = f.w + 20
    f.x = (max.w - f.w) / 2
  else
    f.w = f.w + 20
    f.x = f.x - 10
  end

  win:setFrame(f)
  win:ensureIsInScreenBounds()
end)
