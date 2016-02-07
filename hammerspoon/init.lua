local application = require "hs.application"
local hotkey = require "hs.hotkey"
local alert = require "hs.alert"

local keys = require "keys"
require "triggers"
require "window_management"
require "auto_muter"
require "application_watcher"

keys.deactivateKeys()
keys.activateKeys()

alert.show("Hammerspoon loaded!")
