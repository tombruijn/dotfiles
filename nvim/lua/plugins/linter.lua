return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      -- Event to trigger linters
      events = { "BufWritePost", "BufReadPost", "InsertLeave" },
      -- Active linters
      linters_by_ft = {
        ruby = { "rubocop", "ruby" },
      },
    },
    config = function(_, opts)
      local lint = require("lint")
      lint.linters_by_ft = opts.linters_by_ft

      vim.api.nvim_create_autocmd(opts.events, {
        group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    lazy = true,
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      formatters_by_ft = {
        elixir = { "mix_format" },
        javascript = { "eslint_d", "prettierd", "prettier", lsp_format = "fallback", stop_after_first = true },
        typescript = { "eslint_d", "prettierd", "prettier", lsp_format = "fallback", stop_after_first = true },
        lua = { "stylua" },
        python = { "isort", "black" },
        ruby = { "rubocop", lsp_format = "fallback" },
        eruby = { "erb_format" },
        rust = { "rustfmt", lsp_format = "fallback" },
        sh = { "shellcheck" },
      },
      format_after_save = {
        lsp_format = "fallback",
      },
    },
  },
}
