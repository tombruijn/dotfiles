return {
  { "github/copilot.vim" },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
    opts = {
      cache = false,
      style = "night",
      dim_inactive = true,
      on_colors = function(colors)
        colors.bg = "#000000"
        colors.bg_dark = "#1E1E1E" -- Inactive buffer
      end,
      on_highlights = function(hl, c)
        -- hl.BufferInactive = {
        --   bg = "#ff0000",
        --   fg = "#616789"
        -- }
        -- NormalNC = {
        --   bg = "#ff0000",
        --   fg = "#c0caf5"
        -- }
        -- hl.BufferCurrent = {
        --   bg = "#141414",
        --   fg = c.fg_dark,
        -- }
        -- hl.Normal = {
        --   bg = "#141414",
        --   fg = "#c0caf5"
        -- }
      end,
    },
  },
  {
    "swaits/zellij-nav.nvim",
    lazy = true,
    event = "VeryLazy",
    keys = {
      { "<c-h>", "<cmd>ZellijNavigateLeftTab<cr>", { silent = true, desc = "Navigate left or tab" } },
      { "<c-j>", "<cmd>ZellijNavigateDown<cr>", { silent = true, desc = "Navigate down" } },
      { "<c-k>", "<cmd>ZellijNavigateUp<cr>", { silent = true, desc = "Navigate up" } },
      { "<c-l>", "<cmd>ZellijNavigateRightTab<cr>", { silent = true, desc = "Navigate right or tab" } },
    },
    opts = {},
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    opts = {
      options = {
        show_buffer_close_icons = false,
        show_close_icon = false,
        mode = "tabs",
      },
    },
    config = function(_, opts)
      require("bufferline").setup(opts)
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    init = function()
      vim.g.lualine_laststatus = vim.o.laststatus
      if vim.fn.argc(-1) > 0 then
        -- Set an empty statusline untill lualine loads
        vim.o.statusline = " "
      else
        -- Hide the statusline on the starter page
        vim.o.laststatus = 0
      end
    end,
    opts = function()
      -- PERF: we don't need this lualine require madness 🤷
      local lualine_require = require("lualine_require")
      lualine_require.require = require

      vim.o.laststatus = vim.g.lualine_laststatus

      return {
        options = {
          theme = "auto",
          globalstatus = vim.o.laststatus == 3,
          disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "filename" },

          lualine_c = {},
          lualine_x = { "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "selectioncount", "location" },
        },
        extensions = { "neo-tree", "lazy" },
      }
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" } },
      { "<leader>fv", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" } },
      { "<leader>fr", "<cmd>Telescope live_grep<cr>", { desc = "Grep in files" } },
    },
    config = function(_, opts)
      require("telescope").setup({
        picker = {
          layout_config = {
            anchor = "N",
          },
        },
        defaults = {
          layout_strategy = "horizontal",
          layout_config = { prompt_position = "top" },
          sorting_strategy = "ascending",
          mappings = {
            i = {
              -- map actions.which_key to <C-h> (default: <C-/>)
              -- actions.which_key shows the mappings for your picker,
              -- e.g. git_{create, delete, ...}_branch for the git_branches picker
              ["<C-h>"] = "which_key",
            },
          },
        },
      })
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = { "Neotree" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      {
        "<leader>fe",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
        end,
        desc = "Explorer NeoTree (Root Dir)",
      },
      { "<leader>ft", "<cmd>Neotree reveal<cr>", desc = "Reveal current file in NeoTree" },
    },
    deactivate = function()
      vim.cmd([[Neotree close]])
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = function()
      Snacks.toggle({
        name = "Git Signs",
        get = function()
          return require("gitsigns.config").config.signcolumn
        end,
        set = function(state)
          require("gitsigns").toggle_signs(state)
        end,
      }):map("<leader>uG")
    end,
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      dashboard = { enabled = false },
      gitbrowse = {
        enabled = true,
        what = "file",
      },
      indent = {
        enabled = true,
        animate = { enabled = false },
      },
      input = { enabled = true },
      notifier = { enabled = false },
      quickfile = { enabled = true },
      statuscolumn = { enabled = false },
      words = { enabled = true },
      zen = {
        toggles = {
          dim = false,
          git_signs = false,
        },
        show = {
          statusline = true, -- can only be shown when using the global statusline
          tabline = false,
        },
        win = {
          backdrop = { blend = 0 },
          minimal = true,
        },
        zoom = {
          toggles = {},
          show = { statusline = true, tabline = true },
          win = {
            backdrop = false,
            width = 0.80,
          },
        },
      },
    },
    keys = {
      {
        "<leader>F",
        function()
          Snacks.zen()
        end,
        desc = "Toggle Zen Mode",
      },
      {
        "<leader>R",
        function()
          Snacks.zen.zoom()
        end,
        desc = "Toggle Zen zoom",
      },
      {
        "<leader>gb",
        function()
          Snacks.gitbrowse()
        end,
        mode = { "n", "v" },
        desc = "Open file in browser",
      },
    },
  },
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {
      mappings = {
        comment = "",
        comment_line = "<leader>l",
        comment_visual = "<leader>l",
      },
    },
  },
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    opts = {
      modes = {
        insert = true,
        command = true,
        terminal = false,
      },
    },
  },
  {
    "echasnovski/mini.splitjoin",
    opts = {
      mappings = {
        toggle = "",
        split = "",
        join = "",
      },
    },
    keys = {
      {
        "<leader>j",
        function()
          require("mini.splitjoin").join()
        end,
      },
      {
        "<leader>k",
        function()
          require("mini.splitjoin").split()
        end,
      },
    },
  },
  {
    "echasnovski/mini.surround",
    event = "VeryLazy",
    opts = {
      mappings = {
        add = "sa", -- Add surrounding in Normal and Visual modes
        delete = "sd", -- Delete surrounding
        find = "sf", -- Find surrounding (to the right)
        find_left = "sF", -- Find surrounding (to the left)
        highlight = "sh", -- Highlight surrounding
        replace = "sr", -- Replace surrounding
        update_n_lines = "sn", -- Update `n_lines`
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    opts = function()
      local cmp = require("cmp")
      return {
        preselect = cmp.PreselectMode.None,
        mapping = cmp.mapping.preset.insert({
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),

          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<esc>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

          ["<tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),

          ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        }),
        sources = cmp.config.sources({
          -- { name = "nvim_lsp_signature_help" },
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
          -- { name = 'vsnip' }, -- For vsnip users.
          -- { name = 'luasnip' }, -- For luasnip users.
          -- { name = 'ultisnips' }, -- For ultisnips users.
          -- { name = 'snippy' }, -- For snippy users.
        }),
      }
    end,
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      -- Event to trigger linters
      events = { "BufWritePost", "BufReadPost", "InsertLeave" },
      -- Active linters
      linters_by_ft = {
        ruby = { "rubocop" },
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
        rust = { "rustfmt", lsp_format = "fallback" },
        sh = { "shellcheck" },
      },
      format_after_save = {
        lsp_format = "fallback",
      },
    },
  },
  {
    "williamboman/mason.nvim",
    -- lazy = true,
    cmd = { "Mason" },
    keys = {
      { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" },
    },
    build = ":MasonUpdate",
    opts_extend = { "ensure_installed" },
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    -- config = function() end,
    opts = {
      ensure_installed = { "lua_ls", "ruby_lsp", "rust_analyzer" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "mason.nvim" },
      { "mason-lspconfig.nvim" },
    },
    opts = {
      -- inlay_hints = { enabled = true },
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
      lspconfig.rust_analyzer.setup({})
      lspconfig.ruby_lsp.setup({})
      lspconfig.lua_ls.setup({})
    end,
  },
  -- {
  --   "mrcjkb/rustaceanvim",
  --   version = '^5',
  --   lazy = false, -- Plugin is already lazy
  --   -- ft = { "rust" },
  -- }
}
