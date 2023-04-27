local application = require "hs.application"
local window = require "hs.window"
local hotkey = require "hs.hotkey"
local alert = require "hs.alert"
local keys = require "keys"

function debugWindows()
  print("=================================== debug start")
  print("n count: " .. rawlen(Neovide.windows))
  for index, appWindow in pairs(Neovide.windows) do
    -- Remove previous occurrence so they're tracked by last focussed
    print("- n window: " .. index .. ": " .. appWindow:title())
  end
  print("=================================== debug end")
end

Neovide = {
  ["windows"] = {}
}

-- Helpers around the Neovide app which works a little different with a new app
-- instance per time invoked on the Terminal.

-- Keep track of Neovide apps and windows because it starts a new instance for
-- every time started from the command line
appWatcher = application.watcher.new(function(app_name, event, app)
  if app_name == "neovide" then
    if event == application.watcher.activated or event == application.watcher.unhidden then
      -- Activate the window switcher shortcut to switch between Neovide windows.
      neovideSwitcherFn:enable()

      local activeWindow = app:focusedWindow()
      -- Find existing index of Neovide app windows
      for index, appWindow in pairs(Neovide.windows) do
        if activeWindow == appWindow  then
          -- Remove previous occurrence so they're tracked by last focussed
          table.remove(Neovide.windows, index)
        end
      end
      -- Insert window as the last item (the most recent)
      table.insert(Neovide.windows, activeWindow)
    elseif event == application.watcher.terminated then
      -- Rather than removing that one terminated window instance, rebuild the
      -- entire index from scratch. It's simpler.
      neovideBuildWindowIndex()
      -- Focus last known Neovide window
      local window = Neovide.windows[#Neovide.windows]
      if window then
        window:focus()
      end
    end
  elseif event == application.watcher.activated or event == application.watcher.unhidden then
    -- Disable the windows switcher keyboard shortcut for apps that aren't Neovide,
    -- but only when they get activated.
    neovideSwitcherFn:disable()
  end
end)
appWatcher:start()

-- Build the Neovide window index from scratch.
-- This is used on start, so it works without first having focussed each Neovide window.
function neovideBuildWindowIndex()
  Neovide.windows = {}
  for _, appWindow in pairs(window.orderedWindows()) do
    if appWindow:application():title() == "neovide" then
      table.insert(Neovide.windows, appWindow)
    end
  end
end
neovideBuildWindowIndex()

-- Neovide window switcher shortcut to switch between Neovide windows.
-- This doesn't work out of the box.
function switchNeovideWindow(retry)
  local windowCount = rawlen(Neovide.windows)
  if windowCount > 1 then
    -- Move most recent window to least recent to rotate through them all
    local lastWindow = table.remove(Neovide.windows)
    table.insert(Neovide.windows, 1, lastWindow)
    -- Remove previous window from list so it can be reinserted as the latest on focus
    table.remove(Neovide.windows):focus()
  else
    print("Neovide: No other neovide window: " .. rawlen(Neovide.windows))
  end
end
neovideSwitcherFn = hotkey.new({"cmd"}, "`", switchNeovideWindow)

-- On load, activate the Neovide window switcher shortkey if a Neovide window has focus
if application.frontmostApplication():title() == "neovide" then
  neovideSwitcherFn:enable()
end

-- Neovide - Start only from terminal
-- keys.bindKeyFor("Neovide", function()
--   if applicationRunning("neovide") then
--     local appWindow = Neovide.windows[#Neovide.windows]
--     if appWindow then
--       appWindow:focus()
--     else
--       print("no neovide window found" .. rawlen(Neovide.windows))
--       alert("Unable to focus Neovide window")
--     end
--   else
--     alert.show("Neovide not running")
--     application.launchOrFocus("iTerm")
--   end
-- end)
