local function add_to_dictionary_and_restart()
  -- Grab the word under the cursor
  local word = vim.fn.expand("<cword>")
  if word == "" then
    vim.notify("No word under cursor", vim.log.levels.WARN)
    return
  end

  local dict_path = _G.harper_dictionary_path()

  -- Make sure the target directory exists
  local dir = vim.fn.fnamemodify(dict_path, ":h")
  vim.fn.mkdir(dir, "p")

  -- Append the word (with a trailing newline)
  local ok = vim.fn.writefile(
    { word },
    dict_path,
    "a" -- append mode
  )
  if ok ~= 0 then
    vim.notify(string.format("Failed to write to %s", dict_path), vim.log.levels.ERROR)
    return
  end

  vim.cmd("LspRestart harper_ls")
  vim.notify(string.format("Added '%s' to Harper dictionary", word))
end

vim.keymap.set(
  "n",
  "<leader>ga",
  add_to_dictionary_and_restart,
  { desc = "Add word under cursor to Harper‑LS dictionary and restart" }
)
