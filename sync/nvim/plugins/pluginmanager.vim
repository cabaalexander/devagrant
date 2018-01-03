set runtimepath+=~/.config/nvim/bundle/Vundle.vim

call vundle#begin('~/.config/nvim/bundle')
  " Required:
  " Let vundle manage vundle
  Plugin 'VundleVim/Vundle.vim'

  " Plugins
  Plugin 'rafi/awesome-vim-colorschemes'
  Plugin 'pseewald/anyfold'
  Plugin 'kien/ctrlp.vim'
  Plugin 'scrooloose/nerdtree'
  Plugin 'Xuyuanp/nerdtree-git-plugin'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'mattn/emmet-vim'
  Plugin 'mileszs/ack.vim'
  Plugin 'airblade/vim-gitgutter'
  Plugin 'joegesualdo/jsdoc.vim'
  Plugin 'mxw/vim-jsx'
  Plugin 'tpope/vim-fugitive'
  Plugin 'christoomey/vim-tmux-navigator'
call vundle#end() " required

