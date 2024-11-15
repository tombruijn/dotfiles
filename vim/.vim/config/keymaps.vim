" Reload .vimrc
nnoremap <leader>R :source ~/.vimrc<CR>:nohl<CR>

" Copy filepath of focussed buffer to clipboard
nnoremap <leader>fc :let @* = expand('%')<CR>

" Easier direct split navigation with ctrl + homerow keys
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Open Ack search on `Leader or Command + /`
nnoremap <d-/> :Ack!<Space>
nnoremap <leader>/ :Ack!<Space>

" Toggle comments on `Leader + l`
nnoremap <leader>l :TComment<CR>
vnoremap <leader>l :TComment<CR>

" Toggle spellcheck with F6
noremap <F6> :set spell! spell?<CR>

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

" EasyAlign keymaps
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Disable K command. Don't use the feature.
map K <Nop>

" Paste without overwriting the clipboard with selection
vnoremap <leader>p "_dP

" Send single characters to black hole on deletion
nnoremap x v"_d
" Send selection characters to black hole on deletion
vnoremap x "_d

" Write buffer on <leader>w
nnoremap <leader>w :w<CR>

" Jump paragraph by beginning and end rather than the empty lines between them
" Source: https://www.reddit.com/r/vim/comments/458buq/moving_by_paragraph/czvy13u/
nnoremap <expr> { len(getline(line('.')-1)) > 0 ? '{+' : '{-'
nnoremap <expr> } len(getline(line('.')+1)) > 0 ? '}-' : '}+'

" Jump back in tags stack. Reverse `CTRL-]` functionality.
" Remaps built-in CTRL-T to `C-[`.
nmap <C-[> :po1<CR>

" Open alternative file: switch between source and test file
" Relies on files.vim vim-projectionist config
nmap <silent> <leader>ra :A<CR>
nmap <silent> <leader>rx :AS<CR>
nmap <silent> <leader>rv :AV<CR>
nmap <silent> <leader>rt :AT<CR>

" Format buffer with JSON
command! FormatJSON %!python3 -m json.tool

" Quicklist
nnoremap <leader>q :cclose<CR>
nnoremap cq :cclose<CR>
nnoremap [q :cprev<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>

" Copy RTF formatted text to clipboard
nmap <leader>rtf :CopyRTF<CR>
vmap <leader>rtf :CopyRTF<CR>

" Easier mapping for finding tags
nnoremap <leader>fo <C-]>
nnoremap <leader>fO g<C-]>
" Go back to tag reference (opposite of C-])
nnoremap <leader>fi <C-T>

" Buffers
" Open new tab
nnoremap <leader>bt :tabnew<CR>
" Open new tab with same file as in current buffer
nnoremap <leader>bT :tab split<CR>
" Open horizontal split pane
nnoremap <leader>bs :sp<CR>
" Open vertical split pane
nnoremap <leader>bv :vs<CR>
" Close buffer
nnoremap <leader>bw :bd<CR>
" Close buffer without saving
nnoremap <leader>bW :bd!<CR>
" Maximize current split
nnoremap <leader>bu <C-W>_
" Equalize splits
nnoremap <leader>by <C-W>=

" Close all buffers and reopen the current one
function! CloseAllButLast()
  " Delete all buffers
  %bd
  " Check if there is an alternate/previous file and open it
  if bufname('#') != ''
    e#
  endif
endfunction
nnoremap <leader>bq :call CloseAllButLast()<CR>
