local hotkey = require "hs.hotkey"
local alert = require "hs.alert"
local application = require "hs.application"

auto_hide = true
hotkey.bind({"cmd", "alt", "ctrl"}, "H", function()
  auto_hide = not auto_hide
  message = "Auto hide disabled"
  if auto_hide then
    message = "Auto hide enabled"
  end
  alert.show(message)
end)

auto_hide_applications = {"Finder", "Safari", "Telegram", "Tweetbot", "Calendar"}
watcher = application.watcher.new(function(name, event, app)
  if auto_hide then
    if event == application.watcher.deactivated then
      for _, value in pairs(auto_hide_applications) do
        if name == value then
          app:hide()
        end
      end
    end
  end
end)
watcher:start()
