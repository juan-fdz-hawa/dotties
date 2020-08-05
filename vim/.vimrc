set visualbell
set noerrorbells

"----- MINIPAC & PACS
packadd minpac
call minpac#init()

" minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
call minpac#add('k-takata/minpac', {'type': 'opt'})

" Add other plugins here.
call minpac#add('junegunn/fzf')

" Load the plugins right now. (optional)
packloadall


"----- COMMANDS
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

"----- MAPPINGS
" Launch FZF with <C-p>
nnoremap <C-p> :<C-u>FZF<CR>


"----- LINTING
" For JavaScript files, use `eslint` (and only eslint)
let g:ale_linters = {
\ 	'javascript': ['eslint'],
\ 	'ruby': ['rubocop'],
\ }

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️ '
let g:ale_fix_on_save = 1

let g:ale_linters_explicit = 1
let g:ale_history_log_output = 1

let g:ale_fixers = {
\   'ruby': ['rubocop', 'remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['eslint'],
\   'css': ['prettier']
\}

let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_ruby_rubocop_options = '-D'

" Mappings in the style of unimpaired-next
" Use [w ]w to navigate warnings
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)
