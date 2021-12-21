function! syntaxattribute#SyntaxAttribute()

  let l:orig = {}

  " Locate the ID of this syntax group
  " Set syntax group ID equal to either
  "   1. word under `the current cursor position`
  "   2. word from `the first supplied argument`
  let l:orig['id'] = synID(line("."), col("."), 0)

  " Exit if no syntax group was found for word under cursor
  if empty(l:orig['id'])
    echohl WarningMsg
    echo printf('<no syntax group>')
    echohl None
    return
  endif

  let l:orig['name'] = synIDattr(l:orig.id, 'name')

  let l:link = {}

  let l:link['id'] = synIDtrans(l:orig.id)

  " Set the parameters for the linked syntax item
  for param in ['name', 'fg', 'bg']
    let l:link[param] = synIDattr(l:link.id, param)
  endfor

  " Add all of the enabled font effects
  let l:link['effect'] = []
  for format in ["bold", "italic", "reverse", "inverse", "underline"]
    if synIDattr(l:link.id, format)
      call add(l:link.effect, format)
    endif
  endfor

  " Dereference the syntax group to its linked highlight group if possible
  if l:orig.name != l:link.name
    echon printf("[%s] -> ", l:orig.name)
  endif

  " Print the syntax group in its highlighted format
  execute 'echohl' l:link.name
  echon printf("[%s]", l:link.name)
  echohl None

  " Print the `cterm` parameters for the highlighted syntax group
  echon printf(
        \ ' | fg [%s] | bg [%s] | effect %s',
        \ l:link.fg,
        \ l:link.bg,
        \ l:link.effect
        \ )
endfunction
