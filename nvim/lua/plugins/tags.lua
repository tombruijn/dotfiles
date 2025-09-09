-- Initialize gutentags settings
vim.g.gutentags_generate_on_new = 1
vim.g.gutentags_generate_on_missing = 1
vim.g.gutentags_generate_on_write = 1
vim.g.gutentags_generate_on_empty_buffer = 0

-- Check for ctags executable and set the path accordingly
if vim.fn.filereadable("/opt/homebrew/bin/ctags") == 1 then
  vim.g.gutentags_ctags_executable = "/opt/homebrew/bin/ctags"
else
  vim.g.gutentags_ctags_executable = "/usr/local/bin/ctags"
end

-- Set cache directory
vim.g.gutentags_cache_dir = "/Users/tombruijn/.cache/ctags"

return {
  {
    "ludovicchabant/vim-gutentags",
    event = "VeryLazy",
  },
}
