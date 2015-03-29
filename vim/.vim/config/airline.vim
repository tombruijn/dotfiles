" Airline should always be visible
" Not just when a split has been created
set laststatus=2

" Dark solarized theme
let g:airline_theme='solarized'
let g:airline_theme#background='dark'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#enabled = 0

let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
