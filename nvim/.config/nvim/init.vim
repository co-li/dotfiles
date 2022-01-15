" Manage plugins with vim-plug

call plug#begin()

" lspconfig to configure language servers
Plug 'neovim/nvim-lspconfig'

" nvim-cmp for autocompletion
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'windwp/nvim-autopairs'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'

" nerdtree for file navigation
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-rooter'

" vim-fugitive for git integration
Plug 'tpope/vim-fugitive'

" lightline for customizing statusline
Plug 'itchyny/lightline.vim'

call plug#end()

" Configure plugins

lua << EOF
  -- Setup nvim-cmp
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'buffer' },
    }
  })

  -- Setup nvim-autopairs
  require('nvim-autopairs').setup{}
  -- If you want insert `(` after select function or method item
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  local cmp = require('cmp')
  cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

  -- Setup lspconfig
  local servers = { 'clangd', 'gopls', 'rls' }
  for _, lsp in ipairs(servers) do
    require('lspconfig')[lsp].setup {
      capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    }
  end
EOF

" Setup NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Setup vim-rooter
let g:rooter_change_directory_for_non_project_files = 'current'

" Setup lightline
let g:lightline = {
  \ 'colorscheme': '16color',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'FugitiveHead'
  \ },
  \ }

" Set global defaults

filetype plugin indent on
syntax on
set completeopt=menu,menuone,noselect
set number
set noshowmode
set splitbelow splitright
set tabstop=4 shiftwidth=4 expandtab
 
" Remap keys

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
