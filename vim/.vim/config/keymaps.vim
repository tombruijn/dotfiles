" Reload .vimrc
nnoremap <leader>R :source ~/.vimrc<CR>:nohl<CR>

" =============================================================================
" Pane navigation
" =============================================================================

" Split navigation with ctrl + hjkl
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Easier start/end of line navigation
nnoremap H ^
nnoremap L g_
vnoremap H ^
vnoremap L g_

" Go to next editor row instead of wrapped line
" Source: http://nvie.com/posts/how-i-boosted-my-vim/
nnoremap j gj
nnoremap k gk

" =============================================================================
" Search
" =============================================================================

" Search files by name
nnoremap <c-p> :Files<CR>
" Search currently open buffers
nnoremap <c-BS> :Buffers<CR>

" Search in files with Ack (ripgrep)
nnoremap <leader>fs :Ack!<Space>
nnoremap <leader>/ :Ack!<Space>
nnoremap <d-/> :Ack!<Space>
" Visually search in files with ripgrep
nnoremap <leader>fr :Rg<CR>

" Search files by name
nnoremap <leader>ff :Files<CR>
" Search currently open buffers
nnoremap <leader>fv :Buffers<CR>

" Copy filepath of focussed buffer to clipboard
noremap <leader>fc :let @* = expand('%')<CR>:echom 'File path copied'<CR>

" Toggle NERDTree
nmap <C-T> :NERDTreeToggle<CR>
nnoremap <leader>fd :NERDTreeToggle<CR>

" Clear current search highlights
nnoremap <leader>m :noh<CR>:echom 'Cleared search highlights'<CR>

" Center when going to next/previous search result
nnoremap n nzz
nnoremap N Nzz

" =============================================================================
" Files
" =============================================================================

" Write current buffer
nnoremap <leader>s :w<CR>
" Write all open buffers
nnoremap <leader>S :wa<CR>

" Replace last search
" Shorthand for :$s/<last match>/replacement/g
" Source: https://github.com/thoughtstream/Damian-Conway-s-Vim-Setup/blob/59981573773d682abb81df209c20e505ae7b703e/.vimrc#L146-L152
nmap <expr> R ':%s/' . @/ . '//g<LEFT><LEFT>'
vmap <expr> R ':s/' . @/ . '//g<LEFT><LEFT>'
" Open horizontal split pane
nnoremap <leader>vs :sp<CR>

" 'Find in Tree' finds currently open buffer file in tree
if exists('g:vscode')
  " VSCode extension
  nnoremap <leader>ft <Cmd>call VSCodeNotify('workbench.files.action.showActiveFileInExplorer')<CR>
else
  " Normal (Neo)vim
  nmap <leader>ft :NERDTreeFind<CR>
endif

" .............................................................................
" Navigate tags
" .............................................................................

" Go to tag definition
nnoremap <leader>fo <C-]>
" List all tag definitions
nnoremap <leader>Fo g<C-]>

" Go back to tag reference (opposite of C-])
nnoremap <leader>fi <C-T>
" Jump back in tags stack. Reverse `CTRL-]` functionality.
" Fixes remap of built-in CTRL-T to `C-[`.
nmap <C-[> :po1<CR>

" =============================================================================
" Alternative files
" =============================================================================

" Open alternative file: switch between source and test file
" Relies on files.vim's vim-projectionist config
nmap <silent> <leader>ra :A<CR>
nmap <silent> <leader>rx :AS<CR>
nmap <silent> <leader>rv :AV<CR>
nmap <silent> <leader>rt :AT<CR>

" =============================================================================
" Tabs
" =============================================================================

" Open new tab
nnoremap gt :tabnew<CR>
" Open new tab with same file as in current buffer
nnoremap gT :tab split<CR>

" Switch tabs
nnoremap gh :tabprevious<CR>
nnoremap gj :tabprevious<CR>
nnoremap gk :tabnext<CR>
nnoremap gl :tabnext<CR>

" =============================================================================
" Buffers and panes
" =============================================================================

" Open horizontal split pane
nnoremap <leader>vs :sp<CR>
" Open vertical split pane
nnoremap <leader>vv :vs<CR>
" Close pane
nnoremap <leader>vd <C-W>q<CR>

" Fullscreen-like behavior
" Maximize current split horizontally and vertically
nnoremap <leader>vj <C-W>\|<C-W>_
" Equalize splits (reset fullscreen)
nnoremap <leader>vk <C-W>=

" Close current buffer
nnoremap <leader>vw :bd<CR>
" Close current buffer without saving
nnoremap <leader>vq :bd!<CR>

" Close all buffers and reopen the current one
function! CloseAllButLast()
  " Close all buffers
  %bd
  " Check if there is an alternate/previous file and open it
  if bufname('#') != ''
    e#
  endif
endfunction
nnoremap <leader>vW :call CloseAllButLast()<CR>

" =============================================================================
" Comments
" =============================================================================

" Toggle comments
nnoremap <leader>l :TComment<CR>
vnoremap <leader>l :TComment<CR>

" =============================================================================
" Testing
" =============================================================================
map <silent> <leader>d :TestNearest<CR>
map <silent> <leader>dd :TestNearest<CR>
map <silent> <leader>df :TestFile<CR>
map <silent> <leader>ds :TestLast<CR>
map <silent> <leader>da :TestSuite<CR>

" =============================================================================
" LSP: Language servers
" =============================================================================
nnoremap <silent><leader>o  :LspGotoDefinition<CR>
nnoremap <silent><leader>ch :LspHover<CR>
nnoremap <silent><leader>cd :LspDiag here<CR>
nnoremap <silent><leader>cr :LspRename<CR>
nnoremap <silent><leader>ci :LspGotoImpl<CR>
nnoremap <silent><leader>c/ :LspPeekReferences<CR>
nnoremap <silent><leader>c. :LspCodeAction<CR>

" =============================================================================
" Formatting
" =============================================================================

" Use F for formatting the current paragraph
" Source: http://nvie.com/posts/how-i-boosted-my-vim/
nmap F gqap
" Use F for formatting the selection
vmap F gq

" EasyAlign keymaps
" Easily align things with: `ga<symbol>`
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" =============================================================================
" Indenting
" =============================================================================

" Map D+[ and D+] to change indenting
" Source: https://github.com/carlhuda/janus/blob/68a5d818d2ef99a2e224657394adc79d909180df/janus/vim/core/before/plugin/mappings.vim#L58-68
vmap <D-[> <gv
vmap <D-]> >gv
nmap <D-[> <<
nmap <D-]> >>

" Stay in visual mode while indenting with < and >
vmap < <gv
vmap > >gv

function! FixIndenting()
  " Preparation: save cursor position.
  let l = line(".")
  let c = col(".")

  " Format code
  execute "normal! 1G=G"

  " Restore cursor location
  call cursor(l, c)
endfunction

" Fix indenting for the entire file
nnoremap <leader>i :call FixIndenting()<CR>
" Use `=` in visual mode

" =============================================================================
" Removal with black hole
" =============================================================================

" Remove full line
nmap <leader>x "_dd
vmap <leader>x "_d
" Send single characters to black hole on deletion
nnoremap x v"_d
" Send selection characters to black hole on deletion
vnoremap x "_d

" =============================================================================
" Commands
" =============================================================================

" Show Git history for the current file
nnoremap <leader>gg :BCommits<CR>
" Show Git history for the selected lines
vnoremap <leader>gg :BCommits<CR>

nnoremap <leader>ge :Commands<CR>
nnoremap <leader>gt :Tags<CR>
nnoremap <leader>gw :Windows<CR>
nnoremap <leader>gh :History<CR>
nnoremap <leader>gs :Snippets<CR>
" Search keymaps
nnoremap <leader>gm :Maps<CR>
nnoremap <leader>g/ :History/<CR>

" =============================================================================
" Quicklist
" =============================================================================
nnoremap co :copen<CR>
nnoremap cq :cclose<CR>
nnoremap [q :cprev<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>

" =============================================================================
" Marks
" =============================================================================

" Set a mark with leader + b and A, S, D, F or G
" Got to mark with leader + b and a, s, d, f or g
" nnoremap <leader>bA mA
" nnoremap <leader>ba 'A
" nnoremap <leader>bS mS
" nnoremap <leader>bs 'S
" nnoremap <leader>bD mD
" nnoremap <leader>bD 'D
" nnoremap <leader>bF mF
" nnoremap <leader>bF 'F
" nnoremap <leader>bG mG
" nnoremap <leader>bG 'G

" =============================================================================
" Other
" =============================================================================

" Open previous open file in the active pane
nnoremap <leader><leader> :e #<CR>

" Paste without overwriting the clipboard with selection
vnoremap <leader>p "_dP

" Jump paragraph by beginning and end rather than the empty lines between them
" Source: https://www.reddit.com/r/vim/comments/458buq/moving_by_paragraph/czvy13u/
nnoremap <expr> { len(getline(line('.')-1)) > 0 ? '{+' : '{-'
nnoremap <expr> } len(getline(line('.')+1)) > 0 ? '}-' : '}+'

" Toggle spellcheck with F6
noremap <F6> :set spell! spell?<CR>

" Copy RTF formatted text to clipboard
nmap <leader>rtf :CopyRTF<CR>
vmap <leader>rtf :CopyRTF<CR>

" Format buffer with JSON
command! FormatJSON %!python3 -m json.tool

" Disable K command. Don't use the feature.
map K <Nop>
