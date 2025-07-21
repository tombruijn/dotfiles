return {
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
}
