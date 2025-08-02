return {
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
        desc = "Join operator"
      },
      {
        "<leader>k",
        function()
          require("mini.splitjoin").split()
        end,
        desc = "Split operator"
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
}
