-- Works together with the formatting config for this plugin
-- Source: https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#basic-customisations
local kind_icons = {
  Text = "",
  Method = "󰆧",
  Function = "󰊕",
  Constructor = "",
  Field = "󰇽",
  Variable = "󰂡",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈙",
  Reference = "",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "󰅲",
}

return {
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = {
      "InsertEnter", -- Activate when switching to insert mode
      "CmdlineEnter", -- Activate when using the command line, either '/' or ':'
    },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
    },
    opts = function()
      local cmp = require("cmp")
      return {
        preselect = cmp.PreselectMode.None, -- Do not select any autocomplete by default
        completion = {
          completeopt = "menu,menuone,noinsert,noselect",
        },
        mapping = cmp.mapping.preset.insert({
          -- Navigate entries
          ["<S-tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
          ["<tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
          ["<UP>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
          ["<DOWN>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),

          ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
          ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),

          -- Accept or exit
          ["<CR>"] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Insert }),
          ["<ESC>"] = function()
            cmp.mapping.abort()
            vim.cmd("stopinsert")
          end,
          ["<C-e>"] = cmp.mapping.abort(),

          -- SCroll docs
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp_signature_help" },
          { name = "nvim_lsp" },
          -- { name = 'vsnip' }, -- For vsnip users.
          -- { name = 'luasnip' }, -- For luasnip users.
          -- { name = 'ultisnips' }, -- For ultisnips users.
          -- { name = 'snippy' }, -- For snippy users.
        }, {
          { name = "buffer" },
          {
            name = "path",
            option = {
              -- The relative path `./` autocomplete source, starts the
              -- relative path from the vim starting directory, not the current
              -- buffer's file location.
              get_cwd = function()
                return vim.fn.getcwd()
              end,
            },
          },
        }),
        view = {
          -- When the autocomplete opens above the cursor line, it starts
          -- selecting from the bottom of the autocomplete popup
          -- Source: https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#custom-menu-direction
          entries = { name = "custom", selection_order = "near_cursor" },
        },
        formatting = {
          -- Add the entry's source at the end of the auto complete entry
          -- Source: https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#basic-customisations
          format = function(entry, vim_item)
            -- Source icons
            vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
            -- Source list
            vim_item.menu = ({
              buffer = "[Buffer]",
              path = "[Path]",
              nvim_lsp = "[LSP]",
              luasnip = "[LuaSnip]",
              nvim_lua = "[Lua]",
              latex_symbols = "[LaTeX]",
            })[entry.source.name]
            return vim_item
          end,
        },
      }
    end,
    config = function(_, opts)
      local cmp = require("cmp")
      cmp.setup(opts)
      -- Use buffer source for `/` and `?`
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
          -- Quickly search LSP symbols
          -- Start search with `@`
          { name = "nvim_lsp_document_symbol" }
        },
      })
      -- Use cmdline & path source for ':'
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
        matching = { disallow_symbol_nonprefix_matching = false },
      })
    end,
  },
}
