" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()
Plug 'https://github.com/dense-analysis/ale.git'
Plug 'https://github.com/neoclide/coc.nvim.git', {'branch': 'release'}
Plug 'https://github.com/junegunn/fzf.vim.git'
Plug 'https://github.com/nanotech/jellybeans.vim.git'
Plug 'https://github.com/preservim/nerdtree.git'
" Plug 'https://github.com/leafgarland/typescript-vim.git'
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/vim-airline/vim-airline-themes.git'
Plug 'https://github.com/voldikss/vim-floaterm.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'elubow/cql-vim'
call plug#end()

set mmp=10000
let g:riv_python_rst_hl = 0

" leader
map <space> <leader>
noremap <silent> <leader>p :bp<cr>
noremap <silent> <leader>n :bn<cr>
noremap <silent> <leader><tab> :b#<cr>
noremap <silent> <leader>d :bp \| bd#<cr>
noremap <silent> <leader>ta :FloatermNew<cr>
noremap <silent> <leader>tt :FloatermToggle<cr>
noremap <silent> <leader>tp :FloatermPrev<cr>
noremap <silent> <leader>tn :FloatermNext<cr>
noremap <silent> <leader>tk :FloatermKill<cr>
noremap <silent> <leader>gg :Graphviz!!<cr>

" line numbers
set number

" set system clipboard
if has("unnamedplus")
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif

" mouse input
set mouse=a
" if has("mouse_sgr")
"     set ttymouse=sgr
" else
"     set ttymouse=xterm2
" end

" spellcheck toggle
:map <silent> <F8> :setlocal spell! spelllang=en_us<CR>

" set the colorscheme
colorscheme jellybeans
"let g:nord_bold_vertical_split_line = 1

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
\ '.*[.]pyc$',
\ '[.]pytest_cache',
\ '[.]mypy_cache'
\ ]

" FZF config
set rtp+=~/.fzf
nmap <C-P> :Files<CR>
nmap <C-F> :Buffers<CR>
let g:fzf_preview_window = ['right:60%', 'ctrl-/']

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
au FileType typescript set foldmethod=syntax foldlevel=5

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

" ALE config
map <leader>at :ALEToggle<CR>
map <leader>ad :ALEDetail<CR>
map <leader>ac :pclose<CR>

" let g:ale_linters = {
"   \'json': ['eslint'],
"   \'json5': ['eslint'],
"   \'jsonc': ['eslint'],
" \ }

let g:ale_fixers = {
  \'*': ['remove_trailing_lines', 'trim_whitespace'],
  \'python': ['isort', 'black', 'remove_trailing_lines', 'trim_whitespace'],
  \'javascript': ['eslint', 'remove_trailing_lines', 'trim_whitespace'],
  \'typescript': ['eslint', 'remove_trailing_lines', 'trim_whitespace'],
  \'javascriptreact': ['eslint', 'remove_trailing_lines', 'trim_whitespace'],
  \'typescriptreact': ['eslint', 'remove_trailing_lines', 'trim_whitespace'],
  \'json': ['jq', 'remove_trailing_lines', 'trim_whitespace'],
  \'json5': ['jq', 'remove_trailing_lines', 'trim_whitespace'],
  \'jsonc': ['jq', 'remove_trailing_lines', 'trim_whitespace'],
  \'rust': ['rustfmt', 'remove_trailing_lines', 'trim_whitespace'],
\ }

let g:ale_javascript_eslint_executable = 'NODE_OPTIONS="--loader ts-node/esm --no-warnings" pnpm exec eslint_d --cache'
let g:ale_typescript_eslint_executable = 'NODE_OPTIONS="--loader ts-node/esm --no-warnings" pnpm exec eslint_d --cache'
let g:ale_echo_msg_format = '[%linter%/%severity%/%code%] %s'
" let g:ale_detail_to_floating_preview = 1
let g:ale_fix_on_save = 1

" local-vimrc config
let g:localvimrc_persistent = 1

" tsuquyomi config
" let g:tsuquyomi_completion_detail = 1
" let g:tsuquyomi_disable_quickfix = 1
" autocmd FileType typescript setlocal completeopt-=preview
"
"" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
" set signcolumn=yes

" coc config
" use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
          \ coc#pum#visible() ? coc#pum#next(1) :
          \ CheckBackspace() ? "\<Tab>" :
          \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <silent><expr> <CR> coc#pum#visible()
                              \? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" goto
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" riv config
let g:riv_disable_folding = 1

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

nnoremap <silent> K :call ShowDocumentation()<CR>

" Graphviz
let g:graphviz_output_format = 'png'
let g:graphviz_shell_option = ''
