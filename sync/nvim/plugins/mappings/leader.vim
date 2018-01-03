" ==================== Normal Mode

" Find using Ack
nnoremap <leader>f :tabnew<CR>:Ack -w "

" Disables search highlight
nnoremap <leader>h :noh<CR>

" TODO should be moved to a autocmd file for .js files
" Adds JS Function Documentation
nnoremap <leader>d :call JSDocAdd()<CR>

" Quit current buffer
nnoremap <leader>q :q<CR>

" Saves current buffer
nnoremap <leader>s :w<CR>

" Quit & Save the currenf buffer
nnoremap <leader>a :wq<CR>

" Quit All
nnoremap <leader>x :qa<CR>

" Source VIMRC
nnoremap <leader>rv :source<space>$MYVIMRC<CR>

" Show Git's Blame :: Plugin Related
nnoremap <leader>gb :Gblame<CR>

" Open last buffer
nnoremap <leader><leader> <C-^>

" Zap trailing whitespace in the current buffer
nnoremap <silent> <leader>zz :call utils#zap()<CR>

" ==================== Local Leader

" Edit file, starting in the same directory as current file
nnoremap <localleader>e :edit <C-r>=expand('%:p:h') . '/'<CR>

" Plugin Install
nnoremap <localleader>I :PluginInstall<CR>














" ==================== Visual Mode

" Sort lines
vnoremap <leader>o :sort<CR>
