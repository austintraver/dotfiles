" Disable the visual bar at the end of each line
setlocal colorcolumn=

" Disable the sign column for errors/warnings
setlocal signcolumn=no

" Prevent C-indent format operations from occuring in code-blocks
setlocal cinkeys=

" Don't auto-wrap text using 'textwidth'
setlocal fo-=t
" Don't automatically insert the current comment leader after hitting <Enter>
setlocal fo-=r
" Don't automatically hard-wrap files longer than 'textwidth'
setlocal fo-=l

" 1 tab = 4 spaces
setlocal tabstop=4

" Reload the syntax within the markdown file on each write
augroup syntax_sync
  autocmd!
  autocmd BufWritePost *.md syntax sync fromstart
augroup end
