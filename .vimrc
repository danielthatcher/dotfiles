" Setup vim-plug
call plug#begin('~/.vim/bundle')

" Plugins
Plug 'Valloric/YouCompleteMe'
Plug 'tmhedberg/SimpylFold', {'for':'python'}
Plug 'vim-scripts/indentpython.vim', {'for':'python'}
Plug 'lepture/vim-jinja', {'for':'html'}
Plug 'othree/xml.vim', {'for':'html'}
"Plug 'vim-scripts/closetag.vim', {'for':'html'}
"Plug 'scrooloose/syntastic'
Plug 'nvie/vim-flake8'
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

"set termguicolors 
colorscheme minimalist

" Misc stuff
syntax on
set tabstop=4 shiftwidth=4 expandtab
set nu
set formatoptions-=cro
set hidden
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Window navigation
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-c> <C-w>c

" New line remaps
nnoremap <CR> o<ESC>k

" Add code folding and remap to space
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Set up fuzzy find
set path+=**
set wildmenu
set wildignore+=**.pyc

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
let g:ycm_autoclose_preview_window_after_completion=1 " Ensure that the completion window goes away once out of use

" Settings for minibufexplorer
let g:miniBufExplorerAutoStart = 0

" Terminal and terminal remappings
if has('nvim')
    map <F3> :botright 15split<CR>:terminal<CR>
    imap <F3> <ESC><F3>
    tnoremap <ESC> <C-\><C-n>:bd!<CR>
    tnoremap <C-w> <C-\><C-n><C-w>
else
    map <F3> :sh<CR>
    imap <F3> :sh<CR>
endif 

" Leader shortcuts
let mapleader = ","
nmap <Leader>1 <F1>
nmap <Leader>2 <F2>
nmap <Leader>3 <F3>
nmap <Leader>n :noh<CR>
nmap <Leader>s :set spell!<CR>

" Python settings
let python_highlight_all=1
autocmd filetype python highlight ColorColumn ctermbg=magenta
autocmd filetype python call matchadd('ColorColumn', '\%80v', 100)
autocmd BufWritePost *.py call Flake8()

" C settings
autocmd filetype c highlight ColorColumn ctermbg=magenta
autocmd filetype c call matchadd('ColorColumn', '\%80v', 100)

" LaTeX settings
let g:tex_conceal="a"
autocmd FileType tex set breakindent
autocmd BufWritePost *.tex call jobstart('pdflatex '.expand('%').' && killall -HUP mupdf')
autocmd FileType tex command LP call jobstart('mupdf '.expand('%:r').'.pdf')
autocmd FileType tex set synmaxcol=80
autocmd FileType tex nnoremap h gh
autocmd FileType tex nnoremap j gj
autocmd FileType tex nnoremap k gk
autocmd FileType tex nnoremap l gl
