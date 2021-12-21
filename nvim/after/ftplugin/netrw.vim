"  _ __   ___| |_ _ ____      __
" | '_ \ / _ \ __| '__\ \ /\ / /
" | | | |  __/ |_| |   \ V  V /
" |_| |_|\___|\__|_|    \_/\_/
" ==============================


" Look at the key-map with '?'
nnoremap <buffer> g? <CMD>help netrw-quickmap<CR>

" Support left-right movements across files in the familiar format
nnoremap <buffer> l W
nnoremap <buffer> h B

nnoremap <buffer> gH <CMD>exec 'Ntree ' . expand('~')<CR><C-w><C-c>

highlight netrwDir cterm=bold ctermfg=4
highlight netrwSymLink cterm=bold ctermfg=6
highlight netrwExe cterm=bold ctermfg=2

setlocal colorcolumn=
setlocal signcolumn=no

" [ Disabled ]
" ------------

" Set the buffer type to the directory browser
" setlocal buftype=directory

" " 'o' opens the selected file, duh
" nmap <buffer> o <CR>

" function TakeMeHome()
"    " let l:home = `=expand('~')`
"    Ntree `=expand('~')`
" endfunction
" nmap <buffer> gN <CMD>call TakeMeHome()<CR>
