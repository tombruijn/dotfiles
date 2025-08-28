-- Configure diagnostics once globally
local diagnostics_configured = false

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    -- Configure diagnostics globally (one time only)
    if not diagnostics_configured then
      -- Show LSP diagnostics
      vim.diagnostic.enable(true)
      -- Configure LSP diagnostic appearance
      vim.diagnostic.config({
        virtual_lines = true,
        severity_sort = true,
        float = {
          source = true, -- show source in float
          border = "rounded",
        },
      })
      diagnostics_configured = true
    end

    -- Enable inlay hints per buffer if the server supports them
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.supports_method("textDocument/inlayHint") then
      vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
    end
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
            },
          },
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

      local harper_ls_config = {
        capabilities = capabilities,
        settings = {
          ["harper-ls"] = {
            userDictPath = vim.fn.expand("$HOME/.config/harper-ls/dictionary.txt"),
            linters = {
              ToDoHyphen = false,
            },
          },
        },
      }
      lspconfig.harper_ls.setup(harper_ls_config)
      lspconfig.ruby_lsp.setup({
        -- This shell/sh command around bundle helps it find the right executable
        -- cmd = { "sh", "-c", "bundle exec ruby-lsp" },
        capabilities = capabilities,
      })
      vim.keymap.set("n", "<leader>c,", function()
        vim.diagnostic.enable(not vim.diagnostic.is_enabled())
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end, { desc = "Toggle LSP virtual text" })

      vim.keymap.set("n", "<leader>c;", function()
        local clients = vim.lsp.get_clients({ name = "harper_ls" })
        if #clients > 0 then
          -- Stop harper LSP
          vim.lsp.stop_client(clients)
          vim.notify("Turn off harper_ls")
        else
          -- Start harper LSP
          lspconfig.harper_ls.setup(harper_ls_config)
          vim.notify("Turn on harper_ls")
        end
      end, { desc = "Toggle harper_ls LSP" })
    end,
  },
}
