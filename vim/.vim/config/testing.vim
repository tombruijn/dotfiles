" Testing strategy
let test#strategy = "iterm"
let g:test#preserve_screen = 1

" test.vim mappings
map <silent> <Leader>t :TestFile<CR>
map <silent> <Leader>s :TestNearest<CR>
map <silent> <Leader>l :TestLast<CR>
map <silent> <Leader>a :TestSuite<CR>
