" Set the status line to always show
set laststatus=2

" Highlight matches to search queries
set hlsearch

" Allow backspace to delete over autoindents, line breaks, & old content
set backspace=indent,eol,start

" Set directories for meta-data stored by vim
set directory=$XDG_DATA_HOME/vim/swap//
set backupdir=$XDG_DATA_HOME/vim/backup//
set undodir=$XDG_DATA_HOME/vim/undo//
set viminfofile=$XDG_DATA_HOME/vim/viminfo

let &runtimepath.=','.join(split(expand($XDG_CONFIG_HOME ."/vim{,/after}"),'\n'), ',')

" Assign directory to save the .netrwbook and .netrwhist files
let g:netrw_home = expand("$XDG_CACHE_HOME/vim/netrw")
