-- Configure persistent undo
-- Be able to undo changes between neovim instances

local undodir = vim.fn.expand("~/.NVIM_UNDO_FILES")
vim.fn.mkdir(undodir, "p") -- "p" creates the directory if it does not exist

vim.opt.undolevels = 5000
vim.opt.undofile = true
vim.opt.undodir = undodir
