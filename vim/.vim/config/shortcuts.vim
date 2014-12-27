" Cycle through buffers with tab
nmap <Tab> <C-w>w

" Open Ack search on `Command + /`
nnoremap <d-/> :Ack<Space>

" Toggle comments on `Command + \`
nnoremap <d-\> :TComment<cr>
vnoremap <d-\> :TComment<cr>
inoremap <d-\> <ESC>:TComment<cr>i

" Toggle spellcheck with F6
noremap <F6> :set spell! spell?<CR>

" Lazy command open
nnoremap ; :

" upper/lower word
" Source: https://github.com/carlhuda/janus/blob/68a5d818d2ef99a2e224657394adc79d909180df/janus/vim/core/before/plugin/mappings.vim#L12-14
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" Map D+[ and D+] to change indenting
" Source: https://github.com/carlhuda/janus/blob/68a5d818d2ef99a2e224657394adc79d909180df/janus/vim/core/before/plugin/mappings.vim#L58-68
vmap <D-]> >gv
vmap <D-[> <gv

nmap <D-]> >>
nmap <D-[> <<

omap <D-]> >>
omap <D-[> <<

imap <D-]> <Esc>>>i
imap <D-[> <Esc><<i
