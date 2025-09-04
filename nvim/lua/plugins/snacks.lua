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
      notifier = { enabled = true },
      quickfile = { enabled = true },
      statuscolumn = { enabled = false },
      words = { enabled = true },
      zen = { enabled = false },
    },
    keys = {
      {
        "<leader>gb",
        function()
          Snacks.gitbrowse()
        end,
        mode = { "n", "v" },
        desc = "Open file in browser",
      },
      {
        "<leader>nh",
        function()
          Snacks.notifier.show_history()
        end,
        mode = { "n" },
        desc = "Show notifications history",
      },
    },
  },
}
