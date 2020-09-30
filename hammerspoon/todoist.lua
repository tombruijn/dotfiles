local hotkey = require "hs.hotkey"
local application = require "hs.application"

local projects = require "todoist_projects"
Todoist = {
  ["projects"] = projects,
  ["shortcuts"] = {}
}

function openTodoistProject(project)
  currentApplication = application.frontmostApplication()
  if currentApplication:title() == "Todoist" then
    hs.eventtap.keyStroke({"cmd"}, "f") -- Focus search field
    hs.eventtap.keyStrokes(project) -- Enter project name
    hs.eventtap.keyStroke({}, "return") -- Submit by pressing enter
  end
end

function shortcutFor(index, project)
  shortcut = hotkey.bind({"cmd"}, "" .. index, function()
    openTodoistProject(project)
  end)
  -- Disable by default
  -- Only enable when Todoist app has focus
  shortcut:disable()
  table.insert(Todoist.shortcuts, shortcut)
end

for _, project in pairs(Todoist.projects) do
  shortcutFor(project[1], project[2])
end

function Todoist.enable(enable)
  for _, shortcut in pairs(Todoist.shortcuts) do
    if enable then
      shortcut:enable()
    else
      shortcut:disable()
    end
  end
end

return Todoist
