-- Map GitHub Copilot autocomplete accept to another key so TAB doesn't conflict with the autocomplete
vim.g.copilot_no_tab_map = true
vim.keymap.set("i", "<C-L>", 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
})

-- Toggle Copilot on and off
local function toggle_copilot()
  if vim.fn.exists("g:loaded_copilot") == 1 then
    local status = vim.fn.execute("Copilot status")
    vim.notify("Status: " .. status)
    if string.find(status, "Ready") then
      vim.cmd("Copilot disable")
      vim.notify("Copilot disabled")
    else
      vim.cmd("Copilot enable")
      vim.notify("Copilot enabled")
    end
  else
    vim.notify("Copilot not found")
  end
end
vim.keymap.set("n", "<leader>cu", toggle_copilot, { desc = "Toggle Copilot", noremap = true, silent = true })

return {
  { "github/copilot.vim" },
}
