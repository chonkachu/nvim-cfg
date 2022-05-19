source $HOME/.config/nvim/general/settings.vim
" plugins and configs
source $HOME/.config/nvim/plugs/plugs.vim
source $HOME/.config/nvim/modules/gruvbox.vim
colorscheme gruvbox
let g:gruvbox_italics=0
"colorscheme monokai
source $HOME/.config/nvim/modules/airline.vim
" tab for trigger completion
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<Tab>" :
        \ coc#refresh()
