" Vim Jsx
let g:jsx_ext_required = 0

" IndentLine
let g:indentLine_char = '│'

" Airline
let g:airline#extensions#tabline#enabled = 1

" Anyfold
let anyfold_activate = 1

" Nerdtree
let NERDTreeQuitOnOpen = 1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

" Ctrlp
let g:ctrlp_show_hidden = 1
let g:ctrlP_custom_ignore = 'node_modules\|DS_Store\'

" Emmet
let g:user_emmet_leader_key = '<C-q>'

" Needed to cancel CommandT File selection
let g:CommandTCancelMap='<Esc>'

" Awesome vim color scheme
try
  colorscheme gruvbox
  set background=dark
catch
endtry

