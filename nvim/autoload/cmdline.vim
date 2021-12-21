function! cmdline#KillLine()
  let l:cmd = getcmdline()
  let l:rem = strpart(l:cmd, getcmdpos() - 1)
  if '' != l:rem
    let @c = l:rem
  endif
  return strpart(l:cmd, 0, getcmdpos() - 1)
endfunction

function! cmdline#TransposeChar()
  let l:pos = getcmdpos() + strlen(matchstr(strpart(getcmdline(), getcmdpos() - 1), '^.' . (getcmdpos() < 2 ? '.' : '')))
  let l:ret = substitute(strpart(getcmdline(), 0, l:pos - 1), '\v(.*)(.)(.)$', '\1\3\2', '') . strpart(getcmdline(), l:pos - 1)
  call setcmdpos(l:pos)
  return l:ret
endfunction

function! cmdline#TransposeWord()
  let l:loc = strpart(getcmdline(), 0, getcmdpos() - 1) . matchstr(strpart(getcmdline(), getcmdpos() - 1), '^.')
  let l:roc = strpart(getcmdline(), strlen(l:loc))
  if l:loc !~ '\v^\s*\S+\s'
    return getcmdline()
  endif
  if l:loc =~ '\s$'
    if l:roc =~ '^\s*\S'
      let l:loc .= matchstr(l:roc, '\v^\s*\S+')
      let l:roc = strpart(getcmdline(), strlen(l:loc))
    elseif l:roc =~ '^\s*$'
      let l:roc = matchstr(l:loc, '\v\s+$') . l:roc
      let l:loc = strpart(getcmdline(), 0, strlen(getcmdline()) - strlen(l:roc))
    endif
  elseif l:loc =~ '\S$' && l:roc =~ '^\S'
    let l:loc .=  matchstr(l:roc, '\v^\S+')
    let l:roc = strpart(getcmdline(), strlen(l:loc))
  endif
  let l:pos = strlen(l:loc) + 1
  let l:ret = substitute(l:loc, '\v^(.{-})(\S+)(\s+)(\S+)(\s*)$', '\1\4\3\2\5', '') . l:roc
  call setcmdpos(l:pos)
  return l:ret
endfunction

