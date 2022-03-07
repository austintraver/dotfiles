"             _
"  _ ____   _(_)_ __ ___  _ __ ___
" | '_ \ \ / / | '_ ` _ \| '__/ __|
" | | | \ V /| | | | | | | | | (__
" |_| |_|\_/ |_|_| |_| |_|_|  \___|
" =================================

" set shell=pwsh.exe
" set shellcmdflag=-c

" Do not show the sign column because no linters are enabled.
set signcolumn=no

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
" set statusline=%<(%10f)\ %=%y\ \|\ [%l:%c]\ %p%%
" set statusline=""

" Display line numbers
set number

" Also display line numbers relative to the current cursor line
set relativenumber

" Ring the bell when an error is encountered
set errorbells

" Configure the 'pop up menu (pum)' for autocomplete suggestions
" allowing it to stretch limitlessly high to fit additional suggestions.
set pumheight=0

" Configure the 'pop up menu (pum)' for autocomplete suggestions
" allowing it to span at most 50 columns.
set pumwidth=50

" Have the command window take up at least 20 rows
set cmdwinheight=20

" Only display the status line when there are at least two windows open.
set laststatus=1

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

" The number of columns a tab represents. By default, the
" value is 8, which equals the number of columns output by
" a printer when a hardcopy of a plaintext document is made
set tabstop=8

" Determine the number of spaces to use for each stop of audoindent
" during shift operations performed by '>>' and '<<'.
" If 'shiftwidth' is set to 0, the number of columns shifted is
" equal to that of the `tabstop` variable
set shiftwidth=0

" Have shift commands round up to the next multiple of shiftwidth
set shiftround

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

" Allow the cursor to move anywhere in visual block mode
set virtualedit=block

" If editing Unicode and this option is set, backspace and Normal mode
" "x" delete each combining character on its own.  When it is off (the
" default) the character along with its combining characters are
" deleted.
set nodelcombine

" Prevent vi from adding a newline at the end of the file
" whenever one is found to be missing during a :write
set nofixendofline

set guicursor=n-c-sm:hor100-blinkwait1-blinkoff500-blinkon500,v:hor100,i-ci-ve:ver25-blinkwait1-blinkoff500-blinkon500

let &fillchars = 'stl:∙'
      \ . ',' . 'stlnc:–'
      \ . ',' . 'vert:╎'
      \ . ',' . 'fold:·'
      \ . ',' . 'foldopen:∵'
      \ . ',' . 'foldclose:⊹'
      \ . ',' . 'foldsep:│'
      \ . ',' . 'diff:-'
      \ . ',' . 'diff:+'
      \ . ',' . 'msgsep: '
      \ . ',' . 'eob:⋆'


" ------------------------------------------------------------------------
" Beginning of Professor color scheme
" ------------------------------------------------------------------------
" Setting the background must come *before* setting the colorscheme
" and the `set background=dark` command must be present in *both*
" the [/colors/scheme.vim] file *as well as* the [vimrc] config file
" colorscheme professor
" ^ embedded directly within init.vim
set background=dark
set cursorline
set cursorlineopt=line,number
set nocursorcolumn
highlight clear Normal
highlight Normal ctermfg=15 ctermbg=none
highlight clear Cursor
highlight Cursor ctermfg=none ctermbg=none cterm=standout
" hl-Cursor but in IME mode
highlight clear CursorIM
highlight CursorIM none
highlight clear CursorLine
highlight CursorLine ctermfg=none ctermbg=none cterm=none
highlight clear CursorLineNr  
highlight CursorLineNr ctermfg=222 ctermbg=none cterm=bold
highlight clear LineNr  
highlight LineNr ctermfg=255 ctermbg=none cterm=none
highlight clear Visual  
highlight Visual ctermfg=none ctermbg=238 cterm=none
highlight clear CursorColumn  
highlight CursorColumn ctermfg=none ctermbg=none cterm=none
highlight clear ColorColumn  
highlight ColorColumn ctermfg=255 ctermbg=none cterm=none
highlight clear VertSplit  
highlight VertSplit ctermfg=246 ctermbg=none cterm=none
highlight clear StatusLine  
highlight StatusLine ctermfg=255 ctermbg=none cterm=none
highlight clear StatusLineNC  
highlight StatusLineNC ctermfg=246 ctermbg=none cterm=none
highlight clear StatusLineTerm
highlight StatusLineTerm cterm=none ctermfg=none ctermbg=none
highlight clear StatusLineTermNC
highlight StatusLineTermNC cterm=none ctermfg=none ctermbg=none
highlight clear TabLine  
highlight TabLine ctermfg=255 ctermbg=none cterm=none
highlight clear TabLineSel  
highlight TabLineSel ctermfg=255 ctermbg=234 cterm=underline
highlight clear TabLineFill  
highlight TabLineFill ctermfg=255 ctermbg=none cterm=none
highlight clear IncSearch  
highlight IncSearch ctermfg=255 ctermbg=33 cterm=none
highlight clear Search  
highlight Search ctermfg=255 ctermbg=237 cterm=bold,underline,italic
highlight clear MatchParen  
highlight MatchParen ctermfg=none ctermbg=none cterm=standout,bold
highlight clear WildMenu  
highlight WildMenu ctermfg=none ctermbg=none cterm=standout
highlight clear Pmenu  
highlight Pmenu ctermfg=255 ctermbg=234 cterm=none
highlight clear PmenuSel  
highlight PmenuSel ctermfg=228 ctermbg=235 cterm=none
" Popup menu: scrollbar.
highlight clear PmenuSbar
highlight PmenuSbar cterm=none ctermfg=none ctermbg=LightGray
" Popup menu: Thumb of the scrollbar.
highlight clear PmenuThumb
highlight PmenuThumb ctermfg=none ctermbg=none cterm=none
highlight clear Substitute  
highlight Substitute ctermfg=none ctermbg=none cterm=standout
highlight clear EndOfBuffer  
highlight EndOfBuffer ctermfg=246 ctermbg=none cterm=none
" Cursor in a focused terminal
highlight clear TermCursor
highlight TermCursor none
" Cursor in an unfocused terminal
highlight clear TermCursorNC
highlight TermCursorNC none
" -- INSERT -- that appears for 'showmode'
highlight clear ModeMsg
highlight ModeMsg none
" Area for messages and the command line
highlight clear MsgArea
highlight MsgArea none
" Separator for scrolled messages, msgsep flag of 'display'
highlight clear MsgSeparator
highlight MsgSeparator none
" :h more-prompt
highlight clear MoreMsg
highlight MoreMsg none
highlight clear WarningMsg
highlight WarningMsg cterm=bold ctermfg=Yellow ctermbg=none
" Error messages on the command line
highlight clear ErrorMsg
highlight ErrorMsg cterm=bold ctermfg=Red ctermbg=none
" Normal text in floating windows
highlight clear NormalFloat
highlight NormalFloat none
" Normal text in non-current windows
highlight clear NormalNC
highlight NormalNC none
" Current quickfix item in the quickfix item
highlight clear QuickFixLin
highlight QuickFixLin none
" 'nbsp', 'space', 'tab', 'trail' in the ('listchars') option
highlight clear Whitespace
" Any comment
highlight clear Comment
highlight Comment cterm=none ctermfg=245 ctermbg=none
" Any constant
highlight clear Constant
highlight Constant cterm=none ctermfg=Cyan ctermbg=none
highlight clear String
highlight string cterm=none ctermfg=181 ctermbg=none
highlight! link Character String
highlight clear Number
highlight Number cterm=none ctermfg=222 ctermbg=none
highlight link Float Number
" A boolean constant: TRUE, false
highlight clear Boolean
highlight Boolean cterm=none ctermfg=211 ctermbg=none
" A normal program variable, (int 'foo')
highlight clear Variable
highlight Variable cterm=none ctermfg=Red ctermbg=none
" A normal program class, (class 'Dog')
highlight clear Type
highlight Type cterm=none ctermfg=75 ctermbg=none
highlight! link Class Type
highlight! link Structure Type
" Any variable name
highlight clear Identifier
highlight Identifier cterm=none ctermfg=168 ctermbg=none
" Function name (also: methods for classes)
highlight clear Function
highlight Function cterm=none ctermfg=157 ctermbg=none
highlight! link Method Function
" Any statement
highlight clear Statement
highlight Statement cterm=none ctermfg=183 ctermbg=none
" Case, default, etc.
highlight clear Label
highlight Label cterm=none ctermfg=Cyan ctermbg=none
"sizeof, +, *, etc.
highlight clear Operator
highlight Operator cterm=bold ctermfg=231 ctermbg=none
" Any other keyword
highlight clear Keyword
highlight Keyword cterm=none ctermfg=99 ctermbg=none
highlight! link StorageClass Keyword
highlight! link Exception Keyword
highlight! link Conditional Keyword
highlight! link Repeat Keyword
" Generic Preprocessor
highlight clear PreProc
highlight PreProc cterm=none ctermfg=159 ctermbg=none
highlight! link Include PreProc
highlight! link Define PreProc
highlight! link PreCondit PreProc
" Same as Define
highlight clear link
highlight link Macro Define
" a typedef
highlight clear Typedef
highlight Typedef cterm=none ctermfg=Magenta ctermbg=none
" Any special symbol
highlight clear Special
highlight Special cterm=none ctermfg=Blue ctermbg=none
" Any special character
highlight clear SpecialChar
highlight SpecialChar cterm=none ctermfg=Cyan ctermbg=none
" Special things inside a comment
highlight clear SpecialComment
highlight SpecialComment cterm=none ctermfg=245 ctermbg=none
" Debugging statements
highlight clear Debug
highlight Debug none
" Text that stands out HTML links
highlight clear Underlined
highlight Underlined cterm=underline
" Left blank, hidden
highlight clear Ignore
highlight Ignore none
" Any erroneous construct
highlight clear Error
highlight Error cterm=underline,italic ctermfg=Red ctermbg=none
highlight link NvimInternalError Error
" Anything that needs extra attention; mostly the keywords TODO FIXME and XXX
highlight clear Todo
highlight Todo cterm=bold,italic ctermfg=none ctermbg=none
" Highlighting Groups
" (descriptions and ordering from `:h highlight-groups`)
" --------------------
" Placeholder characters substituted for concealed text (see 'conceallevel')
highlight clear Conceal
highlight Conceal none
" Directory names (and other special names in listings)
highlight clear Directory
highlight Directory cterm=none ctermfg=Blue ctermbg=none
highlight clear Delimiter
highlight Delimiter cterm=none ctermfg=Cyan ctermbg=none
" Diff mode: Added line
highlight clear DiffAdd
highlight DiffAdd cterm=none ctermfg=114 ctermbg=none
" Diff mode: Changed line
highlight clear DiffChange
highlight DiffChange cterm=none ctermfg=186 ctermbg=none
" Diff mode: Deleted line (vimdiff)
highlight clear DiffDelete
highlight DiffDelete cterm=none ctermfg=217 ctermbg=none
" Diff mode: Changed text within a changed line
highlight clear DiffText
highlight DiffText cterm=none ctermfg=179 ctermbg=none
" Color used for closed folds
highlight clear Folded
highlight Folded cterm=none ctermfg=245 ctermbg=none
" Color used for fold column
highlight clear FoldColumn
highlight FoldColumn cterm=none ctermfg=none ctermbg=none
" Color for the sign column, left of the line number
highlight clear SignColumn
highlight SignColumn cterm=bold ctermfg=none ctermbg=DarkGray
" '~' and '@' at the end of the window characters from 'showbreak' and
" Other characters that do not really exist in the text
" (e.g., '>' displayed when a double-wide character doesn't fit at EOL)
highlight clear NonText
highlight NonText cterm=none ctermfg=245 ctermbg=none
" Hit-enter prompt and yes/no questions
highlight clear Question
highlight Question cterm=none ctermfg=Magenta ctermbg=none
" Current quickfix item in the quickfix window.
highlight clear QuickFixLine
highlight QuickFixLine cterm=none ctermfg=none ctermbg=Yellow
" Meta and special keys listed with ':map' also for text used to
" show unprintable characters in the text, 'listchars'.
" generally: text that is displayed differently from what it really is.
highlight clear SpecialKey
highlight SpecialKey cterm=none ctermfg=LightGray ctermbg=none
" Word that is not recognized by the spellchecker.
" This will be combined with the highlighting used otherwise.
highlight clear SpellBad
highlight SpellBad none
" Word that should start with a capital.
" This will be combined with the highlighting used otherwise.
highlight clear SpellCap
highlight SpellCap none
" Word that is recognized by the spellchecker as one that is used in
" another region. This will be combined with the highlighting used otherwise.
highlight clear SpellLocal
highlight SpellLocal cterm=none ctermfg=Yellow ctermbg=none
" Word that is recognized by the spellchecker as one that is hardly ever used.
" This will be combined with the highlighting used otherwise.
highlight clear SpellRare
highlight SpellRare cterm=none ctermfg=Yellow ctermbg=none
" Terminal window (see terminal-size-color)
highlight clear Terminal
highlight Terminal cterm=none ctermfg=none ctermbg=none
" Titles for output from ':set all' ':autocmd' etc.
highlight clear Title
highlight Title cterm=none ctermfg=Green ctermbg=none
" ------------------------------------------------------------------------
" End of Professor color scheme
" ------------------------------------------------------------------------


" Additionally check for 'file.ext' when using `gf` or `[I` atop keyword 'file'
set suffixesadd=.py,.md,.js,.ts,.java

" Prefer not to expand the following suffixes during file globbing
set suffixes=.tmac,.bak,~,.h,.info,.swp,.obj,.zip,.gz,.tgz,.exe,.xml,.old,.pyc,.pyo,
" the title of the window will be set to the value of 'titlestring' (if it is
" not empty), or to: 'filename [+=-] (path) - NVIM'
set title

" Configure the template for displaying the title of the window. When this
" option contains printf-style '%' items, they will be expanded according to
" the rules used for 'statusline'
set titlestring=%t


set wildignorecase

" Be sure not to expand globs when files end in these suffixes
" ============================================================
" Don't expand compiled binary class files
set wildignore+=*.o,*.so,*.dll,*.exe,*.class,*.jar,*.pyc,*.pyo
" Don't expand image, video, or audio files
set wildignore+=*.png,*.jpg,*.jpeg,*.pdf,*.mp3,*.mp4,*.m4a,*.m4b,*.m4v,*.mkv
set wildignore+=*.aac,*.ogg,*.wav,*.avi,*.mpg,*.mpeg,*.mpa,*.mov,*.webm,*.flv
set wildignore+=*.ico,*.icns,*.bmp,*.tga,*.tif,*.tiff
" Don't expand Microsoft {word,powerpoint,excel} files
set wildignore+=*.doc*,*.ppt*,*.xls*
set wildignore+=*.docx,*.pptx,*.xlsx

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

inoremap <expr> <c-x><c-l> fzf#vim#complete(fzf#wrap({
                        \ 'prefix': '^.*$',
                        \ 'source': 'rg -n ^ --color always',
                        \ 'options': '--ansi --delimiter : --nth 3..',
                        \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))
" Add nvim files to the path
set path+=${XDG_CONFIG_HOME}/nvim
set path+=${XDG_CONFIG_HOME}/zsh/functions
set path+=${XDG_CONFIG_HOME}/zsh

" Add all the files in the wiki to the path
set path+=~/Developer/docs/content

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

" Redirects the output of a command (e.g.: ':echo a b c')
" into a new buffer, and opens that buffer in a new tab.
function! Redir(command)
  " Execute the command and redirect the output to the unnamed register.
  " Then, open a buffer in a new window, 
  " and paste the contents of the unnamed register into it.
  silent execute 'redir @"> | ' . a:command . ' | redir END'
  silent execute 'vertical new | normal ""pdd'
  " Finally, clear the contents of the unnamed register.
  let @" = ""
endfunction

" Usage: ':Redirect echo a b c'
" Redirects the output of a command (e.g.: ':echo a b c')
" into a new buffer, and opens that buffer in a new tab.
" In this case, the content of the buffer would be 
" a new file, containing the following line:
" >   a b c
command! -nargs=1 -complete=command Redir call Redir(<q-args>)

" Set the key leader to <\>
let g:mapleader = "\\"

" Create convenient window navigation commands
nnoremap <Leader><Left> <CMD>wincmd h<CR>
nnoremap <Leader><Down> <CMD>wincmd j<CR>
nnoremap <Leader><Up> <CMD>wincmd k<CR>
nnoremap <Leader><Right> <CMD>wincmd l<CR>

nnoremap <C-W><S-Left> <CMD>wincmd H<CR>
nnoremap <C-W><S-Down> <CMD>wincmd J<CR>
nnoremap <C-W><S-Up> <CMD>wincmd K<CR>
nnoremap <C-W><S-Right> <CMD>wincmd L<CR>

nnoremap <Leader><S-Left> <CMD>wincmd H<CR>
nnoremap <Leader><S-Down> <CMD>wincmd J<CR>
nnoremap <Leader><S-Up> <CMD>wincmd K<CR>
nnoremap <Leader><S-Right> <CMD>wincmd L<CR>

" Create convenient way to insert today's date
nnoremap <silent> <Leader>d "=strftime('%Y-%m-%d')<C-M>p

" Create a command to call the SyntaxAttribute function
command! -nargs=? -complete=highlight SyntaxAttribute call syntaxattribute#SyntaxAttribute()
nnoremap <silent> <Leader>ks <CMD>SyntaxAttribute<CR>

command! HighlightTest runtime syntax/hitest.vim
command! ColorTest runtime syntax/colortest.vim

" Keybindings
" ===========

" Register keybindings for Alt+<Letter> combinations.
" for i in range(97,122)
"   let char = nr2char(i)
"   exec "map <Esc>" . char . " <M-" . char . ">"
"   exec "map! <Esc>" . char . " <M-" . char . ">"
" endfor

set mouse=a
" map <ScrollWheelUp> <C-Y>
" map <S-ScrollWheelUp> <C-U>
" map <ScrollWheelDown> <C-E>
" map <S-ScrollWheelDown> <C-D>

" `yank to end of line` instead of `yank entire line`
map Y y$

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

" Add familiar keybindings
inoremap <C-A> <Home>
inoremap <C-E> <End>

inoremap <M-B> <C-Left>
inoremap <M-F> <C-Right>

cnoremap <C-B> <Left>
cnoremap <C-F> <Right>

cnoremap <M-B> <C-Left>
cnoremap <M-F> <C-Right>

cnoremap <C-A> <Home>
cnoremap <C-E> <End>

" Add <CTRL-K> to both insert mode and command-line mode
inoremap <C-K> <C-O>d$
cnoremap <C-K> <C-\>e(strpart(getcmdline(),0,getcmdpos()-1))<Return>

" Format the roff typesetting language using the GNU groff syntax
let b:nroff_is_groff = 1

" Format any `sh` code as `bash` code
let g:is_bash = 1

" Set whether manpages are rendered with
" soft-wraps (0) or hard-wraps (1)
let g:man_hardwrap = 0

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

" -----------------------------------------------------------------------------
" Configure the 'netrw' utility
" =============================

" Disable the directory banner
let g:netrw_banner = 0

" Display files in a tree-format
let g:netrw_liststyle = 1

" Silence output for `netrw` calls to `scp` and `ssh` commands
" let g:netrw_silent=1

" Open previews in vertical split, anchored to the bottom-right
let g:netrw_preview = 1

" Allocate 90% of the netrw buffer to any files opened from a split
let g:netrw_winsize = 90

" Prevent netrw from using a seperate window to display errors
let g:netrw_use_errorwindow = 2

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
" let g:netrw_home = stdpath("data") . '/'

let g:netrw_cygwin = 1

" Set up the 'vim-plug' tool.
call plug#begin('~/.vim/plugged')

" =============================================================================
" Configure the 'ctrl-p' fuzzy finder tool
" https://github.com/ctrlpvim/ctrlp.vim>
" Plug 'ctrlpvim/ctrlp.vim'
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
" =============================================================================

" =============================================================================
" Set up the 'vim-easy-align' plugin.
" https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g.: 'vipga')
nmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g.: 'gaip')
xmap ga <Plug>(EasyAlign)
" =============================================================================

" =============================================================================
" Set up the 'vim-peekaboo' plugin.
" https://github.com/junegunn/vim-peekaboo
Plug 'junegunn/vim-peekaboo'
let g:peekaboo_compact = 1
let g:peekaboo_window = 'bo 12new'
let g:peekaboo_delay = 1000
" =============================================================================

" =============================================================================
" Set up the 'vim-commentary' plugin.
" https://github.com/tpope/vim-commentary
Plug 'tpope/vim-commentary'
" =============================================================================

" =============================================================================
" Set up the 'vim-surround' plugin.
" https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'
" =============================================================================

" =============================================================================
" Set up the 'vim-speeddating' plugin.
" https://github.com/tpope/vim-speeddating
Plug 'tpope/vim-speeddating'
" =============================================================================

" =============================================================================
" Set up the 'vim-repeat' plugin.
" https://github.com/tpope/vim-repeat
Plug 'tpope/vim-repeat'
" =============================================================================

" =============================================================================
" Configure the GitHub Copilot plugin
" https://github.com/github/copilot.vim
Plug 'github/copilot.vim'
" Configure which filetypes to enable GitHub Copilot for
let g:copilot_filetypes = {
    \ '*': v:true,
    \ 'markdown': v:true,
    \ 'help': v:false,
    \ }
" =============================================================================

" =============================================================================
" Configure the Go Language plugin
" https://github.com/fatih/vim-go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" let g:go_debug = [ 'gopls' ]
" let g:go_def_mode='gopls'
" let g:go_info_mode='gopls'
" =============================================================================

" =============================================================================
" Configure the 'plenary' plugin
" https://github.com/nvim-lua/plenary.nvim
Plug 'nvim-lua/plenary.nvim'
" =============================================================================

" =============================================================================
" Configure the Himalaya plugin
" https://github.com/soywod/himalaya
Plug 'soywod/himalaya', {'rtp': 'vim'}
" Use telescope to preview mailboxes while making a selection.
let g:himalaya_telescope_preview_enabled = 1
" Defines the provider used for picking mailboxes:
let g:himalaya_mailbox_picker = 'telescope'
" =============================================================================

" =============================================================================
" Configure the 'telescope' plugin
" https://github.com/nvim-telescope/telescope.nvim
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

highlight TelescopeNormal ctermfg=255 ctermbg=none cterm=none gui=none
map <C-T> <CMD>Telescope<CR>
map <C-P> <CMD>Telescope find_files<CR>
map <C-F> <CMD>Telescope search_history<CR>
" =============================================================================

" =============================================================================
" Configure the 'tree-sitter' plugin
" https://github.com/nvim-treesitter/nvim-treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" =============================================================================

" =============================================================================
" Add support for 'fzf' plugin
" https://github.com/junegunn/fzf.vim
set runtimepath+=$HOME/.local/opt/fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

let g:fzf_layout = { 
        \ 'window': { 
                \ 'height': 0.6,
                \ 'width': 0.6
        \ }
\ }

" Path completion with custom source command
inoremap <expr> <C-X><C-F> fzf#vim#complete#path('fd')
inoremap <expr> <C-X><C-F> fzf#vim#complete#path('rg --files')

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

" Word completion with custom spec with popup layout option
inoremap <expr> <C-X><C-K> fzf#vim#complete#word({'window': { 'width': 0.4, 'height': 0.4 }})
autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" command! -bang -nargs=* 
"                         \ call fzf#vim#grep(
"                         \ 'rg --column --line-number --no-heading --color=always --smart-case -- '
"                         \ .shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
map <leader>rg <CMD>RG<CR>
" =============================================================================


" =============================================================================
" Add support for 'rust' language.
" https://github.com/rust-lang/rust.vim
Plug 'rust-lang/rust.vim'
let g:rustfmt_autosave = 1
" =============================================================================

" =============================================================================
" Add the 'pear-tree' plugin for inserting matching brackets.
" https://github.com/tmsvg/pear-tree
" Plug 'tmsvg/pear-tree'
" let g:pear_tree_pairs = {
"             \ '(': {'closer': ')'},
"             \ '[': {'closer': ']'},
"             \ '{': {'closer': '}'},
"             \ '\'': {'closer': '\''},
"             \ '"': {'closer': '"'},
"             \ '`': {'closer': '`'},
"             \ }
" let g:pear_tree_bracket_matching = 1
" let g:pear_tree_smart_openers = 1
" let g:pear_tree_smart_closers = 1
" let g:pear_tree_smart_backspace = 1
" =============================================================================

" =============================================================================
" Add the 'which-key' plugin to show a cheat sheet for key bindings.
" Plug 'liuchengxu/vim-which-key'
" https://github.com/liuchengxu/vim-which-key
" Plug 'tmsvg/pear-tree'
" =============================================================================

" =============================================================================

" Add LSP support, using @hrsh7th's LSP related snippets/completion packages.
" https://github.com/hrsh7th/nvim-cmp/
" https://github.com/hrsh7th/vim-vsnip/
" Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'hrsh7th/cmp-buffer'
" Plug 'hrsh7th/cmp-path'
" Plug 'hrsh7th/cmp-cmdline'
" Plug 'hrsh7th/nvim-cmp'
" Plug 'hrsh7th/cmp-vsnip'
" Plug 'hrsh7th/vim-vsnip'

" For now, start off with the vanilla Neovim LSP client.
" Plug 'neovim/nvim-lspconfig'

" TODO: Configure NeoVim LSP functionality.

" lua require('plugins')
" .config/nvim/lua/plugins.lua

" Initialize plugin system
call plug#end()

set completeopt=menu,menuone,noselect


" =============================================================================
