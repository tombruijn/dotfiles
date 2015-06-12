auto_hide_applications = {"Finder", "Safari", "Telegram", "Tweetbot", "Wunderlist", "Calendar"}
watcher = hs.application.watcher.new(function(name, event, app)
  for _, value in pairs(auto_hide_applications) do
    if name == value and event == hs.application.watcher.deactivated then
      app:hide()
    end
  end
end)
watcher:start()
