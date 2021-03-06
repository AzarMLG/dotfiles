call plug#begin()
  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif
  Plug 'preservim/nerdtree'
  Plug 'scrooloose/syntastic'

  
let g:deoplete#enable_at_startup = 1

call plug#end()


set number                                                                     " Show line number
set timeoutlen=1000 ttimeoutlen=0                                              " Disable Esc delay
set wildmenu wildmode=longest,list,full                                        " All matches in tab complete
set keymap=russian-jcukenwin                                                   " Russian layout on ctrl + ^
set laststatus=2                                                               " Always show statusline
set iminsert=0                                                                 " lmap is off and IM is off
set imsearch=0                                                                 " lmap is off and IM is off 
syntax enable                                                                  " Switches on syntax highlighting
colo default                                                                   " Colors
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " Disable automatic commenting on new line:
set splitbelow splitright                                                      " Sptits open at the bottom and right
map <F6> :setlocal spell! spelllang=en_us,ru_yo<CR>                            " Spellcheck on F6

" Copy and paste to and from vim
vnoremap <C-c> "*y :let @+=@*<CR>
map <C-p> "+P

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

" Remember last position on exit
au BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$") | exe "normal! g'\"" | endif
