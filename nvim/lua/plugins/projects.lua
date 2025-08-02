return {
  {
    "tpope/vim-projectionist",
    keys = {
      -- Alternative files
      -- Open alternative file: switch between source and test file
      -- Relies on files.vim's vim-projectionist config
      { "<leader>r", "", desc = "Related files" },
      { "<leader>ra", "<cmd>A<cr>", desc = "Open alternate file" },
      { "<leader>rs", "<cmd>AS<cr>", desc = "Open alternate file in a horizontal split" },
      { "<leader>rv", "<cmd>AV<cr>", desc = "Open alternate file in a vertical split" },
      { "<leader>rt", "<cmd>AT<cr>", desc = "Open alternate file in a tab" },
    }
  },
}
