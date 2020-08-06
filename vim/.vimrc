set visualbell
set noerrorbells
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4
filetype indent on
set encoding=utf-8
set nu
set ma

let python_highlight_all=1
syntax on

"----- PACS
function! PackInit() abort
  packadd minpac

  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " Additional plugins here.
  call minpac#add('vim-jp/syntax-vim-ex')
  call minpac#add('tyru/open-browser.vim')
  call minpac#add('junegunn/fzf')
  call minpac#add('tmhedberg/SimpylFold') 
  call minpac#add('dense-analysis/ale')
  call minpac#add('mhinz/vim-grepper')
  call minpac#add('vim-scripts/indentpython.vim')
  call minpac#add('Valloric/YouCompleteMe')
  call minpac#add('nvie/vim-flake8')
  call minpac#add('jnurmine/Zenburn')
  call minpac#add('scrooloose/nerdtree')
  call minpac#add('jistr/vim-nerdtree-tabs')
  call minpac#add('kien/ctrlp.vim')
  call minpac#add('Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'})
  call minpac#add('slim-template/vim-slim')
endfunction

" Plugin settings here.
" Define user commands for updating/cleaning the plugins.
" Each of them calls PackInit() to load minpac and register
" the information of plugins, then performs the task.
command! PackUpdate call PackInit() | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus call PackInit() | call minpac#status()

colorscheme zenburn

"----- FUZZY MATCHING
" Launch FZF with <C-p>
nnoremap <C-p> :<C-u>FZF<CR>


"----- LINTING
" For JavaScript files, use `eslint` (and only eslint)
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'ruby': ['rubocop']
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

" ----- SPLITS
set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ----- FOLDING
" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" ---- INDENTATION
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css, *.vue, *.jsx
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

"Flagging Unnecessary Whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" ----- AUTOCOMPLETION
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" ----- NERDTREE
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
