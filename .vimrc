set nocompatible                                                               " be iMproved
filetype off                                                                   " required

" Plugins go here
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

call vundle#end()                                                              " required for Vundle
filetype plugin indent on                                                      " required for Vundle

set number                                                                     " Show line number
set hls                                                                        " Highlight search
set wildmenu wildmode=longest,list,full                                        " All matches in tab complete
set keymap=russian-jcukenwin                                                   " Russian layout on ctrl + ^
set rtp+=/usr/share/powerline/bindings/vim/                                    " Powerline
set laststatus=2                                                               " Always show statusline
set iminsert=0                                                                 " lmap is off and IM is off
set imsearch=0                                                                 " lmap is off and IM is off 
syntax enable                                                                  " Switches on syntax highlighting
colo default                                                                   " Colors
set noshowmode                                                                 " Uncomment to prevent non-normal modes showing in powerline and below powerline.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " Disable automatic commenting on new line:
set splitbelow splitright                                                      " Sptits open at the bottom and right
map <F6> :setlocal spell! spelllang=en_us,ru_yo<CR>                            " Spellcheck on F6

" Use spaces instead of tabs
set expandtab                                                                  " In Insert mode: Use the appropriate number of spaces to insert a <Tab> 
set smarttab                                                                   " When on, a <Tab> in front of a line inserts blanks according to 'shiftwidth'.
set shiftwidth=4                                                               " Number of spaces to use for each step of (auto)indent.
set tabstop=4                                                                  " Number of spaces that a <Tab> in the file counts for

filetype plugin on
filetype indent on

" Shortcutting split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

let g:rehash256 = 1
let g:Powerline_symbols='unicode'
let g:Powerline_theme='long'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='angr'

" Remember last position on exit
au BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$") | exe "normal! g'\"" | endif
