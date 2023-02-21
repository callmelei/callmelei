" Download plug.vim if it doesn't exist yet
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source ~/.vimrc
\| endif

" Always use the system clipboard
set clipboard+=unnamedplus

call plug#begin("~/.vim/plugged")
Plug 'sheerun/vim-polyglot'
Plug 'jeffkreeftmeijer/vim-dim'
Plug 'jeffkreeftmeijer/vim-nightfall'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'drewtempelmeyer/palenight.vim'
call plug#end()

" Set default color scheme
colorscheme palenight 

" Turn on line numbers
set number

" Auto indent and use space instead of tabs
set autoindent
set expandtab
set shiftwidth=4

" Install Coc extensions for Elixir, Ruby, Rust, Typescript and VimL
let g:coc_global_extensions = ['coc-elixir', 'coc-solargraph', 'coc-rls', 'coc-tsserver', 'coc-vimlsp']

" Automatically format Elixir, Rust and Typescript files on save
let g:coc_user_config = {"coc.preferences.formatOnSaveFiletypes": ["elixir", "rust", "typescript"]}

" Use <cr> to select the first completion
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
