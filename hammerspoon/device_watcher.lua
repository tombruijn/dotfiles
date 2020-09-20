local usb = require "hs.usb"
local Keys = require "keys"

local ergodoxKeyboardName = "ErgoDox EZ"

for _, device in pairs(usb.attachedDevices()) do
  if device.productName == ergodoxKeyboardName then
    Keys.enableErgodoxKeyboard()
  end
end

usb.watcher.new(function(event)
  if event.productName == ergodoxKeyboardName then
    if event.eventType == "added" then
      Keys.enableErgodoxKeyboard()
    elseif event.eventType == "removed" then
      Keys.enableDefaultKeyboard()
    end
  end
end):start()
