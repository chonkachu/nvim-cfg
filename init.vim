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
