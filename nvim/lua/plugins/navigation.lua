return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<c-p>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>f", "", desc = "Find files" },
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>fv", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
      { "<leader>fr", "<cmd>Telescope live_grep<cr>", desc = "Grep in files" },

      { "<leader>g", "", desc = "Find miscellaneous" },
      { "<leader>gc", "<cmd>Telescope commands<cr>", desc = "Search command" },
      { "<leader>gt", "<cmd>Telescope tags<cr>", desc = "Search tag" },
      { "<leader>gh", "<cmd>Telescope help_tags<cr>", desc = "Search vim help" },
      { "<leader>gm", "<cmd>Telescope marks<cr>", desc = "Search marks" },
      { "<leader>gs", "<cmd>Telescope spell_suggest<cr>", desc = "Search spelling suggestions" },
      { "<leader>gkm", "<cmd>Telescope keymaps<cr>", desc = "Search keymaps" },

      { "<leader>cx", "<cmd>Telescope diagnostics<cr>", desc = "List all diagnostics in workspace" },
    },
    config = function(_, _)
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

              -- Press ESC to exit immediatly
              -- By default it will exit from insert mode to normal mode, but I
              -- notice I don't want to press ESC twice to exit.
              ["<esc>"] = require("telescope.actions").close,
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
    opts = {
      window = {
        mappings = {
          ["o"] = "open",
          -- Disable these keymaps
          ["oc"] = false,
          ["od"] = false,
          ["og"] = false,
          ["om"] = false,
          ["on"] = false,
          ["os"] = false,
          ["ot"] = false,
          -- Show path in prompt
          ["c"] = { "copy", config = { show_path = "relative" } },
          -- Show path in prompt
          ["m"] = { "move", config = { show_path = "relative" } },
          ["x"] = "close_node",
        },
      },
    },
  },
}
