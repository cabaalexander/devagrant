" Editor
set undofile
set nu
set rnu
set noerrorbells
set expandtab
set tabstop=2
set shiftwidth=2
set nobackup
set nowritebackup
set noswapfile
set autochdir

" Show file options above the command line
set wildmenu

" Don't offer to open certain files/directories
" (These are a sort of break lines) ¯\_(ツ)_/¯
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd,*.un~
set wildignore+=*/node_modules

" Change <leader> key to space
let mapleader = "\<space>"

" Change <localleader> key to backslash i.e. \
let maplocalleader = ","

