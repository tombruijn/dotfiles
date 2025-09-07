local opt = vim.opt_local

opt.expandtab = false -- Don't convert tabs into spaces

opt.tabstop = 4 -- Show a tab as 4 spaces
opt.shiftwidth = 4 -- Indent with 4 spaces
opt.softtabstop = 0 -- No "soft" tab handling

opt.listchars:append("tab:  ▸")
