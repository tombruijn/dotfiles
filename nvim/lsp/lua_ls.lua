return {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim", "Snacks" }, -- when working on nvim config
      },
      format = {
        enable = false, -- Rely on stylua
      },
    },
  },
}
