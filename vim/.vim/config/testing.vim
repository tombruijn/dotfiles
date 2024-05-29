" vim-test configuration

"" Custom iTerm testing strategy
"" This strategy will not add the change in directory and echo to the command.
"" This: `cd /my/path; echo 'the test command'; the test command`
"" Becomes: `the test command`
"" Source: https://github.com/janko-m/vim-test/blob/e730ac7bcd3b45faee6ca212459186583f173792/autoload/test/strategy.vim
"" Functions: `test#strategy#iterm` and `s:execute_script` combined.
function! Custom_iterm(cmd) abort
  " Point to osx_iterm_vim_gui script in this directory
  let name = 'osx_iterm_vim_gui'
  let script_path = g:test#plugin_path . '/../../config/' . name
  let cmd = join([script_path, shellescape(a:cmd)])
  execute 'silent !'.cmd
endfunction

let g:test#enabled_runners = ["ruby#rspec", "rust#cargotest", "elixir#exunit", "javascript#jest"]
let g:test#custom_strategies = {'custom_iterm': function('Custom_iterm')}
let g:test#strategy = 'custom_iterm'
let g:test#javascript#jest#executable = "yarn jest"

"" Configuration
let g:test#ruby#rspec#options = {
  \ 'file': '--format documentation'
\}

function! s:custom_rust_transformation(cmd)
  " Change the package names for some of the AppSignal crates
  let l:replacements = {
        \ 'agent': 'appsignal-agent',
        \ 'common': 'appsignal-common',
        \ 'extension': 'appsignal-extension',
        \ 'protocol': 'appsignal-protocol'
        \ }

  let l:cmd = a:cmd
  for [l:old, l:new] in items(l:replacements)
    let l:pattern = '--package\s\+' . l:old
    let l:replacement = '--package ' . l:new
    let l:cmd = substitute(l:cmd, l:pattern, l:replacement, 'g')
  endfor

  return l:cmd
endfunction

" Register the custom transformation
let g:test#custom_transformations = {'rust#cargotest': function('s:custom_rust_transformation')}

augroup rust_test_transformation
  " Activate the custom transformation only for Rust
  autocmd FileType rust let g:test#transformation = 'rust#cargotest'
augroup END

"" Mappings
map <silent> <Leader>t :TestFile<CR>
map <silent> <Leader>s :TestNearest<CR>
map <silent> <Leader>l :TestLast<CR>
map <silent> <Leader>a :TestSuite<CR>
