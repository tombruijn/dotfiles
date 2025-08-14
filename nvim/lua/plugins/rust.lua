vim.g.rustaceanvim = {
  server = {
    on_attach = function(_, bufnr)
      vim.keymap.set("n", "<leader>cR", function()
        vim.cmd.RustLsp("codeAction")
      end, { desc = "Code Action", buffer = bufnr })
    end,
    default_settings = {
      ["rust-analyzer"] = {
        cargo = {
          features = true,
          loadOutDirsFromCheck = true,
          buildScripts = {
            enable = true,
          },
          extraEnv = { CARGO_TARGET_DIR = "tmp/rust_analyzer_target" },
        },
        check = {
          command = "clippy",
          extraArgs = { "--no-deps" },
        },
        files = {
          watcher = "server",
          excludeDirs = {
            ".direnv",
            ".git",
            ".github",
            ".gitlab",
            ".venv",
            "bin",
            "node_modules",
            "script",
            "target",
            "venv",
            -- Custom cache directories
            "rust_analyzer_target",
            "clippy_local",
          },
        },
      },
    },
  },
  tools = {
    code_actions =  {
      -- use vim.ui for code actions
      ui_select_fallback = true
    }
  }
}

return {
  {
    "mrcjkb/rustaceanvim",
    version = '^6',
    ft = { "rust" },
  },
}
