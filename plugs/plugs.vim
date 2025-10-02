call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tanvirtin/monokai.nvim'
Plug 'lervag/vimtex'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'

Plug 'nvim-lua/plenary.nvim'

"Plug 'neovim/nvim-lspconfig'
"Plug 'hrsh7th/nvim-cmp'
"Plug 'hrsh7th/cmp-nvim-lsp'
"Plug 'hrsh7th/cmp-buffer'
"Plug 'hrsh7th/cmp-path'
"Plug 'saadparwaiz1/cmp_luasnip'
"Plug 'L3MON4D3/LuaSnip'
"Plug 'rafamadriz/friendly-snippets'
"Plug 'mason-org/mason.nvim'
"Plug 'mason-org/mason-lspconfig.nvim'

Plug 'chomosuke/typst-preview.nvim', {'tag': 'v1.*'}
Plug 'kaarmu/typst.vim'

Plug 'nvim-treesitter/nvim-treesitter'
"Plug 'ray-x/go.nvim'
"Plug 'ray-x/guihua.lua'

call plug#end()

let g:plug_threads = 4 "4 for laptop
let g:plug_timeout = 60
let g:plug_retries = 2
