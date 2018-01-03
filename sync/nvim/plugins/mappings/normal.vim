" Copy to clipboard
nnoremap <C-c> "+y

" NerdTree Toggle
nnoremap <C-n> :NERDTreeToggle<CR>

" Switch between panes using directional keys
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Avoid unintentional switches to Ex mode
nmap Q gq

" To avoid an issue with neovim and vim-tmux-navigator
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

