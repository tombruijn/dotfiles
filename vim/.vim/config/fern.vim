" Configure my own mappings
let g:fern#disable_default_mappings = 1

" Always hide these items
let g:fern#default_hidden = 1
let g:fern#default_exclude = '^\%(\.git\|_build\|coverage\|tmp\|node_modules\|\.DS_Store\)$'

" Styling
let g:fern#renderer#default#leading = "  "
let g:fern#renderer#default#leaf_symbol = ""
let g:fern#renderer#default#collapsed_symbol = "▸ "
let g:fern#renderer#default#expanded_symbol = "▾ "

function! s:init_fern() abort
  " Disable line numbers in fern drawer
  set nonumber

  " Define NERDTree like mappings
  " Stay on current line by default after expanding a directory
  nmap <buffer>
    \ <Plug>(fern-action-expand)
    \ <Plug>(fern-action-expand:stay)

  " Multi-purpose open/expand/collapse mapping
  nmap <buffer><expr>
    \ <Plug>(fern-my-open-expand-collapse)
    \ fern#smart#leaf(
    \   "\<Plug>(fern-action-open:select)",
    \   "\<Plug>(fern-action-expand)",
    \   "\<Plug>(fern-action-collapse)",
    \ )
  nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> o <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> go <Plug>(fern-action-open:edit)<C-w>p

  " Collapse current node (parent directory)
  nmap <buffer> x <Plug>(fern-action-collapse)

  " Tabs
  " Open in new tab
  nmap <buffer> t <Plug>(fern-action-open:tabedit)
  " Open in new background tab
  nmap <buffer> T <Plug>(fern-action-open:tabedit)gT

  " Splits
  nmap <buffer> i <Plug>(fern-action-open:split)
  nmap <buffer> gi <Plug>(fern-action-open:split)<C-w>p

  nmap <buffer> s <Plug>(fern-action-open:vsplit)
  nmap <buffer> gs <Plug>(fern-action-open:vsplit)<C-w>p

  " Modifiers
  nmap <buffer> ma <Plug>(fern-action-new-file)
  nmap <buffer> mc <Plug>(fern-action-copy)
  nmap <buffer> mm <Plug>(fern-action-move)
  nmap <buffer> md <Plug>(fern-action-trash)
  nmap <buffer> mr <Plug>(fern-action-open:system)
  nmap <buffer> my <Plug>(fern-action-yank:path)

  " Other
  nmap <buffer> r <Plug>(fern-action-reload)
  nmap <buffer> R gg<Plug>(fern-action-reload)<C-o>

  nmap <buffer> I <Plug>(fern-action-hidden:toggle)

  nmap <buffer> q :<C-u>quit<CR>
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END

if exists('g:vscode')
  " VSCode extension
  nnoremap <leader>ft <Cmd>call VSCodeNotify('workbench.files.action.showActiveFileInExplorer')<CR>
else
  " Normal (Neo)vim
  " Open the file tree
  nmap <C-T> :Fern . -drawer -toggle<CR>
  " 'Find in Tree' find currently open buffer file in tree
  nmap <leader>ft :Fern . -drawer -reveal=%<CR>
endif
