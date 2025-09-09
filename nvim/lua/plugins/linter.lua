return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      -- Event to trigger linters
      events = { "BufWritePost", "BufReadPost", "InsertLeave" },
      -- Active linters
      linters_by_ft = {
        bash = { "bash", "shellcheck" },
        elixir = { "credo" },
        json = { "json5" },
        php = { "php" },
        python = { "flake8", "mypy", "ruff" },
        ruby = { "ruby", "rubocop" },
        sh = { "bash", "shellcheck" },
        zsh = { "zsh" },
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
        elixir = { "mix" },
        javascript = { "eslint_d", "prettierd", "prettier", lsp_format = "fallback", stop_after_first = true },
        typescript = { "eslint_d", "prettierd", "prettier", lsp_format = "fallback", stop_after_first = true },
        lua = { "stylua" },
        python = { "isort", "black" },
        ruby = { "rubocop", lsp_format = "fallback" },
        eruby = { "erb_format" },
        rust = { "rustfmt", lsp_format = "fallback" },
        sh = { "shellcheck" },
      },
      formatters = {
        rubocop = {
          -- Only run RuboCop if a config file is found in the project directory
          condition = function(_, _)
            local function find_rubocop_config(path)
              local config_files = { ".rubocop.yml" }
              for _, config in ipairs(config_files) do
                if vim.fn.filereadable(path .. "/" .. config) == 1 then
                  return true
                end
              end
              return false
            end

            local current_dir = vim.fn.expand("%:p:h")
            while current_dir ~= "/" do
              if find_rubocop_config(current_dir) then
                return true
              end
              current_dir = vim.fn.fnamemodify(current_dir, ":h")
            end
            return false
          end,
        },
      },
      format_on_save = {
        lsp_format = "fallback",
        timeout_ms = 500,
      },
    },
  },
}
