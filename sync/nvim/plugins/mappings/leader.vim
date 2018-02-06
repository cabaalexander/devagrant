" ==================== Normal Mode

" Move to next/previous buffer
nnoremap <leader>n :bn
nnoremap <leader>p :bp

" Disables search highlight
nnoremap <leader>h :noh<CR>

" TODO should be moved to a autocmd file for .js files
" Adds JS Function Documentation
nnoremap <leader>d :call JSDocAdd()<CR>

" Quit current buffer
nnoremap <leader>q :q<CR>

" Saves current buffer
nnoremap <leader>s :wa<CR>

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

" Plugin
nnoremap <leader>pi :PluginInstall<CR>
nnoremap <leader>pl :PluginList<CR>
nnoremap <leader>pc :PluginClean<CR>

" ==================== Visual Mode

" Sort lines
vnoremap <leader>o :sort<CR>
