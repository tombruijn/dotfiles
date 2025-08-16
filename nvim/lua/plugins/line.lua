-- Check if spell is enabled
local function spell_status()
  local is_spell_enabled = vim.o.spell
  if is_spell_enabled then
    return "[spell]"
  else
    return ""
  end
end

-- Check if paste mode is enabled
local function paste_mode_status()
  local is_paste_mode = vim.o.paste
  if is_paste_mode then
    return "[paste]"
  else
    return ""
  end
end

-- Show current line number and total number of lines in the current file
local function line_number_and_column()
  local current_line = vim.fn.line(".")
  local total_lines = vim.fn.line("$")
  local current_column = vim.fn.col(".")
  return current_line .. "/" .. total_lines .. " : " .. current_column
end

return {
  {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    opts = {
      options = {
        themable = true,
        show_buffer_icons = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = false,
        show_duplicate_prefix = false,
        mode = "tabs",
        indicator = {
          style = "none",
        },
        numbers = "none",
      },
      highlights = {
        tab_selected = {
          italic = false,
          bg = "#00a2ff",
        },
        buffer_selected = {
          italic = false,
          fg = "#15161e",
          bg = "#80a3f3",
        },
        modified_selected = {
          italic = false,
          fg = "#15161e",
          bg = "#80a3f3",
        },
        modified = {
          italic = true,
        },
        duplicate_selected = {
          italic = false,
          fg = "#15161e",
          bg = "#80a3f3",
        },
        duplicate = {
          italic = true,
        },
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
        -- Set an empty statusline until lualine loads
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
        -- What to show when the buffer is active
        sections = {
          lualine_a = { "mode" },
          lualine_b = {
            { "filename", path = 1 },
          },
          lualine_c = {
            "diagnostics",
            { "lsp_status", icons_enabled = false },
          },

          lualine_x = { spell_status, paste_mode_status },
          lualine_y = {
            { "filetype", icons_enabled = false },
          },
          lualine_z = { line_number_and_column },
        },
        -- What to show when the buffer is inactive
        inactive_sections = {
          lualine_a = {},
          lualine_b = {
            { "filename", path = 1 },
          },
          lualine_c = {
            "diagnostics",
            { "lsp_status", icons_enabled = false },
          },
          lualine_x = {},
          lualine_y = {
            { "filetype", icons_enabled = false },
          },
          lualine_z = {},
        },
        extensions = { "neo-tree", "lazy" },
      }
    end,
  },
}
