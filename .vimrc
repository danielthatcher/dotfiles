" Setup vim-plug
call plug#begin('~/.vim/bundle')

" Plugins
Plug 'Valloric/YouCompleteMe'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
"Plug 'scrooloose/syntastic'
"Plug 'nvie/vim-flake8'
Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'fholgado/minibufexpl.vim'

" Color schemes
Plug 'lokaltog/vim-distinguished'
Plug 'albertorestifo/github.vim'
Plug 'dikiaap/minimalist'
Plug 'cohlin/vim-colorschemes'

" End vim-plug stuff
call plug#end()

colorscheme minimalist

" Misc stuff
syntax on
let python_highlight_all=1
set tabstop=4 shiftwidth=4 expandtab
set nu
set formatoptions-=cro
set tw=79
set hidden

" Add code folding and remap to space
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Indentline configuration
let g:indentLine_color_term = 239
let g:indentLine_char = '┆'
let g:indentLine_enabled = 1

" Nerdtree config
map <F1> <ESC>:NERDTreeToggle<CR>
imap <F1> <ESC>:NERDTreeToggle<CR>
let g:NERDTreeWinSize=35

" MiniBuExplorer and other buffer
map <F2> :MBEToggle<CR>
imap <F2> :MBEToggle<CR>
set hidden

" Settings for YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1  " Ensure that the completion window goes away once out of use

" Settings for minibufexplorer
let g:miniBufExplorerAutoStart = 0

" Terminal and terminal remappings
if has('nvim')
    "map <F3> :terminal<CR>
    map <F3> :botright 15split<CR>:terminal<CR>
    imap <F3> <ESC><F3>
    tnoremap <ESC> <C-\><C-n>:bd!<CR>
    tnoremap <C-w> <C-\><C-n><C-w>
else
    map <F3> :sh<CR>
    imap <F3> :sh<CR>
endif 
