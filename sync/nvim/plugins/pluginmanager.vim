if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
  Plug 'rafi/awesome-vim-colorschemes'
  Plug 'pseewald/anyfold'
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'mattn/emmet-vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'joegesualdo/jsdoc.vim'
  Plug 'mxw/vim-jsx'
  Plug 'tpope/vim-fugitive'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'wincent/scalpel'
  Plug 'joom/vim-commentary'
  Plug 'wincent/command-t', {
    \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
    \ }
  Plug 'Yggdroot/indentLine'
  Plug 'pangloss/vim-javascript'
  Plug 'tpope/vim-surround'
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'easymotion/vim-easymotion'
  Plug 'tpope/vim-vinegar'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'fszymanski/deoplete-emoji'
  Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
call plug#end()

