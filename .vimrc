call pathogen#infect()
call pathogen#helptags()

" leader
map <space> <leader>
noremap <silent> <leader>p :bp<cr>
noremap <silent> <leader>n :bn<cr>
noremap <silent> <leader><tab> :b#<cr>
noremap <silent> <leader>d :bp \| bd#<cr>

" line numbers
set number

" set system clipboard
set clipboard=unnamed
"set clipboard=unnamedplus

" mouse input
set mouse=a
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

" spellcheck toggle
:map <silent> <F8> :setlocal spell! spelllang=en_us<CR>

" set the colorscheme
colorscheme jellybeans

" prevent needing to save buffers when switching
set hidden

" airline config
let g:airline_theme = 'jellybeans'
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" NERDTree config
map <C-O> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1
let NERDTreeIgnore = [
\ '[._]*[.]s[a-v][a-z]$',
\ '[._]*[.]sw[a-p]$',
\ '[._]s[a-rt-v][a-z]$',
\ '[._]ss[a-gi-z]$',
\ '[._]sw[a-p]$',
\  '__pycache__',
\ '.*[.]pyc$'
\ ]

" filetype config
filetype on
filetype plugin on
filetype indent on

" tab config
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set shiftround

" json config
au FileType json set foldmethod=syntax foldlevel=5

" python config
au FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
au FileType python set foldmethod=indent foldlevel=99

let g:pyindent_open_paren = '&sw'
let g:pyindent_nested_paren = '&sw'
let g:pyindent_continue = '&sw'

" allow backspacing over indent, eol, and the start of an insert
set backspace=indent,eol,start

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" show the current mode
" set showmode

" switch on syntax highlighting.
syntax on

" hide the mouse pointer while typing
set mousehide

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" Disable it... every time I hit the limit I unset this anyway. It's annoying
set textwidth=0

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

" automatically read a file that has changed on disk
set autoread

" fzf config
set rtp+=~/.fzf

" ALE config
map <leader>at :ALEToggle<CR>

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\  'python': ['isort', 'remove_trailing_lines', 'trim_whitespace'],
\  'javascript': ['eslint', 'remove_trailing_lines', 'trim_whitespace'],
\  'typescript': ['eslint', 'remove_trailing_lines', 'trim_whitespace'],
\ }

let g:ale_javascript_eslint_executable = 'eslint_d --cache'
let g:ale_typescript_eslint_executable = 'eslint_d --cache'
let g:ale_echo_msg_format = '[%linter%/%severity%/%code%] %s'
let g:ale_fix_on_save = 1

" local-vimrc config
let g:localvimrc_persistent = 1

" tsuquyomi config
let g:tsuquyomi_completion_detail = 1
let g:tsuquyomi_disable_quickfix = 1
autocmd FileType typescript setlocal completeopt-=preview

" coc config
" tab completion
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" goto
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
