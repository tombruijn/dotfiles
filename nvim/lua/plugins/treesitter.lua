return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    opts = {
      parsers = {
        -- List values are file types, not extensions
        bash = { "sh" },
        c = { "c", "h" },
        css = { "css" },
        diff = { "diff" },
        gitcommit = { "gitcommit" },
        go = { "go" },
        java = { "java" },
        javascript = { "javascript" },
        json = { "json" },
        json5 = { "json" },
        lua = { "lua" },
        markdown = { "markdown" },
        markdown_inline = {},
        regex = {},
        rbs = { "rbs" },
        ruby = { "ruby" },
        toml = { "toml" },
        typescript = { "typescript" },
        xml = { "xml" },
        yaml = { "yaml" },

        -- Elixir
        elixir = { "ex", "exs" },
        heex = { "heex" },
        eex = { "eex" },

        -- Python
        python = { "python" },
        ninja = { "ninja" },
        rst = { "rst" },

        -- Rust
        rust = { "rust" },
        ron = {},
      },
    },
    config = function(_, opts)
      local parsers = {}
      local filetypes = {}
      for parser_name, parser_filetypes in pairs(opts.parsers) do
        table.insert(parsers, parser_name)
        if #parser_filetypes > 0 then
          vim.list_extend(filetypes, parser_filetypes)
        end
      end

      require("nvim-treesitter").install(parsers):wait(300000) -- Wait max. 5 minutes

      -- Extract parser names as filetypes (most parser names match filetype names)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = filetypes,
        callback = function()
          vim.treesitter.start()
        end,
      })
    end,
  },
}
