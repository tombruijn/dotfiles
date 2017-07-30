let g:ale_sign_column_always = 1
let g:ale_open_list = 1
let g:ale_list_window_size = 5
let g:ale_sign_error="✕"
let g:ale_sign_warning="△"
let g:ale_linters = {
\   'ruby': ['ruby', 'rubocop'],
\}
let g:ale_ruby_rubocop_executable='bundle exec rubocop'
