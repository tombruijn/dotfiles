local application = require "hs.application"
local window = require "hs.window"
local hotkey = require "hs.hotkey"
local alert = require "hs.alert"
local battery = require "hs.battery"
local wifi_control = require "wifi_control"
local bluetooth_control = require "bluetooth_control"

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

-- System management
hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  hs.reload()
end)
hotkey.bind({"cmd", "alt", "ctrl"}, "C", function()
  hs.openConsole()
end)
hotkey.bind({"cmd", "alt", "ctrl"}, "A", function()
  application.launchOrFocus("Activity Monitor")
end)

-- Lock & sleep
hotkey.bind({"cmd", "alt", "ctrl"}, "L", function()
  hs.caffeinate.startScreensaver()
end)
hotkey.bind({"cmd", "alt", "ctrl"}, ";", function()
  hs.caffeinate.systemSleep()
end)

-- Show status
hotkey.bind({"cmd", "alt", "ctrl"}, "S", function()
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
hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  wifi_control.toggle()
end)
-- Toggle Bluetooth on and off
hotkey.bind({"cmd", "alt", "ctrl"}, "E", function()
  bluetooth_control.toggle()
end)

-- MacVim - Start only from terminal
hotkey.bind({"ctrl"}, "2", function()
  if applicationRunning("MacVim") then
    application.launchOrFocus("MacVim")
  else
    alert.show("MacVim not running")
    application.launchOrFocus("iTerm")
  end
end)

-- Simple triggers
triggers = {
  {{"ctrl"}, "1", "iTerm"},
  {{"alt"}, "1", "iTunes"},
  {{"ctrl"}, "3", "Google Chrome"},
  {{"ctrl"}, "4", "Opera"},
  {{"alt"}, "4", "Safari"},
  {{"alt"}, "6", "Sketch"},
  {{"ctrl"}, "8", "Tweetbot"},
  {{"alt"}, "8", "Telegram"},
  {{"alt"}, "9", "Skype"},
  {{"ctrl"}, "0", "Airmail 2"},
  {{"alt"}, "0", "Slack"},
  {{"ctrl"}, "-", "Calendar"},
  {{"ctrl"}, "=", "iA Writer"},
  {{"alt"}, "=", "LibreOffice"},
  {{"ctrl"}, "Tab", "Finder"},
  {{"ctrl"}, "§", "1Password 5"},
  {{"alt"}, "§", "TogglDesktop"},
  {{"cmd", "shift"}, "§", "Wunderlist"},
  {{"cmd", "shift"}, "E", "Dash"}
}
for _, trigger in ipairs(triggers) do
  local mods = trigger[1]
  local key = trigger[2]
  local applicationName = trigger[3]

  hotkey.bind(mods, key, function()
    application.launchOrFocus(applicationName)
  end)
end
