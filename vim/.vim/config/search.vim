let g:ackprg='ag --hidden --path-to-ignore ~/.ignore --vimgrep'

" Clear current search highlights
nnoremap <leader>m :noh<CR>

" Center search results
nnoremap n nzz
nnoremap N Nzz

" Replace last search
" Shorthand for :$s/<last match>/replacement/g
" Source: https://github.com/thoughtstream/Damian-Conway-s-Vim-Setup/blob/59981573773d682abb81df209c20e505ae7b703e/.vimrc#L146-L152
nmap <expr> R ':%s/' . @/ . '//g<LEFT><LEFT>'
vmap <expr> R ':s/' . @/ . '//g<LEFT><LEFT>'

" Enable live search and replace in Neovim
if has("nvim")
  set inccommand=nosplit
endif
