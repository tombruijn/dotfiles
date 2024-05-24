let g:ale_lint_on_text_changed=0
let g:ale_lint_on_save=1
let g:ale_lint_on_enter=1
let g:ale_lint_on_insert_leave=0
let g:ale_lint_delay=10
let g:ale_linters={
\  'sh': ['shell', 'shellcheck'],
\  'elixir': ['credo'],
\  'sass': ['sass-lint'],
\  'javascript': ['eslint', 'prettier'],
\  'typescript': ['eslint', 'prettier', 'tsserver'],
\  'ruby': ['ruby', 'rubocop', 'solargraph'],
\  'erb': ['erb'],
\  'rust': ['cargo', 'rustfmt', 'analyzer'],
\  'markdown': ['vale'],
\ }

let g:ale_fix_on_save=1
let g:ale_fixers={
\  'ruby': ['rubocop'],
\  'rust': ['rustfmt'],
\  'javascript': ['eslint', 'prettier'],
\  'typescript': ['eslint', 'prettier']
\ }

let g:ale_ruby_rubocop_executable='bundle'
let g:ale_ruby_solargraph_executable='solargraph_wrapper'
let g:ale_rust_cargo_check_tests=1
let g:ale_rust_cargo_use_clippy=1

let g:ale_set_balloons=1

let g:ale_completion_enabled=1
let g:ale_completion_delay=50
set omnifunc=ale#completion#OmniFunc

let g:ale_sign_column_always=1
let g:ale_sign_error="✕"
let g:ale_sign_warning="△"

" Shortcuts for ALE
" Navigate to the next-previous ALE error
nnoremap <silent>[w <Plug>(ale_previous_wrap)
nnoremap <silent>]w <Plug>(ale_next_wrap)
" Other actions
nnoremap <silent><leader>o <Plug>(ale_go_to_definition)
nnoremap <silent><leader>ch <Plug>(ale_hover)
nnoremap <silent><leader>cr <Plug>(ale_rename)
nnoremap <silent><leader>ci <Plug>(ale_go_to_implementation)
nnoremap <silent><leader>c/ <Plug>(ale_find_references)
nnoremap <silent><leader>c. <Plug>(ale_code_action)
