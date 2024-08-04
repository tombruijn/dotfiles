local os = require "os"
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

function Keyboards.isCurrentKeyboardVoyager()
  return Keyboards.keyboardType() == "voyager"
end

function Keyboards.toggleKeyboard()
  if Keyboards.keyboardType() == "normal" then
    Keyboards.enableVoyagerKeyboard()
  else
    Keyboards.enableDefaultKeyboard()
  end
end

function Keyboards.enableErgodoxKeyboard()
  Keyboards.keyboard = "ergodox"
  Keyboards.updateKeyboardTriggers()
end

function Keyboards.enableVoyagerKeyboard()
  Keyboards.keyboard = "voyager"
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
  local voyagerFound = false
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

function Keyboards.enableConnectedKeyboard()
  -- Don't show keyboard change message when nothing changes
  if Keyboards.keyboardType() == Keyboards.connectedKeyboardType() then
    return
  end

  if Keyboards.isVoyagerKeyboardConnected() then
    Keyboards.enableVoyagerKeyboard()
  elseif Keyboards.isErgodoxKeyboardConnected() then
    Keyboards.enableErgodoxKeyboard()
  else
    Keyboards.enableDefaultKeyboard()
  end
end

function Keyboards.connectKeymapp()
  if Keyboards.isKeymappConnected() then
    print("Connected to keyboard")
    return
  end

  if Keyboards.isAnyKeyboardAttached() then
    print("Connecting to first attached keyboard")
    os.execute(kontrollPath().." connect-any")
    utils.sleep(1)
    Keyboards.enableStatusLed()
  else
    print("No keyboard attached")
  end
end

function Keyboards.isAnyKeyboardAttached()
  output = io.popen(kontrollPath().." list", "r")
  result = output:read()
  if not result then
    return false
  end
  return result:len() > 0 and true or false
end

function Keyboards.isKeymappConnected()
  output = io.popen(kontrollPath().." status", "r")
  for line in output:lines() do
    if line:find("Connected keyboard:") then
      return true
    end
  end
  return false
end

function Keyboards.enableStatusLed()
  os.execute(kontrollPath().." set-status-led --led 1", "r")
end

function kontrollPath()
  home = os.getenv("HOME")
  return home.."/.bin/kontroll"
end

return Keyboards
