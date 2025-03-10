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
    ["Reload"] = {{{"ctrl", "alt", "shift", "cmd"}, "R"}, {hyper, "3"}},
    ["Console"] = {{{"ctrl", "alt", "cmd"}, "C"}, {hyper, "4"}},
    ["WiFi"] = {{{"ctrl", "alt", "cmd"}, "W"}, {hyper, "1"}},
    ["Bluetooth"] = {{{"ctrl", "alt", "cmd"}, "E"}, {hyper, "2"}},
    ["MacVim"] = {{{"ctrl"}, "2"}, {hyper, "D"}},

    ["Open screenshots"] = {{{"cmd", "shift"}, "M"}, {hyper, "M"}},
    ["Switch audio"] = {nil, {hyper, "6"}},

    ["Fullscreen window"] = {{{"alt", "cmd"}, "F"}, {meh, "I"}},
    ["Center window"] = {{{"alt", "cmd"}, "C"}, {meh, "K"}},
    ["Center 25%"] = {nil, {meh, "pad8"}},
    ["Left 50% window"] = {{{"alt", "cmd"}, "["}, {meh, "J"}},
    ["Right 50% window"] = {{{"alt", "cmd"}, "]"}, {meh, "L"}},
    ["Left 33% window"] = {nil, {meh, "H"}},
    ["Right 33% window"] = {nil, {meh, ";"}},
    ["Right 66% window"] = {nil, {meh, "'"}},
    ["Grow width"] = {nil, {meh, "T"}},
    ["Shrink width"] = {nil, {meh, "G"}},
    ["Bottom center 25% window"] = {nil, {meh, ","}},
    ["Align left"] = {nil, {meh, "U"}},
    ["Align right"] = {nil, {meh, "O"}},
    ["Move window display left"] = {{{"ctrl", "cmd"}, "-"}, {meh, "Q"}},
    ["Move window display right"] = {{{"ctrl", "cmd"}, "="}, {meh, "W"}},
  },
  ["triggers"] = {
    ["Activity Monitor"] = {{{"ctrl", "alt", "cmd"}, "A"}, {hyper, "5"}},
    ["iTerm"] = {{{"ctrl"}, "1"}, {hyper, "S"}},
    ["Music"] = {{{"alt"}, "1"}, {hyper, "pad+"}},
    ["Firefox Developer Edition"] = {{{"ctrl"}, "3"}, {hyper, "F"}},
    ["Basecamp"] = {{{"alt"}, "3"}, {hyper, "V"}},
    ["Firefox"] = {{{"ctrl"}, "4"}, {hyper, "G"}},
    ["Google Chrome"] = {{{"alt"}, "4"}, {hyper, "C"}},
    ["Safari"] = {{{"alt"}, "8"}, {hyper, "Q"}},
    ["Proton Mail"] = {{{"ctrl"}, "0"}, {hyper, "A"}},
    ["Slack"] = {{{"alt"}, "0"}, {hyper, "B"}},
    ["Calendar"] = {{{"ctrl"}, "-"}, {hyper, "X"}},
    ["Obsidian"] = {{{"ctrl"}, "="}, {hyper, "K"}},
    ["Finder"] = {{{"ctrl"}, "TAB"}, {hyper, "R"}},
    ["1Password"] = {{{"ctrl"}, "§"}, {hyper, "N"}},
    ["Clockify Desktop"] = {{{"alt"}, "§"}, {hyper, "="}},
    ["Dash"] = {{{"cmd", "shift"}, "Q"}, {hyper, "E"}},
    ["zoom.us"] = {{{"ctrl"}, "6"}, {hyper, "Y"}},
    ["Todoist"] = {{{"ctrl"}, "5"}, {hyper, "J"}},
    ["Visual Studio Code"] = {nil, {hyper, "T"}},
    ["Keynote"] = {{{"ctrl"}, "8"}, {hyper, "U"}},
    ["Mail"] = {{{"ctrl"}, "7"}, {hyper, "Z"}},
    ["Fork"] = {nil, {hyper, "H"}},
    ["Libreoffice"] = {nil, {hyper, "O"}},
  },
}

function Keys.keyFor(name)
  local keys = Keys.triggers[name]
  if not keys then
    keys = Keys.specialTriggers[name]
  end

  return keys
end

function Keys.bindKeyFor(appName, fn, repeatFn)
  keys = Keys.keyFor(appName)
  normalKeys = keys[1]
  ergodoxKeys = keys[2]
  if normalKeys then
    shortcuts["normal"][appName] = hotkey.new(normalKeys[1], normalKeys[2], fn)
  end
  shortcuts["ergodox"][appName] = hotkey.new(ergodoxKeys[1], ergodoxKeys[2], fn, nil, function()
    if repeatFn then
      repeatFn()
    end
  end)
end

function Keys.deactivateKeys()
  for _, keys in pairs(shortcuts) do
    for __, k in pairs(keys) do
      k:disable()
    end
  end
end

function Keys.activateKeys()
  keyboardType = Keyboards.keyboardType()
  if keyboardType == "voyager" then
    keyboardType = "ergodox"
  end
  keys = shortcuts[keyboardType]
  for _, k in pairs(keys) do
    k:enable()
  end
end

return Keys
