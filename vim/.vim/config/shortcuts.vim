nmap <leader>w :w<CR>


" Cycle through splits with tab
nmap <Tab> <C-w>w

" Easier direct split navigation with ctrl + homerow keys
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Maximize current split
nnoremap <leader>- <C-W>_
" Equalize splits
nnoremap <leader>= <C-W>=

" Reload .vimrc
nnoremap <leader>r :source ~/.vimrc<CR>:nohl<CR>

" Open Ack search on `Command + /`
nnoremap <d-/> :Ack!<Space>
nnoremap <leader>/ :Ack!<Space>

" Toggle comments on `Command/Leader + \`
nnoremap <d-\> :TComment<cr>
nnoremap <leader>\ :TComment<cr>
vnoremap <d-\> :TComment<cr>
vnoremap <leader>\ :TComment<cr>

" Toggle spellcheck with F6
noremap <F6> :set spell! spell?<CR>

" Navigate to the next-previous ALE error
nmap <silent> [w <Plug>(ale_previous_wrap)
nmap <silent> ]w <Plug>(ale_next_wrap)

" Easier start/end of line navigation
nnoremap H ^
nnoremap L g_
vnoremap H ^
vnoremap L g_

" Copy line without line ending
nmap <leader>yl 0y$
nmap <leader>cl 0d$"_dd

" Remove full line with <leader>d
nmap <leader>d "_dd
vmap <leader>d "_d

" Use F for formatting the current paragraph (or selection)
" Source: http://nvie.com/posts/how-i-boosted-my-vim/
vmap F gq
nmap F gqap

" Go to next editor row instead of wrapped line
" Source: http://nvie.com/posts/how-i-boosted-my-vim/
nnoremap j gj
nnoremap k gk

" Map D+[ and D+] to change indenting
" Source: https://github.com/carlhuda/janus/blob/68a5d818d2ef99a2e224657394adc79d909180df/janus/vim/core/before/plugin/mappings.vim#L58-68
vmap <D-[> <gv
vmap <D-]> >gv
nmap <D-[> <<
nmap <D-]> >>
" Stay in visual mode while indenting with < and >
vmap < <gv
vmap > >gv

" Open previous edited file
nnoremap <leader><leader> :e #<CR>

" Quickfix window open and close
nmap <silent> <leader>fs :cclose<CR>
nmap <silent> <leader>fd :copen<CR>

" EasyAlign shortcuts
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Disable K command. Don't use the feature.
map K <Nop>
