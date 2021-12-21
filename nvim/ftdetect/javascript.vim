fun! s:DetectJSX()
  if getline(1) =~? '#!.*osascript -l JavaScript'
    set ft=javascript
  endif
endfun

autocmd BufNewFile,BufRead * call s:DetectJSX()
