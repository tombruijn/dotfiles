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
      { "<leader>d", "", desc = "Testing" },
      {
        "<leader>df",
        function()
          require("neotest").run.run(vim.fn.expand("%"))
        end,
        desc = "Run tests in file",
      },
      {
        "<leader>da",
        function()
          require("neotest").run.run(vim.uv.cwd())
        end,
        desc = "Run all test",
      },
      {
        "<leader>dd",
        function()
          require("neotest").run.run()
        end,
        desc = "Run nearest test",
      },
      {
        "<leader>ds",
        function()
          require("neotest").run.run_last()
        end,
        desc = "Run last run test",
      },
      {
        "<leader>dq",
        function()
          require("neotest").run.stop()
        end,
        desc = "Stop test runner",
      },

      {
        "<leader>dg",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "Toggle test summary",
      },
      {
        "<leader>do",
        function()
          require("neotest").output_panel.toggle()
        end,
        desc = "Toggle test output panel",
      },
      {
        "<leader>dO",
        function()
          require("neotest").output.open()
        end,
        desc = "Open test output popup",
      },
      {
        "<leader>dc",
        function()
          require("neotest").output.clear()
        end,
        desc = "Clear test output popup",
      },
      {
        "<leader>dw",
        function()
          require("neotest").watch.toggle(vim.fn.expand("%"))
        end,
        desc = "Toggle test watcher",
      },
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-elixir"),
          require("neotest-rspec"),
          require("rustaceanvim.neotest"),
        },
        output = {
          enabled = true,
          open_on_run = false, -- Do not auto show popup on test failure
        },
        output_panel = {
          enabled = true,
        },
      })
    end,
  },
}
