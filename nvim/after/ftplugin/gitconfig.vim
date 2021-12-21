" Prevent vim's builtin plugin script from running
let b:did_ftplugin = 1

setlocal formatoptions-=t formatoptions+=croql
setlocal comments=:#,:; commentstring=#\ %s

setlocal noexpandtab

let b:undo_ftplugin = "setl fo< com< cms<"
