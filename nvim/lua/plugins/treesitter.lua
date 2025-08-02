return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter")
        .install({
          "bash",
          "c",
          "diff",
          "javascript",
          "json",
          "jsonc",
          "lua",
          "markdown",
          "markdown_inline",
          "python",
          "regex",
          "ruby",
          "toml",
          "ts",
          "typescript",
          "xml",
          "yaml",

          -- Elixir
          "elixir",
          "heex",
          "eex",

          -- Python
          "ninja",
          "rst",

          -- Rust
          "rust",
          "ron",
        })
        :wait(300000) -- wait max. 5 minutes
    end,
  },
}
