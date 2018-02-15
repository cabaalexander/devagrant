" Zap trailing whitespace
function! utils#zap() abort
  let l:pos=getcurpos()
  let l:search=@/
  keepjumps %substitute/\s\+$//e
  nohlsearch
  call setpos('.', l:pos)
endfunction

function! utils#obsessed() abort
  if exists(':Obsession') < 1
    echom "Obsession plugin not installed"
    return 1
  endif

  let l:status = ObsessionStatus()
  let l:session = filereadable('Session.vim')

  if !l:session
    execute('Obsession')
  elseif l:status == '[$]'
    echom "You're Obsessed"
  elseif l:session && strlen(l:status) == 0
    echom "You have a session file, to restore it run: nvim -S"
  endif
endfunction

