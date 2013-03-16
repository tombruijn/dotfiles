" Extend ir_black syntax highlighting
runtime colors/ir_black.vim

" Theme is called "machina"
let g:colors_name = "machina"

" Global Syntax Highlighting
hi String ctermfg=green
hi Number ctermfg=red
hi Keyword ctermfg=cyan
hi Statement ctermfg=cyan
hi Include ctermfg=darkcyan
hi Constant ctermfg=cyan
hi Type ctermfg=cyan
hi Function ctermfg=darkcyan
hi Define ctermfg=darkcyan
hi Boolean ctermfg=red

" Ruby Specific Syntax Highlighting
hi rubyInstanceVariable ctermfg=blue
hi rubyClassVariable ctermfg=darkblue
hi rubyDefine ctermfg=darkcyan
hi rubyClass ctermfg=darkcyan
hi rubyModule ctermfg=darkcyan
hi rubyFunction ctermfg=cyan
hi rubyControl ctermfg=darkcyan
hi rubyAccess ctermfg=darkcyan
hi rubyOperator ctermfg=darkblue
hi rubyAttribute ctermfg=darkcyan
