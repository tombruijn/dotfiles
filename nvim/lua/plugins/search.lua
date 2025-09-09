vim.g.ackprg = "rg --vimgrep"

vim.keymap.set("n", "<leader>/", ":Ack! ", { desc = "Start multi-file search" })

return {
  "mileszs/ack.vim",
  cmd = "Ack",
}
