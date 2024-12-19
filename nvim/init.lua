require("config.lazy")
require("keymaps")

vim.cmd.colorscheme("tokyonight-night")

-- Indenting
vim.o.tabstop = 2 -- Set tab width
vim.o.shiftwidth = 2 -- Set tab width
vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.shiftround = true

-- Scroll
vim.o.scrolloff = 5 -- Line scroll offset from top and bottom
vim.o.breakindent = true -- Add indenting after break
vim.o.showbreak = "↳ " -- Line break indicator

-- Auto complete
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Sidebar/gutter configuration
vim.o.number = true
vim.o.signcolumn = "yes:2" -- Always show signcolumn, max width 2

-- Show invisible characters
vim.o.list = true
vim.opt.listchars = {
  nbsp = "␣",
  space = "·",
  tab = ">-",
  extends = "»",
  precedes = "«",
  trail = "·",
}
vim.opt.fillchars = {
  eob = " ", -- Rendered empty lines at end of the file
}

-- Search
vim.o.ignorecase = true -- Case-insensitive searching.
vim.o.smartcase = true -- But case-sensitive if expression contains a capital letter.

-- Miscellaneous
vim.o.title = true -- Set the terminal's title
vim.o.cursorline = true -- Highlight the line of the cursor.
vim.opt.colorcolumn = { 80, 100 } -- Highlight columns as rulers

vim.o.clipboard = "unnamedplus" -- Enable OS clipboard to properly paste in to VIM buffer
vim.o.swapfile = false -- Disable .swp file creation
