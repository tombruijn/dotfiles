" RSpec command
let g:rspec_command = "spring rspec {spec}"

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Use iTerm.app instead of Termina.app
let g:rspec_runner = "os_x_iterm"
