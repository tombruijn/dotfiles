local application = require "hs.application"
local hotkey = require "hs.hotkey"
local alert = require "hs.alert"

require "triggers"
require "window_management"
require "auto_muter"
require "application_watcher"

alert.show("Hammerspoon loaded!")
