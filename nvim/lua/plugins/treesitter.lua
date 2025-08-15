return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    opts = {
      parsers = {
        bash = { "sh", "bash" },
        c = { "c", "h" },
        diff = { "diff" },
        javascript = { "js", "jsx" },
        json = { "json" },
        jsonc = { "jsonc" },
        lua = { "lua" },
        markdown = { "md", "markdown" },
        markdown_inline = {},
        regex = { "regex" },
        ruby = { "rb", "ruby" },
        toml = { "toml" },
        typescript = { "ts", "tsx" },
        xml = { "xml" },
        yaml = { "yaml", "yml" },

        -- Elixir
        elixir = { "ex", "exs" },
        heex = { "heex" },
        eex = { "eex" },

        -- Python
        python = { "py" },
        ninja = { "ninja" },
        rst = { "rst" },

        -- Rust
        rust = { "rs" },
        ron = { "ron" },
      },
    },
    config = function(_, opts)
      local parsers = {}
      for parser_name, _extensions in pairs(opts.parsers) do
        table.insert(parsers, parser_name)
      end

      require("nvim-treesitter")
        .install(parsers)
        :wait(300000) -- wait max. 5 minutes

      -- Extract parser names as filetypes (most parser names match filetype names)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = parsers,
        callback = function()
          vim.treesitter.start()
        end,
      })
    end,
  },
}
