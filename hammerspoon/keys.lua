local alert = require "hs.alert"
local hotkey = require "hs.hotkey"

meh = {"ctrl", "alt", "shift"}
hyper = {"cmd", "alt", "ctrl", "shift"}
local shortcuts = {
  ["normal"] = {},
  ["ergodox"] = {},
}

Keys = {
  ["specialTriggers"] = {
    ["ToggleKeyboard"] = {{{"ctrl", "alt", "cmd"}, "="}, {{"ctrl", "alt", "cmd"}, "="}},
    ["Lock"] = {{{"ctrl", "alt", "cmd"}, "L"}, {hyper, "9"}},
    ["Sleep"] = {{{"ctrl", "alt", "cmd"}, ";"}, {hyper, "0"}},
    ["Status"] = {{{"ctrl", "alt", "cmd"}, "S"}, {hyper, "\\"}},
    ["Reload"] = {{{"ctrl", "alt", "cmd"}, "R"}, {hyper, "3"}},
    ["Console"] = {{{"ctrl", "alt", "cmd"}, "C"}, {hyper, "4"}},
    ["WiFi"] = {{{"ctrl", "alt", "cmd"}, "W"}, {hyper, "1"}},
    ["Bluetooth"] = {{{"ctrl", "alt", "cmd"}, "E"}, {hyper, "2"}},
    ["MacVim"] = {{{"ctrl"}, "2"}, {hyper, "D"}},

    ["Fullscreen window"] = {{{"alt", "cmd"}, "F"}, {hyper, "I"}},
    ["Center window"] = {{{"alt", "cmd"}, "C"}, {hyper, "K"}},
    ["Left 50% window"] = {{{"alt", "cmd"}, "["}, {hyper, "J"}},
    ["Right 50% window"] = {{{"alt", "cmd"}, "]"}, {hyper, "L"}},
    ["Top left 25% window"] = {{{"ctrl", "alt"}, "["}, {hyper, "U"}},
    ["Top right 25% window"] = {{{"ctrl", "alt"}, "]"}, {hyper, "O"}},
    ["Bottom center 25% window"] = {{{"ctrl", "alt"}, "\\"}, {nil, "f15"}},
    ["Move window display left"] = {{{"ctrl", "cmd"}, "-"}, {hyper, "Y"}},
    ["Move window display right"] = {{{"ctrl", "cmd"}, "="}, {hyper, "P"}},
    ["Open screenshots"] = {{{"cmd", "shift"}, "S"}, {hyper, "M"}},
    ["Switch audio"] = {nil, {hyper, "Z"}},
  },
  ["triggers"] = {
    ["Activity Monitor"] = {{{"ctrl", "alt", "cmd"}, "A"}, {hyper, "5"}},
    ["iTerm"] = {{{"ctrl"}, "1"}, {hyper, "S"}},
    ["Music"] = {{{"alt"}, "1"}, {hyper, "pad+"}},
    ["Firefox Developer Edition"] = {{{"ctrl"}, "3"}, {hyper, "F"}},
    ["Basecamp 3"] = {{{"alt"}, "3"}, {hyper, "V"}},
    ["Firefox"] = {{{"ctrl"}, "4"}, {hyper, "G"}},
    ["Google Chrome"] = {{{"alt"}, "4"}, {hyper, "C"}},
    ["Tweetbot"] = {{{"ctrl"}, "8"}, {meh, "W"}},
    ["Safari"] = {{{"alt"}, "8"}, {hyper, "Q"}},
    ["Mail"] = {{{"ctrl"}, "0"}, {hyper, "A"}},
    ["Slack"] = {{{"alt"}, "0"}, {hyper, "B"}},
    ["Calendar"] = {{{"ctrl"}, "-"}, {hyper, "X"}},
    ["iA Writer"] = {{{"ctrl"}, "="}, {hyper, "T"}},
    ["Obsidian"] = {nil, {hyper, "7"}},
    ["Finder"] = {{{"ctrl"}, "TAB"}, {hyper, "R"}},
    ["1Password 7"] = {{{"ctrl"}, "§"}, {hyper, "N"}},
    ["Clockify Desktop"] = {{{"alt"}, "§"}, {hyper, "="}},
    ["Dash"] = {{{"cmd", "shift"}, "E"}, {hyper, "E"}},
    ["zoom.us"] = {{{"ctrl"}, "6"}, {hyper, "H"}},
    ["Todoist"] = {{{"ctrl"}, "5"}, {hyper, "6"}},
  },
}

function Keys.keyFor(name)
  local keys = Keys.triggers[name]
  if not keys then
    keys = Keys.specialTriggers[name]
  end

  return keys
end

function Keys.bindKeyFor(appName, fn)
  keys = Keys.keyFor(appName)
  normalKeys = keys[1]
  ergodoxKeys = keys[2]
  if normalKeys then
    shortcuts["normal"][appName] = hotkey.new(normalKeys[1], normalKeys[2], fn)
  end
  shortcuts["ergodox"][appName] = hotkey.new(ergodoxKeys[1], ergodoxKeys[2], fn)
end

function Keys.deactivateKeys()
  for _, keys in pairs(shortcuts) do
    for __, k in pairs(keys) do
      k:disable()
    end
  end
end

function Keys.activateKeys()
  keys = shortcuts[Keyboards.keyboardType()]
  for _, k in pairs(keys) do
    k:enable()
  end
end

return Keys
