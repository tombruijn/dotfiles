return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",

      -- Adapters
      "jfpedroza/neotest-elixir",
      "olimorris/neotest-rspec",
    },
    keys = {
      { "<leader>t", "", desc = "Testing" },
      { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run tests in file" },
      { "<leader>ta", function() require("neotest").run.run(vim.uv.cwd()) end, desc = "Run all test" },
      { "<leader>td", function() require("neotest").run.run() end, desc = "Run nearest test" },
      { "<leader>ts", function() require("neotest").run.run_last() end, desc = "Run last run test" },

      { "<leader>tg", function() require("neotest").summary.toggle() end, desc = "Toggle test summary" },
      { "<leader>to", function() require("neotest").output_panel.toggle() end, desc = "Toggle test output panel" },
      { "<leader>tS", function() require("neotest").run.stop() end, desc = "Stop test runner" },
      { "<leader>tw", function() require("neotest").watch.toggle(vim.fn.expand("%")) end, desc = "Toggle test watcher" },
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-elixir"),
          require("neotest-rspec"),
          require("rustaceanvim.neotest"),
        },
      })
    end
  },
}
