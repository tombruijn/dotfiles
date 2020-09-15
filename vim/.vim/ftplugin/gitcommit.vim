" Color column
" - 50 for commit subject
" - 72 for commit message
setlocal colorcolumn=50,72

" Set max line width to max commit message width
setlocal spell textwidth=72

" Unset vim-rhubarb autocomplete. It's slow.
setlocal omnifunc&
