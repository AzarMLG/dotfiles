" Always show statusline
set laststatus=2

" Show line number
set number

" All matches in tab complete
set wildmenu
set wildmode=longest,list,full

" Russian layout on ctrl + ^
set keymap=russian-jcukenwin

set iminsert=0
set imsearch=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Powerline
set rtp+=/usr/share/powerline/bindings/vim/

" Always show statusline
set laststatus=2

syntax enable
let g:rehash256 = 1
let g:Powerline_symbols='unicode'
let g:Powerline_theme='long'

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='angr'

" Uncomment to prevent non-normal modes showing in powerline and below powerline.
set noshowmode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use spaces instead of tabs
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

" Colors
colo default

" Mouse scrolling
set mouse=nicr

" Disable automatic commenting on new line:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Sptits open at the bottom and right
set splitbelow splitright

" Shortcutting split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

filetype plugin on
filetype indent on

" Spellcheck on F6
map <F6> :setlocal spell! spelllang=en_us,ru_yo<CR>

" Remember last position on exit
au BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$") | exe "normal! g'\"" | endif

highlight lCursor guifg=NONE guibg=Cyan

set background=dark  

set mouse=a
