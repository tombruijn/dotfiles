local usb = require "hs.usb"
local caffeinate = require "hs.caffeinate"
local Keys = require "keys"
local Keyboards = require "keyboards"
local watcher = caffeinate.watcher

usbWatcher = usb.watcher.new(function(event)
  print("device watcher event: " .. event.productName)
  if Keyboards.isErgodoxKeyboard(event.productName) then
    if event.eventType == "added" then
      Keyboards.enableErgodoxKeyboard()
    elseif event.eventType == "removed" then
      Keyboards.enableDefaultKeyboard()
    end
  elseif Keyboards.isVoyagerKeyboard(event.productName) then
    if event.eventType == "added" then
      Keyboards.enableVoyagerKeyboard()
    elseif event.eventType == "removed" then
      Keyboards.enableDefaultKeyboard()
    end
  end
end)
usbWatcher:start()

caffeinateWatcher = caffeinate.watcher.new(function(event)
  print("caffinate watcher event: " .. event)
  if event == watcher.screensDidWake or event == watcher.screensDidUnlock then
    Keyboards.enableConnectedKeyboard()
  end
end)
caffeinateWatcher:start()
