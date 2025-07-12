local set_keymap = vim.keymap.set

-- lazy.nvim
set_keymap("n", "yu", "<cmd>Lazy check<cr>", {remap = false, desc = "Check for plugin updates"})

-- Save files
set_keymap("n", "<leader>s", "<cmd>w<cr>", { desc = "Save file" })
set_keymap("n", "<leader>S", "<cmd>wa<cr>", { desc = "Save all open file" })

-- Easier start/end of line navigation
set_keymap("n", "H", "^", {remap = false, desc = "Go to first non-whitespace character on line"})
set_keymap("n", "L", "g_", {remap = false, desc = "Go to last non-whitespace character on line"})
set_keymap("v", "H", "^", {remap = false, desc = "Go to first non-whitespace character on line"})
set_keymap("v", "L", "g_", {remap = false, desc = "Go to last non-whitespace character on line"})

-- Go to next editor row instead of wrapped line
set_keymap("n", "j", "gj", {remap = false, desc = "Go to next non-wrapped line"})
set_keymap("n", "k", "gk", {remap = false, desc = "Go to previous non-wrapped line"})

-- Center when going to next/previous search result
set_keymap("n", "n", "nzz", {remap = false, desc = "Go to next centered search result"})
set_keymap("n", "N", "Nzz", {remap = false, desc = "Go to previous centered search result"})

-- Tab navigation
set_keymap("n", "gt", "<cmd>tabnew<cr>", {remap = false, desc = "Open new tab"})
set_keymap("n", "gT", "<cmd>tab split<cr>", {remap = false, desc = "Open new tab with same file as in current buffer"})

set_keymap("n", "gh", "<cmd>tabprevious<cr>", {remap = false, desc = "Previous tab"})
set_keymap("n", "gj", "<cmd>tabprevious<cr>", {remap = false, desc = "Previous tab"})
set_keymap("n", "gk", "<cmd>tabnext<cr>", {remap = false, desc = "Next tab"})
set_keymap("n", "gl", "<cmd>tabnext<cr>", {remap = false, desc = "Next tab"})

-- File navigation
set_keymap("n", "<leader><leader>", "<cmd>e#<cr>", {desc = "Open previous open file in the active pane"})

-- Files
set_keymap("n", "<leader>y", "", { desc = "+copy", silent = true })
set_keymap("n", "<leader>yn", "<cmd>let @* = expand('%:t')<cr>:echom 'File path copied'<cr>", { desc = "Copy file name", silent = true })
set_keymap("n", "<leader>ya", "<cd>let @* = expand('%:p' )<cr>:echom 'File path copied'<cr>", { desc = "Copy absolute path", silent = true })

-- Deletions
set_keymap("n", "<leader>x", '"_dd', {remap = false, desc = "Delete line (black hole)"})
set_keymap("v", "<leader>x", '"_d', {remap = false, desc = "Delete line (black hole)"})

set_keymap("n", "x", 'v"_d', {remap = false, desc = "Delete single character (black hole)"})
set_keymap("v", "x", '"_d', {remap = false, desc = "Delete selection (black hole)"})

-- Miscellaneous
set_keymap("n", "<leader>hh", "<cmd>set spell! spell?<cr>", {desc = "Toggle spell check"})
set_keymap("n", "<leader>m", "<cmd>noh<cr><cmd>echom 'Cleared search highlights'<cr>", { desc = "Clear search highlights" })

-- Use F for formatting the current paragraph
-- Source: http://nvie.com/posts/how-i-boosted-my-vim/
set_keymap("n", "F", "gqap", {desc = "Format current paragraph"})
set_keymap("v", "F", "gq", {desc = "Format selected paragraph"})
