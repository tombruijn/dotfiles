" Airline should always be visible
" Not just when a split has been created
set laststatus=2

" Enable cache
" Reset with `:AirlineRefresh`
let g:airline_highlighting_cache=1

" Only load specific airline extensions
let g:airline_extensions=['tabline']

let g:airline_powerline_fonts=1

" Configure bottom/status bar
let g:airline_skip_empty_sections=1
let g:airline_detect_spell=0

" Remove noisy symbols
if !exists('g:airline_symbols')
  let g:airline_symbols={}
endif
let g:airline_symbols.linenr=''
let g:airline_symbols.maxlinenr=''

" Clean up sections on the right
let g:airline_section_y=[]
let g:airline_section_z=airline#section#create(['linenr', 'maxlinenr', ' :%3v'])

" Configure top/tab bar
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_splits=0
let g:airline#extensions#tabline#show_buffers=0
let g:airline#extensions#tabline#show_tabs=1
let g:airline#extensions#tabline#show_tab_nr=0
let g:airline#extensions#tabline#show_tab_type=0
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#show_close_button=0
let g:airline#extensions#tabline#fnamemod=':t' " Only show filename in tab label
