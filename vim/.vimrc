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
\ }

" Mappings in the style of unimpaired-next
" Use [w ]w to navigate warnings
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)
