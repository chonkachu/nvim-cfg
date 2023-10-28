source $HOME/.config/nvim/general/settings.vim
" plugins and configs
source $HOME/.config/nvim/plugs/plugs.vim
source $HOME/.config/nvim/modules/gruvbox.vim
source $HOME/.config/nvim/modules/airline.vim

colorscheme gruvbox
"colorscheme monokai_soda

"COC settings
set signcolumn=yes
" tab for trigger completion
function! Check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

" Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <TAB>
    \ coc#pum#visible() ? coc#pum#next(1):
    \ Check_back_space() ? "\<Tab>" :
    \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                        \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else
        call feedkeys('K', 'in')
    endif
endfunction

"vimtex

let g:vimtex_view_method = 'zathura'
let g:vimtex_view_forward_search_on_start = 0

lua << EOF
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
require("nvim-tree").setup({
filters = {
    dotfiles = true,
},
update_focused_file = {
    enable = true,    
},
})
vim.keymap.set("n", "<C-h>", ":NvimTreeToggle<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>b", ":b ", { desc = "pick a buffer" })
vim.api.nvim_create_user_command('Run',
    function(opts)
    --vim.fn.expand('%')
        local handle = io.popen("run -c " .. opts.fargs[1] .. " 1")
        local result = handle:read("*a")
        handle:close()
        print(result)
    end,
    { nargs = 1 })
--require("nvim-tree.api").tree.open()

EOF

let g:airline#extensions#tabline#buffer_nr_show = 1
