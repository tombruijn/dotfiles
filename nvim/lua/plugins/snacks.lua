return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      dashboard = { enabled = false },
      gitbrowse = {
        enabled = true,
        what = "file",
      },
      indent = {
        enabled = true,
        animate = { enabled = false },
      },
      input = { enabled = true },
      notifier = { enabled = false },
      quickfile = { enabled = true },
      statuscolumn = { enabled = false },
      words = { enabled = true },
      zen = {
        toggles = {
          dim = false,
          git_signs = false,
        },
        show = {
          statusline = true, -- can only be shown when using the global statusline
          tabline = false,
        },
        win = {
          backdrop = { blend = 0 },
          minimal = true,
        },
        zoom = {
          toggles = {},
          show = { statusline = true, tabline = true },
          win = {
            backdrop = false,
            width = 0.80,
          },
        },
      },
    },
    keys = {
      {
        "<leader>F",
        function()
          Snacks.zen()
        end,
        desc = "Toggle Zen Mode",
      },
      {
        "<leader>gb",
        function()
          Snacks.gitbrowse()
        end,
        mode = { "n", "v" },
        desc = "Open file in browser",
      },
    },
  },
}
