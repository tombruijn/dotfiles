local usb = require "hs.usb"
local caffeinate = require "hs.caffeinate"
local Keys = require "keys"
local Keyboards = require "keyboards"
local watcher = caffeinate.watcher

usbWatcher = usb.watcher.new(function(event)
  print("event: " .. event.productName)
  if Keyboards.isErgodoxKeyboard(event.productName) then
    if event.eventType == "added" then
      Keyboards.enableErgodoxKeyboard()
    elseif event.eventType == "removed" then
      Keyboards.enableDefaultKeyboard()
    end
  elseif Keyboards.isVoyagerKeyboard(event.productName) then
    if event.eventType == "added" then
      Keyboards.enableErgodoxKeyboard()
    elseif event.eventType == "removed" then
      Keyboards.enableDefaultKeyboard()
    end
  end
end)
usbWatcher:start()

caffeinateWathcer = caffeinate.watcher.new(function(event)
  print("event:" .. event)
  if event == watcher.screensDidWake or event == watcher.screensDidUnlock then
    -- Don't show keyboard change message when nothing changes
    if Keyboards.keyboardType() == Keyboards.connectedKeyboardType() then
      return
    end

    if Keyboards.isErgodoxKeyboardConnected() then
      Keyboards.enableErgodoxKeyboard()
    elseif Keyboards.isVoyagerKeyboardConnected() then
      Keyboards.enableErgodoxKeyboard()
    else
      Keyboards.enableDefaultKeyboard()
    end
  end
end)
caffeinateWathcer:start()
