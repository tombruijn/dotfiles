local application = require "hs.application"
local window = require "hs.window"
local hotkey = require "hs.hotkey"
local alert = require "hs.alert"
local battery = require "hs.battery"
local keys = require "keys"
local Keyboards = require "keyboards"
local wifi_control = require "wifi_control"
local bluetooth_control = require "bluetooth_control"

application.enableSpotlightForNameSearches(true)

function applicationRunning(name)
  apps = application.runningApplications()
  found = false
  for i = 1, #apps do
    app = apps[i]
    if app:title() == name and (#app:allWindows() > 0 or app:mainWindow()) then
      found = true
    end
  end

  return found
end

keys.bindKeyFor("ToggleKeyboard", function()
  Keyboards.toggleKeyboard()
end)

-- System management
keys.bindKeyFor("Reload", function()
  hs.reload()
end)
keys.bindKeyFor("Console", function()
  hs.openConsole()
end)

-- Lock & sleep
keys.bindKeyFor("Lock", function()
  hs.timer.doAfter(0.5, function()
    hs.caffeinate.lockScreen()
  end)
end)
keys.bindKeyFor("Sleep", function()
  hs.timer.doAfter(0.5, function()
    hs.caffeinate.systemSleep()
  end)
end)

-- Show status
keys.bindKeyFor("Status", function()
  charging = battery.isCharging() or battery.isCharged()
  timeRemaining = battery.timeRemaining()
  alert.show(
  "Wi-Fi: "..wifi_control.status()..
  "\nBluetooth: "..bluetooth_control.status()..
  "\nBattery: "..battery.percentage().."% - "..
  (charging and "Charging" or "Not charging")..
  "\nTime remaining: "..((timeRemaining == -1 or timeRemaining == -2) and "?" or timeRemaining).." minutes"
  , 5)
end)
-- Toggle WiFi on and off
keys.bindKeyFor("WiFi", function()
  wifi_control.toggle()
end)
-- Toggle Bluetooth on and off
keys.bindKeyFor("Bluetooth", function()
  bluetooth_control.toggle()
end)

-- MacVim - Start only from terminal
keys.bindKeyFor("MacVim", function()
  if applicationRunning("MacVim") then
    application.find("MacVim"):activate()
  else
    if applicationRunning("Code") then
      application.launchOrFocus("Visual Studio Code")
    else
      alert.show("No editor running")
      application.launchOrFocus("iTerm")
    end
  end
end)

-- Open screenshots directory
keys.bindKeyFor("Open screenshots", function()
  hs.execute("open /Users/tombruijn/Pictures/Monosnap")
end)

-- Switch between audio output
keys.bindKeyFor("Switch audio", function()
  speakersName = "Audioengine HD3"
  headphonesName = "WH-1000XM4"
  currentAudioDevice = hs.audiodevice.current().name
  if currentAudioDevice == speakersName then
    setDefaultOutputDevice(headphonesName, "Audio: wireless headphones 🎧")
  else
    setDefaultOutputDevice(speakersName, "Audio: speakers 🔈")
  end
end)

function setDefaultOutputDevice(audioDevice, label)
  local status, _returnValue = pcall(_setDefaultOutputDevice, audioDevice, label)
  if status == false then
    alert.show("Error switching to \"" .. audioDevice .. "\"")
    return status
  end
end

function _setDefaultOutputDevice(audioDevice, label)
  if hs.audiodevice.findOutputByName(audioDevice):setDefaultOutputDevice() then
    alert.show(label)
  else
    alert.show("Unable to switch to " .. audioDevice)
  end
end

-- Simple triggers
for applicationName, _ in pairs(keys.triggers) do
  keys.bindKeyFor(applicationName, function()
    application.launchOrFocus(applicationName)
  end)
end
