local audiodevice = require("hs.audiodevice")
local usb = require("hs.usb")
local caffeinate = require("hs.caffeinate")
local Keys = require("keys")
local Keyboards = require("keyboards")
local watcher = caffeinate.watcher
local preferredMicrophone = "Elgato Wave:3"

local usbWatcher = usb.watcher.new(function(event)
  if event.eventType == "added" and event.productName == preferredMicrophone then
    local audioInputDevices = audiodevice.allDevices()
    for i = 1, #audioInputDevices do
      local device = audioInputDevices[i]
      if device:name() == preferredMicrophone then
        device:setDefaultInputDevice()
      end
    end
  end

  if Keyboards.isErgodoxKeyboard(event.productName) then
    if event.eventType == "added" then
      Keyboards.enableErgodoxKeyboard()
      hs.timer.doAfter(0.5, function()
        Keyboards.connectKeymapp()
      end)
    elseif event.eventType == "removed" then
      Keyboards.enableDefaultKeyboard()
    end
  elseif Keyboards.isVoyagerKeyboard(event.productName) then
    if event.eventType == "added" then
      Keyboards.enableVoyagerKeyboard()
      hs.timer.doAfter(0.5, function()
        Keyboards.connectKeymapp()
      end)
    elseif event.eventType == "removed" then
      Keyboards.enableDefaultKeyboard()
    end
  end
end)
usbWatcher:start()

local caffeinateWatcher = caffeinate.watcher.new(function(event)
  print("caffinate watcher event: " .. event)
  if event == watcher.screensDidWake or event == watcher.screensDidUnlock then
    Keyboards.enableConnectedKeyboard()
    Keyboards.connectKeymapp()
  end
end)
caffeinateWatcher:start()
