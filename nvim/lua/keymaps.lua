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

-- Panels
set_keymap("n", "<leader>vd", "<C-W>q<CR>", {desc = "Close active pane"})
set_keymap("n", "<leader>vw", ":bd<CR>", {desc = "Close current buffer"})
set_keymap("n", "<leader>vq", ":bd!<CR>", {desc = "Close current buffer without saving"})

--- Fullscreen-like behavior
set_keymap("n", "<leader>vj", "<C-W>\\|<C-W>_", {desc = "Maximize current split horizontally and vertically"})
set_keymap("n", "<leader>vk", "<C-W>=", {desc = "Equalize splits (reset fullscreen)"})

-- File navigation
set_keymap("n", "<leader><leader>", "<cmd>e#<cr>", {desc = "Open previous open file in the active pane"})

-- Files
set_keymap("n", "<leader>y", "", { desc = "+copy", silent = true })
set_keymap("n", "<leader>yn", "<cmd>let @* = expand('%:t')<cr>:echom 'File path copied'<cr>", { desc = "Copy file name", silent = true })
set_keymap("n", "<leader>ya", "<cd>let @* = expand('%:p')<cr>:echom 'File path copied'<cr>", { desc = "Copy absolute path", silent = true })

-- Deletions
set_keymap("n", "<leader>x", '"_dd', {remap = false, desc = "Delete line (black hole)"})
set_keymap("v", "<leader>x", '"_d', {remap = false, desc = "Delete line (black hole)"})

set_keymap("n", "x", 'v"_d', {remap = false, desc = "Delete single character (black hole)"})
set_keymap("v", "x", '"_d', {remap = false, desc = "Delete selection (black hole)"})

-- Miscellaneous
set_keymap("n", "<leader>hh", "<cmd>set spell! spell?<cr>", {desc = "Toggle spell check"})
set_keymap("n", "<leader>m", "<cmd>noh<cr><cmd>echom 'Cleared search highlights'<cr>", { desc = "Clear search highlights" })

set_keymap("v", "<leader>p", '"_dP', { desc = "Paste without overwriting the clipboard with selection" })

-- Indenting
-- Source: https://github.com/carlhuda/janus/blob/68a5d818d2ef99a2e224657394adc79d909180df/janus/vim/core/before/plugin/mappings.vim#L58-68
set_keymap("v", "<D-[>", "<gv", { desc = "Indent selection further left" })
set_keymap("v", "<D-]>", ">gv", { desc = "Indent selection further right" })
set_keymap("n", "<D-[>", "<<", { desc = "Indent line further left" })
set_keymap("n", "<D-]>", ">>", { desc = "Indent line further right" })

-- Stay in visual mode while indenting with < and >
set_keymap("v", "<", "<gv", { desc = "Indent selection further left" })
set_keymap("v", ">", ">gv", { desc = "Indent selection further right" })

-- Use F for formatting the current paragraph
-- Source: http://nvie.com/posts/how-i-boosted-my-vim/
set_keymap("n", "F", "gqap", { desc = "Format the current paragraph" })
set_keymap("v", "F", "gq", { desc = "Format the selected paragraph" })

-- Map GitHub Copilot autocomplete accept to another key so TAB doesn't conflict with the autocomplete
vim.keymap.set("i", "<C-L>", 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})
vim.g.copilot_no_tab_map = true
