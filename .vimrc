" Setup vim-plug
call plug#begin('~/.vim/bundle')

" Plugins
Plug 'maralla/completor.vim'
Plug 'itchyny/lightline.vim'
Plug 'tmhedberg/SimpylFold', {'for':'python'}
Plug 'vim-scripts/indentpython.vim', {'for':'python'}
Plug 'lepture/vim-jinja', {'for':'html'}
Plug 'othree/xml.vim', {'for':'html'}
Plug 'nvie/vim-flake8', {'for':'python'}
Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/indentLine'
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
nnoremap <Enter> mno<ESC>`n

" Add code folding and remap to space
set foldmethod=syntax
set foldlevel=99
nnoremap <space> za

" Set up fuzzy find
set path+=**
set wildmenu
set wildignore+=**.pyc
set ignorecase
set smartcase

" Indentline configuration
let g:indentLine_color_term = 239
let g:indentLine_char = '┆'
let g:indentLine_enabled = 1

" MiniBuExplorer and other buffer
map <F2> :MBEToggle<CR>
imap <F2> :MBEToggle<CR>
set hidden

" Settings for minibufexplorer
let g:miniBufExplorerAutoStart = 0

" Settings for completer
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

" Settings for lightline
let g:lightline = {
\   'colorscheme': 'wombat',
\   'active': {
\       'left': [ [ 'fugitive', 'paste' ], [ 'readonly', 'filename', 'modified'] ]
\   },
\   'component': {
\       'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}',
\   },
\   'component_visible_condition': {
\       'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
\   }
\ }

" Neovim terminal handling
function! s:win_by_bufname(bufname)
    let bufmap = map(range(1, winnr('$')), '[bufname(winbufnr(v:val)), v:val]')
    let thewindow = filter(bufmap, 'v:val[0] =~ a:bufname')[0][1]
    execute thewindow 'wincmd w'
endfunction

function! SwitchToTerm()
    if bufexists("NVIMTERM") > 0
        if bufwinnr("NVIMTERM") > 0
            " Already visible on the screen, so switch to it
            call s:win_by_bufname("NVIMTERM")
            startinsert
        else
            " Not visible so open it
            botright 15split NVIMTERM
            startinsert
        endif
    else
        botright 15split
        terminal
        keepalt file NVIMTERM
    endif
endfunction

if has('nvim')
    nmap <F3> :call SwitchToTerm()<CR>
    imap <F3> <ESC><F3>
    tnoremap <ESC> <C-\><C-n><C-w><C-c>

    "Navigation
    tnoremap <C-w> <C-\><C-n><C-w>
    tnoremap <C-h> <C-\><C-n><C-w><C-h>
    tnoremap <C-j> <C-\><C-n><C-w><C-j>
    tnoremap <C-k> <C-\><C-n><C-w><C-k>
    tnoremap <C-l> <C-\><C-n><C-w><C-l>
else
    map <F3> :sh<CR>
    imap <F3> :sh<CR>
endif 

" Leader shortcuts
let mapleader = ","
nmap <Leader>2 <F2>
nmap <Leader>3 <F3>
nmap <Leader>n :noh<CR>
nmap <Leader>s :set spell!<CR>

" Python settings
let python_highlight_all=1
autocmd filetype python highlight ColorColumn ctermbg=magenta
autocmd filetype python call matchadd('ColorColumn', '\%80v\S', 100)
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
