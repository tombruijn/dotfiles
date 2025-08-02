return {
  {
    "swaits/zellij-nav.nvim",
    lazy = true,
    event = "VeryLazy",
    keys = {
      { "<c-h>", "<cmd>ZellijNavigateLeftTab<cr>", { silent = true, desc = "Navigate left or tab" } },
      { "<c-j>", "<cmd>ZellijNavigateDown<cr>", { silent = true, desc = "Navigate down" } },
      { "<c-k>", "<cmd>ZellijNavigateUp<cr>", { silent = true, desc = "Navigate up" } },
      { "<c-l>", "<cmd>ZellijNavigateRightTab<cr>", { silent = true, desc = "Navigate right or tab" } },
    },
    opts = {},
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = function()
      Snacks.toggle({
        name = "Git Signs",
        get = function()
          return require("gitsigns.config").config.signcolumn
        end,
        set = function(state)
          require("gitsigns").toggle_signs(state)
        end,
      }):map("<leader>hg")
    end,
  },
  {
    "mrcjkb/rustaceanvim",
    version = '^6',
    lazy = false, -- Plugin is already lazy
  },
}
