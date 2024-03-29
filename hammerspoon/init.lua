local application = require "hs.application"
local hotkey = require "hs.hotkey"
local alert = require "hs.alert"

local keys = require "keys"
require "triggers"
require "window_management"
require "auto_muter"
require "application_watcher"
require "device_watcher"
local Keyboards = require "keyboards"

keys.deactivateKeys()
keys.activateKeys()

hs.loadSpoon("URLDispatcher")
spoon.URLDispatcher:start()

alert.show("Hammerspoon loaded!")
Keyboards.enableConnectedKeyboard()
