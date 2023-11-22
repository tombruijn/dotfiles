" Disable SQL Complete error on editing SQL files
" https://github.com/neovim/neovim/issues/14433#issuecomment-1183682651
let g:omni_sql_default_compl_type = 'syntax'

" Autopairs
let g:AutoPairsMultilineClose=0

" Snippets config
" Bound to C-J/K because TAB is used by autocomplete.
let g:UltiSnipsExpandTrigger="<C-J>"
let g:UltiSnipsJumpForwardTrigger="<C-J>"
let g:UltiSnipsJumpBackwardTrigger="<C-K>"

let g:ultisnips_loaded = 0 " Global variable that checks if UltiSnips is loaded or not
" Load UltiSnips when it is not already loaded when <C-J> is pressed in insert
" mode.
" Source: https://github.com/saaguero/dotvim/blob/44c3bbc9b2996fcf7e86f624785a3a06ca978167/.vimrc#L60-L69
inoremap <silent> <C-j> <C-r>=LoadUltiSnips()<cr>

function! LoadUltiSnips()
  let l:curpos = getcurpos()
  if (g:ultisnips_loaded == 0)
    execute plug#load('ultisnips')
    let g:ultisnips_loaded = 1
  end
  call cursor(l:curpos[1], l:curpos[2])
  call UltiSnips#ExpandSnippet()
  return ""
endfunction

" Load UltiSnips when <C-J> is pressed in a visual selection.
" - `<c-u>` clears the characters at the beginning of the command (:) line.
"   Avoids the function being called multiple times (for every line).
" - `call LoadUltiSnipsVisualMode()` loads UltiSnips and makes sure the
"   selection is saved for when we call UltiSnips manually.
" - `<cr>` Confirms the command line (:)
" - `gv` reselects the selection
" - `s` replaces the selection
" - Now when a snippet alias is typed and <C-J> is pressed again, the selection
"   is wrapped in the snippet.
vnoremap <silent> <C-j> :<c-u>call LoadUltiSnipsVisualMode()<cr>gvs

function! LoadUltiSnipsVisualMode()
  if (g:ultisnips_loaded == 0)
    execute plug#load('ultisnips')
    call UltiSnips#SaveLastVisualSelection()
    let g:ultisnips_loaded = 1
  end
endfunction

" Autocomplete
set wildmenu " Enhanced command line completion.
set wildmode=list:longest " Complete files like a shell.
set shortmess+=c " Turn off completion messages
set completeopt=menu,menuone,preview,noinsert,noselect
" Completion options
" :help cpt
" .: Current buffer
" b: Loaded buffers
" u: Unloaded buffers
" t: Tags
set complete=.,w,b,u,t

" mucomplete
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#chains = {
      \ 'default': ['c-n', 'omni', 'uspl', 'path', 'tags', 'ulti'],
      \ 'gitcommit': ['c-n', 'uspl', 'path']
      \ }
let g:mucomplete#no_mappings = 1
let g:mucomplete#no_popup_mappings = 1
let g:mucomplete#spel#max = 10

" Configure TAB and SHIFT-TAB to also function as CTRL-N and CTRL-P
imap <tab> <plug>(MUcompleteFwd)
imap <s-tab> <plug>(MUcompleteBwd)

" Cycle completion methods
inoremap <silent> <plug>(MUcompleteFwdKey) <c-y>
imap <c-y> <plug>(MUcompleteCycFwd)
