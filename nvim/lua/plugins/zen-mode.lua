return {
  "folke/zen-mode.nvim",
  opts = {
    window = {
      width = 0.70,
      height = 0.9,
      options = {
        signcolumn = "no", -- Don't show the signcolumn
        cursorline = false, -- Don't show the current line highlight
        cursorcolumn = false, -- Don't show cursor columns highlights for line length
        number = false, -- Don't show line numbers
        list = false, -- Don't show whitespace characters
      },
    },
  },
  keys = {
    {
      "<leader>F",
      function()
        require("zen-mode").toggle()
      end,
      desc = "Toggle Zen mode",
    },
  },
}
