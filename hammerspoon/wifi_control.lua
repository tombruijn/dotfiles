local hotkey = require "hs.hotkey"
local alert = require "hs.alert"

WiFiControl = {}

function WiFiControl.toggle()
  output = io.popen("networksetup -getairportpower en0", "r")
  result = output:read()
  if result:find(": On") then
    alert.show("Wi-Fi: Off")
    os.execute("networksetup -setairportpower en0 off")
  else
    alert.show("Wi-Fi: On")
    os.execute("networksetup -setairportpower en0 on")
  end
end

return WiFiControl
