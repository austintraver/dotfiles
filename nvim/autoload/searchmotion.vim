" Add a keyboard mapping to search the result of <motion>
function! searchmotion#SearchMotion(type)

  " Stash the contents of the most recently used register
  let l:register = @@

  " If motion is invoked from visual mode
  if a:0
    " Use the `gv` motion
    let l:content = "gvy\""
  " If motion is invoked from line motion
  elseif a:type == 'line'
    " Use the `y` motion
    let l:content = "'[V']y\""
  " If motion is invoked from normal mode
  else
    let l:content = '`[v`]y"'
  endif

  silent execute 'normal!' l:content

  " Set the search register to that of the last command
  let @/ = @@

  " Pop the contents of the most recently used register
  let @@ = l:register

endfunction
