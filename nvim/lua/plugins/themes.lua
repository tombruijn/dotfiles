return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
    opts = {
      style = "night",
      dim_inactive = true,
      on_colors = function(colors)
        colors.bg = "#000000"
        colors.bg_dark = "#1E1E1E" -- Inactive buffer
      end,
      on_highlights = function(hl, c)
        hl["@markup.raw.markdown_inline"] = { bg = "NONE", fg = c.green2 }
      end,
    },
    config = function(_, _opts)
      local tokyonight = require("tokyonight")
      local current_theme = "night"
      local zen_mode = false

      -- Theme configurations
      local theme_configs = {
        night = {
          style = "night",
          dim_inactive = true,
          on_colors = function(colors)
            colors.bg = "#000000"
            colors.bg_dark = zen_mode and "#000000" or "#1E1E1E"
            colors.comment = "#6B7280" -- Lighter gray for comments
          end,
          on_highlights = function(hl, c)
            hl["@markup.raw.markdown_inline"] = { bg = "NONE", fg = c.green2 }
          end,
        },
        day = {
          dim_inactive = true,
          on_colors = function(colors)
            colors.bg = "#f1f1f1"
            colors.bg_dark = zen_mode and "#f1f1f1" or "#e3e3e3"
          end,
        },
      }

      -- Apply theme configuration
      local function apply_theme(theme)
        tokyonight.setup(theme_configs[theme])
        vim.cmd.colorscheme("tokyonight-" .. theme)
        current_theme = theme
      end

      -- Toggle zen mode background matching
      local function set_zen_mode(enabled)
        zen_mode = enabled
        apply_theme(current_theme)
      end

      -- Expose functions globally
      _G.tokyonight_theme = {
        current = function()
          return current_theme
        end,
        set_zen = set_zen_mode,
        apply = apply_theme,
      }

      local function toggle_theme()
        if current_theme == "night" then
          apply_theme("day")
        else
          apply_theme("night")
        end
        -- Force complete screen refresh
        -- Otherwise the background doesn't fully update to the new color
        vim.cmd("mode")
      end

      -- Load initial theme
      apply_theme("night")

      vim.keymap.set("n", "<leader>W", toggle_theme, { desc = "Toggle between tokyonight themes" })
    end,
  },
}
