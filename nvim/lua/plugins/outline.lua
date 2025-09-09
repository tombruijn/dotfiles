return {
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = {
      { "<leader>.", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {
      wrap = true,
      symbol_folding = {
        -- Depth past which nodes will be folded by default. Set to false to unfold all on open.
        autofold_depth = 3,
      },
    },
  },
}
