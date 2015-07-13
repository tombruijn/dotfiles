local application = require "hs.application"
local window = require "hs.window"
local hotkey = require "hs.hotkey"
local alert = require "hs.alert"
local battery = require "hs.battery"
local wifi_control = require "wifi_control"
local bluetooth_control = require "bluetooth_control"

hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  hs.reload()
end)
hotkey.bind({"cmd", "alt", "ctrl"}, "C", function()
  hs.openConsole()
end)
hotkey.bind({"cmd", "alt", "ctrl"}, "A", function()
  application.launchOrFocus("Activity Monitor")
end)
hotkey.bind({"cmd", "alt", "ctrl"}, "L", function()
  hs.caffeinate.startScreensaver()
end)

hotkey.bind({"cmd", "alt", "ctrl"}, ";", function()
  hs.caffeinate.systemSleep()
end)
hotkey.bind({"cmd", "alt", "ctrl"}, "T", function()
  alert.show("Hello World!")
end)
hotkey.bind({"cmd", "shift"}, "I", function()
  hs.itunes.displayCurrentTrack()
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

hotkey.bind({"ctrl"}, "1", function()
  application.launchOrFocus("iTerm")
end)
hotkey.bind({"alt"}, "1", function()
  application.launchOrFocus("iTunes")
end)

hotkey.bind({"ctrl"}, "2", function()
  application.launchOrFocus("MacVim")
end)
hotkey.bind({"alt"}, "2", function()
  application.launchOrFocus("Atom")
end)

hotkey.bind({"ctrl"}, "3", function()
  application.launchOrFocus("Google Chrome")
end)
hotkey.bind({"alt"}, "3", function()
  application.launchOrFocus("Sublime Text 2")
end)

hotkey.bind({"ctrl"}, "4", function()
  application.launchOrFocus("Opera")
end)
hotkey.bind({"alt"}, "4", function()
  application.launchOrFocus("Safari")
end)

hotkey.bind({"alt"}, "6", function()
  application.launchOrFocus("Adobe Photoshop CC 2014")
end)

hotkey.bind({"ctrl"}, "8", function()
  application.launchOrFocus("Tweetbot")
end)
hotkey.bind({"alt"}, "8", function()
  application.launchOrFocus("Telegram")
end)

hotkey.bind({"alt"}, "9", function()
  application.launchOrFocus("Skype")
end)

hotkey.bind({"ctrl"}, "0", function()
  application.launchOrFocus("Airmail 2")
end)
hotkey.bind({"alt"}, "0", function()
  application.launchOrFocus("Slack")
end)

hotkey.bind({"ctrl"}, "-", function()
  application.launchOrFocus("Calendar")
end)

hotkey.bind({"ctrl"}, "=", function()
  application.launchOrFocus("iA Writer Pro")
end)
hotkey.bind({"alt"}, "=", function()
  application.launchOrFocus("LibreOffice")
end)

hotkey.bind({"ctrl"}, "E", function()
  application.launchOrFocus("Finder")
end)
hotkey.bind({"cmd", "shift"}, "E", function()
  application.launchOrFocus("Dash")
end)

hotkey.bind({"ctrl"}, "§", function()
  application.launchOrFocus("1Password 5")
end)
hotkey.bind({"alt"}, "§", function()
  application.launchOrFocus("TogglDesktop")
end)
hotkey.bind({"cmd", "shift"}, "§", function()
  application.launchOrFocus("Wunderlist")
end)
