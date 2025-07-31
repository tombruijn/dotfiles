return {
  {
    "neovim/nvim-lspconfig",
    -- TODO: Add this event
    -- event = "LazyFile",
    lazy = false,
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = {},
      },
      {
        "mason-org/mason-lspconfig.nvim",
        opts = {
          ensure_installed = {
            "lua_ls",
            "herb_ls",
            -- ruby_lsp is part of each project bundle
            -- rust-analyzer is configured through rustaceanvim
          },
        },
      },
    },
    keys = {
      { "<leader>ch", "<cmd>lua vim.lsp.buf.hover()<cr>" },
      { "<leader>cd", "<cmd>lua vim.lsp.buf.definition()<cr>" },
      { "<leader>cD", "<cmd>lua vim.lsp.buf.declaration()<cr>" },
      { "<leader>ci", "<cmd>lua vim.lsp.buf.implementation()<cr>" },
      { "<leader>co", "<cmd>lua vim.lsp.buf.type_definition()<cr>" },
      { "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>" },
      { "<leader>ce", "<cmd>lua vim.lsp.buf.references()<cr>" },
      { "<leader>c.", "<cmd>lua vim.lsp.buf.code_action()<cr>" },
      { "<leader>cn", "<cmd>lua vim.lsp.buf.open_float()<cr>" },
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

      lspconfig.ruby_lsp.setup({
        -- This shell/sh command around bundle helps it find the right executable
        -- cmd = { "sh", "-c", "bundle exec ruby-lsp" }
        capabilities = capabilities,
      })
      lspconfig.herb_ls.setup({})
    end,
  },
}
