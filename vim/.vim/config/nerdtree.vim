" Show hidden files in NERDTree
let NERDTreeShowHidden=1

" Ignore certain files in NERDTree
let NERDTreeIgnore = ['\.git$', '\.DS_Store$', '\.bundle', 'log', 'tmp', 'coverage']

" Don't open NERDTree if I open a directory with vim
let g:NERDTreeHijackNetrw=0

" Open/Close the NERDTree using `Ctrl + T` to toggle.
nmap <C-T> :NERDTreeToggle<CR>
nmap <leader>ft :NERDTreeFind<CR>
