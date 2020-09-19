" Global vim projectionist config.
" Applies to all "projects" that are opened.
let g:projectionist_heuristics = {
  \   "Gemfile": {
  \     "lib/*.rb": {
  \       "type": "source",
  \       "alternate": "spec/lib/{dirname}/{basename}_spec.rb"
  \     },
  \     "spec/*_spec.rb": {
  \       "type": "test",
  \       "alternate": "{dirname}/{basename}.rb"
  \     }
  \   },
  \   "app/frontend/javascripts/": {
  \     "app/frontend/javascripts/*.js": {
  \       "type": "source",
  \       "alternate": "spec/javascripts/{dirname}/{basename}.test.js"
  \     },
  \     "spec/javascripts/*.test.js": {
  \       "type": "test",
  \       "alternate": "app/frontend/javascripts/{dirname}/{basename}.js"
  \     }
  \   }
  \ }

let g:jsx_ext_required = 0 " Don't require .jsx ext for JSX plugin
let g:ruby_indent_block_style = 'do' " Indent lines by block `do`-statement
let g:ruby_spellcheck_strings = 1
let g:ruby_space_errors = 1

" Disable auto JavaScript highlighting
" Customized in theme with `jsx*` highlights below
let g:vim_jsx_pretty_enable_jsx_highlight = 0
let g:vim_jsx_pretty_colorful_config = 0

augroup javascript_jsx_customization
  autocmd!
  autocmd ColorScheme * hi link jsxTag Function
  autocmd ColorScheme * hi link jsxTagName Function
  autocmd ColorScheme * hi link jsxCloseTag Function
  autocmd ColorScheme * hi link jsxCloseString Function
augroup END

augroup filetypes
  " Clear this group's autocmds if previously set
  autocmd!

  " Ruby
  autocmd BufRead,BufNewFile {Rakefile,Gemfile,config.ru,Vagrantfile,Thorfile,Brewfile,*.jpbuilder}
        \ set ft=ruby

  " JavaScript
  autocmd BufRead,BufNewFile {*/app/frontend/javascripts/components/**/*.js}
        \ set ft=javascriptreact

  " Sass/Scss
  autocmd BufRead,BufNewFile *.sass set ft=sass.css
  autocmd BufRead,BufNewFile *.scss set ft=scss.css
augroup END
