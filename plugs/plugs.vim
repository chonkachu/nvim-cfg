call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tanvirtin/monokai.nvim'
Plug 'lervag/vimtex'
Plug 'xiyaowong/transparent.nvim'
Plug 'nvim-tree/nvim-tree.lua'
call plug#end()

let g:plug_threads = 12 "12 for desktop
let g:plug_timeout = 60
let g:plug_retries = 2
