"             _                    
"  _ ____   _(_)_ __ ___  _ __ ___ 
" | '_ \ \ / / | '_ ` _ \| '__/ __|
" | | | \ V /| | | | | | | | | (__ 
" |_| |_|\_/ |_|_| |_| |_|_|  \___|
" =================================

" set shell=pwsh.exe
" set shellcmdflag=-c

" Always show the sign column/gutter, 1 column wide
set signcolumn=yes:1

" Set directories for meta-data stored by nvim
set backupdir=~/.local/share/nvim/backup
" set backupdir=$XDG_DATA_HOME/nvim/backup

call mkdir(&backupdir, 'p')

" Make backup files upon saving a file
set backup

" Add the extension '.bak' for backup files
set backupext=.bak

" Every wrapped line will continue visually indented, having
" the same amount of space as the previous line
set breakindent

" Launch the file browser starting from the current buffer's directory
set browsedir=buffer

" Have :grep map to the internal :vimgrep command
set grepprg=internal

" Set scroll offset to be 5 from the top or bottom of window
set scrolloff=5

" When a line of text has more characters than the pager's current number
" of columns, visually wrap the line with the line below it
set wrap

" Don't wrap a line by cutting the word furthest to the right in half
set linebreak

" When executing a search with no remaining results, do not loop
" back to the beginning of the file in an attempt to find another match
set nowrapscan

" Enable incrementation of 0b10 0x10 010 10, and char index 10
set nrformats=bin,octal,hex,alpha
" Allow fold method to be determined by the language
set foldmethod=syntax

" Don't fold files when they are first opened
set foldlevel=99
set foldlevelstart=99

" Disable the intro message when starting nvim
set shortmess+=IF

" Disable the '[-- INSERT --]' that is typically shown when in insert-mode
set noshowmode

" Use plugins to identify the filetype of a given file extension name
filetype plugin indent on

" Show confirmation prompt when exiting vim
set confirm

" Don't show [No write since last change] after every !command
set nowarn

" Customize the status line that appears at the bottom
set statusline=%<(%10f)\ %=%y\ \|\ [%l:%c]\ %p%%

" Display line numbers
set number

" Also display line numbers relative to the current cursor line
set relativenumber

" Ring the bell when an error is encountered
set errorbells

" Limit the popup menu for autocomplete suggestions to 6 suggestions
set pumheight=6

" Have the command window take up at least 20 rows
set cmdwinheight=20

" Set active window to take up at least 10 rows
set winheight=10
" Set active window to take up at least 20 columns
set winwidth=20

" Require inactive windows to retain at least 10-rows
set winminheight=10
" Require inactive windows to retain at least 20-columns
set winminwidth=20

" Set preview window to take up at least 40 rows
set previewheight=40

" Realign shift operations performed by '>>' and '<<' 
" such that they always create in an indentation
" which is a multiple of the current value of 'shiftwidth'
set shiftround

" Determine the number of spaces to use for each stop of audoindent
" during shift operations performed by '>>' and '<<'. 
" If 'shiftwidth' is set to 0, the number of columns shifted is 
" equal to that of the `tabstop` variable
set shiftwidth=0

" The number of columns a tab represents. By default, the
" value is 8, which equals the number of columns output by
" a printer when a hardcopy of a plaintext document is made
set tabstop=8

" Hitting tab in insert mode will produce the appropriate number of spaces
set expandtab

" The number of spaces that a <Tab> counts for while performing editing
" operations, like inserting a <Tab> or using <BS>.  It 'feels' like
" <Tab>s are being inserted, while in fact a mix of spaces and <Tab>s is
"	being used. When 'softtabstop' is set to 0,
" pressing tab adds the same # of spaces as `shiftwidth` does
set softtabstop=-1

" When on, a <Tab> in front of a line inserts blanks according to 'shiftwidth'.
" Note that 'tabstop' and 'softtabstop' is used in other places. 
set smarttab

" Enable smart auto-indenting when starting a new line
set autoindent
set cindent

" Searches ignore case unless it contains capitalized letters
set ignorecase
set smartcase

" Allow the cursor to wrap around from one line to the previous one
set whichwrap=b,s,h,l,<,>,[,]

" Set vertical splits to open on the right side of the terminal
set splitright

" Set horizontal splits to open on the bottom side of the terminal
set splitbelow

" Have shift commands round up to the next multiple of shiftwidth
set shiftround

" Allow the cursor to move anywhere in visual block mode
set virtualedit=block

" Prevent vi from adding a newline at the end of the file 
" whenever one is found to be missing during a :write
set nofixendofline

set guicursor=n-c-sm:block,v:block,i-ci-ve:ver25-blinkwait0-blinkoff500-blinkon500,r-cr-o:hor20

" Additionally check for 'file.ext' when using `gf` or `[I` atop keyword 'file'
set suffixesadd=.py,.md,.js,.java

" Prefer not to expand the following suffixes during file globbing
set suffixes=.tmac,.bak,~,.h,.info,.swp,.obj,.zip,.gz,.tgz,.xml,.old,,

" Be sure not to expand globs when files end in these suffixes
" ============================================================
" Don't expand compiled binary class files
set wildignore+=*.o,*.pyc,*.class,*.plist
" Don't expand compressed / encrypted / archived files
set wildignore+=*.tgz,*.gz,*.gpg,*.zip,*.tar
" Don't expand image, video, or audio files
set wildignore+=*.png,*.jpg,*.jpeg,*.pdf,*.mp3,*.mp4,*.m4a,*.m4b,*.m4v,*.mkv
" Don't expand Microsoft {word,powerpoint,excel} files
set wildignore+=*.doc*,*.ppt*,*.xls*

set printencoding=utf-8
set printoptions=paper:letter,syntax:n
set printoptions+=duplex:long,formfeed:y,wrap:n,number:n
set printoptions+=top:1in,right:1in,bottom:1in,left:1in,

" Set :pyx commands to use the non-deprecated version of Python
set pyxversion=3

" Use an undofile for vim
set undofile

set tags=./.tags;

" Noteworthy! I found the setting that affects this, it's 'cpoptions'
set cpoptions-=_

" ============================================================

" Unset path
set path=

" Add dotfiles to the path
set path+=${XDG_CONFIG_HOME}

" Add nvim files to the path
set path+=${XDG_CONFIG_HOME}/nvim
set path+=${XDG_CONFIG_HOME}/zsh/functions
set path+=${XDG_CONFIG_HOME}/zsh

" Add all the files in the wiki to the path
set path+=~/.docs/content

" Add the path to my coding directory
set path+=~/Developer

set path+=~/Documents

let g:html_use_encoding = "UTF-8"

" Do not include line numbers in the :TOhtml file
let g:html_number_lines = 0    

" Have :RustPlay copy the url to the pasteboard
" TODO provide a value specific to the operating system currently running
" let g:rust_clip_command = 'pbcopy'

" Call rustfmt when saving files
let g:rustfmt_autosave = 1

let &fillchars = 'stl: '
      \ . ',' . 'stlnc: '
      \ . ',' . 'vert: '
      \ . ',' . 'fold: '
      \ . ',' . 'diff: '

" See ':h fo-table' for more info on format option flags
" augroup format_options
"   autocmd!
"   autocmd FileType * set fo+=j fo-=l fo+=c fo+=n fo-=r fo-=o fo+=q fo+=1 fo+=2 fo-=v
" augroup end

" Generate function is from `ftplugin/generate.vim`
augroup template_files
  autocmd!
  autocmd BufNewFile * call generate#Generate(expand('%'))
augroup end

" Open scratch files in normal mode
augroup normal_mode_scratch
  autocmd!
  autocmd BufEnter scratch stopinsert
augroup end

" :H opens a help page in its own tab
command! -nargs=1 Help tab help <args>

" :F copies the filepath to the clipboard
function! File()
  " Redirect to the clipboard
  redi @+>
  " Expand the contents of the clipboard
  echon expand('%:p')
  " End redirection to the clipboard
  redi END
endfunction

" Create a command :F[ile] to copy to the clipboard
command! File call File()

" Create convenient window navigation commands
nnoremap <Leader><Left> <CMD>wincmd h<CR>
nnoremap <Leader><Down> <CMD>wincmd j<CR>
nnoremap <Leader><Up> <CMD>wincmd k<CR>
nnoremap <Leader><Right> <CMD>wincmd l<CR>

" Create convenient way to insert today's date
nnoremap <silent> <Leader>d "=strftime('%Y-%m-%d')<C-M>p


" Create a command to call the SyntaxAttribute function
command! -nargs=? -complete=highlight SyntaxAttribute call syntaxattribute#SyntaxAttribute()

command! HighlightTest runtime syntax/hitest.vim
command! ColorTest runtime syntax/colortest.vim

" Keybindings
" ===========

" for i in range(97,122)
"   let char = nr2char(i)
"   exec "map <Esc>" . char . " <M-" . char . ">"
"   exec "map! <Esc>" . char . " <M-" . char . ">"
" endfor
"
set mouse=a
" map <ScrollWheelUp> <C-Y>
" map <S-ScrollWheelUp> <C-U>
" map <ScrollWheelDown> <C-E>
" map <S-ScrollWheelDown> <C-D>

" `yank to end of line` instead of `yank entire line`
map Y y$

nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" Make 'cw' properly mimic its mirror command 'dwi'
" nnoremap cw dwi

" Save the file with <C-S>
nnoremap <C-S> <CMD>write<Return>
nnoremap <C-Q> <CMD>quit<Return>
nnoremap Q <C-v>
nnoremap U <C-r>
vnoremap Q <C-v>
vnoremap > >gv
vnoremap < <gv

" Reset the current search highlight
nnoremap <ESC> <CMD>let @/=''<Return>

" Quickly open the file explorer on the left-hand side
nnoremap <C-w><C-f> <CMD>Lexplore<Return>

" Switch tabs using a keybinding similar to that of macOS
nnoremap <C-w>] <CMD>tabnext<Return>
nnoremap <C-w>[ <CMD>tabprev<Return>

" Normally, this keybinding calls ':vs', have it call `:vne[w]' instead
nnoremap <C-w><C-v> <CMD>vnew<Return>
nnoremap <C-w>v <CMD>vnew<Return>

" Allow maximizing width faster
nnoremap <C-w><C-\> <CMD>wincmd <Bar><Return>

" Format the roff typesetting language using the GNU groff syntax
let b:nroff_is_groff = 1

" Format any `sh` code as `bash` code
let g:is_bash = 1

" let g:go_debug = [
"         \ 'gopls'
"         \ ]

" let g:go_def_mode='gopls'
" let g:go_info_mode='gopls'

" Add hard wrapping to manpages
let g:man_hardwrap = 1

" Enable syntax highlighting for markdown fenced code blocks
" for the following languages
let g:markdown_fenced_languages = [
      \ 'sql', 'c', 'cpp', 'java', 'javascript', 'js=javascript', 'go', 'xml',
      \ 'python', 'py=python', 'ruby', 'rb=ruby', 'css', 'html', 'json', 'less', 
      \ 'make', 'perl', 'php', 'vim', 'yaml', 'yml=yaml', 'sass', 'scss',
      \ 'zsh', 'shell=zsh', 'sh=zsh', 'bash=sh', 'sql' , 'txt=text', 
      \ 'tex', 'sed', 'awk', 'groff', 'wl', 'scpt=applescript', 
      \ 'cypher', 'cyp=cypher', 'make', 'cmake', 'liquid', 'gitconfig', 'conf',
      \ 'ini=dosini', 'dosini', 'ps1', 'powershell=ps1', 'pwsh=ps1'
      \ ]

" Limit syntax highlighting to a maximum number of consecutive lines
let g:markdown_minlines = 1000

" Disable the directory banner
let g:netrw_banner = 0

" Display files in a tree-format
let g:netrw_liststyle = 1

" Silence output for `netrw` calls to `scp` and `ssh` commands
let g:netrw_silent=1

" Open previews in vertical split, anchored to the bottom-right
let g:netrw_preview = 1

" Allocate 90% of the netrw buffer to any files opened from a split
let g:netrw_winsize = 90

" Prevent netrw from using a seperate window to display errors
let g:netrw_use_errorwindow = 0

" Sort entries by time, descending
let g:netrw_sort_by = 'name'

" Sort case-insensitively
let g:netrw_sort_options = 'i'

" When browsing with netrw, <Return> will open files in its own window
let g:netrw_browse_split = 0

" Open horizontal splits by placing the file below `netrw` window
let g:netrw_alto = 0

" Open vertical splits by placing the file right of `netrw` window
let g:netrw_altv = 1

" Use RFC 3339 timestamps
let g:netrw_timefmt = '%Y-%m-%d  %I-%M-%S'

" Configure browsing cursor
let g:netrw_cursor = 0

" Refresh contents of directory upon opening it
let g:netrw_fastbrowse = 1

" Show human-readable filesize formats (e.g. 5M, 2G)
let g:netrw_sizestyle = 'H'

" Declare programs used to decompress different filetypes
let g:netrw_decompress = {
      \ ".gz"  : "gzip --decompress",
      \ ".zip" : "unzip",
      \ ".bz2" : "bunzip2",
      \ ".tar" : "tar --extract --file",
      \ ".tgz" : "tar --extract --file",
      \ ".7z"  : "7z x"
      \ }

" Hide certain files from listing in netrw
let g:netrw_list_hide = join(
      \ [
      \ '\.hushlogin',
      \ '*\.swp$',
      \ '^\..\+',
      \ ],
      \ ',')

" Assign directory to save the .netrwbook and .netrwhist files
let g:netrw_home = stdpath("data") . '/'

" Whether to enable telescope preview when picking a mailbox with the
" telescope provider.
let g:himalaya_telescope_preview_enabled = 1

" Defines the provider used for picking mailboxes:
let g:himalaya_mailbox_picker = 'telescope'

" Add support for fzf plugin
set runtimepath+=$XDG_CONFIG_HOME/fzf

command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\   'rg --column  --files-with-matches --line-number --heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
\   fzf#vim#with_preview(), <bang>0)

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Setting the background must come *before* setting the colorscheme
" and the `set background=dark` command must be present in *both*
" the [/colors/scheme.vim] file *as well as* the [vimrc] config file
set background=dark
" colorscheme professor
