return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
    config = function(_, _)
      local current_theme = "night"
      local zen_mode = false

      require("tokyonight").setup({
        style = "night",
        dim_inactive = true,
        styles = {
          comments = { italic = false },
          keywords = { italic = false },
        },
        on_colors = function(colors)
          if current_theme == "night" then
            colors.bg = "#000000"
            colors.bg_dark = zen_mode and "#000000" or "#1E1E1E"
            colors.comment = "#6B7280" -- Lighter gray for comments
          else
            colors.bg = "#f1f1f1"
            colors.bg_dark = zen_mode and "#f1f1f1" or "#e3e3e3"
            colors.comment = "#6c6c6c" -- Darker gray for comments
          end
        end,
        on_highlights = function(hl, c)
          hl["@markup.raw.markdown_inline"] = { bg = "NONE", fg = c.green2 }
        end,
      })

      -- Apply theme configuration
      local function apply_theme(theme)
        current_theme = theme
        vim.cmd.colorscheme("tokyonight-" .. theme)
      end

      -- Toggle zen mode and apply the right theme
      local function set_zen_mode(enabled)
        zen_mode = enabled
        apply_theme(current_theme)
      end

      -- Expose functions globally so we can call them in snacks.lua
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

      vim.keymap.set("n", "<leader>W", toggle_theme, { desc = "Toggle between tokyonight themes" })
    end,
  },
}
