local usb = require "hs.usb"
local alert = require "hs.alert"
local Keys = require "keys"

Keyboards = {}

local ergodoxKeyboardName = "ErgoDox EZ Shine"
local voyagerKeyboardName = "Voyager"

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

function Keyboards.isVoyagerKeyboard(deviceName)
  return deviceName == voyagerKeyboardName
end

function Keyboards.connectedKeyboardType()
  local ergodoxFound = false
  for _, device in pairs(usb.attachedDevices()) do
    if Keyboards.isErgodoxKeyboard(device.productName) then
      ergodoxFound = true
    elseif Keyboards.isVoyagerKeyboard(device.productName) then
      voyagerFound = true
    end
  end

  if ergodoxFound then
    return "ergodox"
  elseif voyagerFound then
    return "voyager"
  else
    return "normal"
  end
end

function Keyboards.isErgodoxKeyboardConnected()
  return Keyboards.connectedKeyboardType() == "ergodox"
end

function Keyboards.isVoyagerKeyboardConnected()
  return Keyboards.connectedKeyboardType() == "voyager"
end

if Keyboards.isErgodoxKeyboardConnected() or Keyboards.isVoyagerKeyboardConnected() then
  Keyboards.enableErgodoxKeyboard()
end

return Keyboards
