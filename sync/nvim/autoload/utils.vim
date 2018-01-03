" Zap trailing whitespace
function! utils#zap() abort
  let l:pos=getcurpos()
  let l:search=@/
  keepjumps %substitute/\s\+$//e
  nohlsearch
  call setpos('.', l:pos)
endfunction

