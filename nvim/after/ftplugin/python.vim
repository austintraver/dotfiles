" Tabs count for 4 spaces
setlocal tabstop=4

" Expand tabs into spaces
setlocal expandtab

" Set the number of columns shifted with '>>' and '<<' equal to that of
" the `tabstop` variable
setlocal shiftwidth=0

" Pressing tab adds the same # of spaces as `shiftwidth` does
setlocal softtabstop=-1

highlight! link pythonEscape SpecialChar
