return {
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
      notifier = { enabled = true },
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
          backdrop = 0,
          minimal = true,
          width = 0.60, -- Add padding by reducing width
          height = 0.9,
          wo = {
            wrap = true, -- Enable word wrap
          },
        },
        zoom = {
          toggles = {},
          show = { statusline = true, tabline = true },
          win = {
            backdrop = false,
            width = 0.60,
          },
        },
        on_open = function()
          if _G.tokyonight_theme then
            _G.tokyonight_theme.set_zen(true)
          end
          local current_font = vim.opt.guifont:get()[1] or ""
          if current_font ~= "" then
            local font_parts = vim.split(current_font, ":")
            local font_name = font_parts[1]
            vim.opt.guifont = font_name .. ":h24"
          end
        end,
        on_close = function()
          if _G.tokyonight_theme then
            _G.tokyonight_theme.set_zen(false)
          end
          local current_font = vim.opt.guifont:get()[1] or ""
          if current_font ~= "" then
            local font_parts = vim.split(current_font, ":")
            local font_name = font_parts[1]
            vim.opt.guifont = font_name .. ":h18"
          end
        end,
      },
    },
    keys = {
      {
        "<leader>F",
        function()
          Snacks.zen()
        end,
        desc = "Toggle Zen mode",
      },
      {
        "<leader>gb",
        function()
          Snacks.gitbrowse()
        end,
        mode = { "n", "v" },
        desc = "Open file in browser",
      },
      {
        "<leader>nh",
        function()
          Snacks.notifier.show_history()
        end,
        mode = { "n" },
        desc = "Show notifications history",
      },
    },
  },
}
