source $HOME/.config/nvim/general/settings.vim
" plugins and configs
source $HOME/.config/nvim/plugs/plugs.vim
source $HOME/.config/nvim/modules/gruvbox.vim
source $HOME/.config/nvim/modules/airline.vim

set background=light
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

" for coc-snippets
"inoremap <silent><expr> <TAB>
"      \ coc#pum#visible() ? coc#_select_confirm() :
"      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"      \ CheckBackspace() ? "\<TAB>" :
"      \ coc#refresh()
let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'

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

-- typst-preview
require 'typst-preview'.setup {
    debug = false,
    open_cmd = 'brave %s',
    port = 0,
    invert_colors = 'never',
    follow_cursor = true,

      dependencies_bin = {
    ['tinymist'] = nil,
    ['websocat'] = nil
  },
    extra_args = nil,
   get_root = function(path_of_main_file)
    local root = os.getenv 'TYPST_ROOT'
    if root then
      return root
    end
    return vim.fn.fnamemodify(path_of_main_file, ':p:h')
  end,

    get_main_file = function(path_of_buffer)
    return path_of_buffer
  end,
}

-- nvim tree
require("nvim-tree").setup({
filters = {
    dotfiles = true,
},
update_focused_file = {
    enable = true,    
},
})

-- autopairs
--require("nvim-autopairs").setup{}
-- keybinds

vim.keymap.set("n", "<C-h>", ":NvimTreeToggle<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>b", ":b ", { desc = "pick a buffer" })
vim.api.nvim_create_user_command('Run',
    function(opts)
           local handle = io.popen("run -c " .. opts.fargs[1] .. " 1")
        local result = handle:read("*a")
        handle:close()
        print(result)
    end,
    { nargs = 1 })

EOF
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:typst_syntax_highlight = 1
let g:typst_conceal = 1
