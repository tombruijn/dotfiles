-- Only set this when a LSP is attached
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    -- Show LSP diagnostics
    vim.diagnostic.enable = true
    -- Configure LSP diagnostic appearance
    vim.diagnostic.config({
      virtual_lines = {
        source = true,
        prefix = true,
      },
      severity_sort = true,
      float = {
        source = "always", -- show source in float
        border = "rounded",
      },
    })

    -- Enable inline hints for every LSP
    vim.lsp.inlay_hint.enable(true)
  end,
})

return {
  {
    "neovim/nvim-lspconfig",
    -- TODO: Add this event
    -- event = "LazyFile",
    lazy = false,
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      {
        "mason-org/mason-lspconfig.nvim",
        opts = {
          ensure_installed = {
            -- These will be automatically enabled
            "lua_ls",
            "herb_ls",
            "harper_ls",
            -- ruby_lsp is part of each project bundle
            -- rust-analyzer is configured through rustaceanvim
          },
          automatic_enable = {
            exclude = {
              "harper_ls",
            }
          }
        },
      },
    },
    keys = {
      { "<leader>c", "", desc = "Language Server" },
      { "<leader>ch", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover information" },
      { "<leader>cd", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Jump to definition" },
      { "<leader>cD", "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = "Show definition" },
      { "<leader>ci", "<cmd>lua vim.lsp.buf.implementation()<cr>", desc = "List implementations" },
      { "<leader>co", "<cmd>lua vim.lsp.buf.type_definition()<cr>", desc = "Jump to type definition" },
      { "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename symbol" },
      { "<leader>ce", "<cmd>lua vim.lsp.buf.references()<cr>", desc = "List references" },
      { "<leader>c.", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "List actions" },
      { "<leader>cn", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "Show diagnostic in popup" },
      {
        "<leader>cy",
        function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end,
        desc = "Toggle inlay hints",
      },
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()

      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      lspconfig.harper_ls.setup({
        capabilities = capabilities,
        settings = {
          ["harper-ls"] = {
            userDictPath = vim.fn.expand("$HOME/.config/harper-ls/dictionary.txt"),
          },
        },
      })
      lspconfig.ruby_lsp.setup({
        -- This shell/sh command around bundle helps it find the right executable
        -- cmd = { "sh", "-c", "bundle exec ruby-lsp" },
        capabilities = capabilities,
      })
    end,
  },
}
