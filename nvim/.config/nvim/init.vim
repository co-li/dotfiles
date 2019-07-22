call plug#begin()

Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'airblade/vim-rooter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-syntastic/syntastic'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neco-vim'
Plug 'Shougo/neoinclude.vim'
Plug 'deoplete-plugins/deoplete-clang'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'artur-shaik/vim-javacomplete2'

call plug#end()

filetype plugin indent on
syntax on
set number
set noshowmode
set splitbelow splitright
set tabstop=4 shiftwidth=4 expandtab

colorscheme base16-oceanicnext

let g:lightline = {
            \ 'colorscheme': '16color',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'filename', 'modified', 'syntastic' ] ],
            \ },
            \ 'component_function': {
            \   'gitbranch': 'gitbranch#name',
            \ },
            \ 'component_expand': {
            \   'syntastic': 'SyntasticStatuslineFlag',
            \ },
            \ 'component_type': {
            \   'syntastic': 'error',
            \ },
            \ }

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:deoplete#enable_at_startup = 1
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
autocmd CompleteDone * pclose

autocmd FileType java setlocal omnifunc=javacomplete#Complete

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
