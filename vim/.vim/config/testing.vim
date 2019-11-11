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

let g:test#custom_strategies = {'custom_iterm': function('Custom_iterm')}
let g:test#strategy = 'custom_iterm'

"" Configuration
let g:test#ruby#rspec#options = {
  \ 'file':    '--format documentation',
\}

"" Mappings
map <silent> <Leader>t :TestFile<CR>
map <silent> <Leader>s :TestNearest<CR>
map <silent> <Leader>l :TestLast<CR>
map <silent> <Leader>a :TestSuite<CR>
