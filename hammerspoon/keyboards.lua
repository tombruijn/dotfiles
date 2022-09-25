local usb = require "hs.usb"
local alert = require "hs.alert"
local Keys = require "keys"

Keyboards = {}

local ergodoxKeyboardName = "ErgoDox EZ Shine"

function Keyboards.keyboardType()
  if not Keyboards.keyboard then
    Keyboards.keyboard = "normal"
  end
  return Keyboards.keyboard
end

function Keyboards.isCurrentKeyboardErgodox()
  return Keyboards.keyboardType() == "ergodox"
end

function Keyboards.toggleKeyboard()
  if Keyboards.keyboardType() == "normal" then
    Keyboards.enableErgodoxKeyboard()
  else
    Keyboards.enableDefaultKeyboard()
  end
end

function Keyboards.enableErgodoxKeyboard()
  Keyboards.keyboard = "ergodox"
  Keyboards.updateKeyboardTriggers()
end

function Keyboards.enableDefaultKeyboard()
  Keyboards.keyboard = "normal"
  Keyboards.updateKeyboardTriggers()
end

function Keyboards.updateKeyboardTriggers()
  alert.show("Keyboard: " .. Keyboards.keyboardType())
  Keys.deactivateKeys()
  Keys.activateKeys()
end

function Keyboards.isErgodoxKeyboard(deviceName)
  return deviceName == ergodoxKeyboardName
end

function Keyboards.connectedKeyboardType()
  local ergodoxFound = false
  for _, device in pairs(usb.attachedDevices()) do
    if Keyboards.isErgodoxKeyboard(device.productName) then
      ergodoxFound = true
    end
  end

  if ergodoxFound then
    return "ergodox"
  else
    return "normal"
  end
end

function Keyboards.isErgodoxKeyboardConnected()
  return Keyboards.connectedKeyboardType() == "ergodox"
end

if Keyboards.isErgodoxKeyboardConnected() then
  Keyboards.enableErgodoxKeyboard()
end

return Keyboards
