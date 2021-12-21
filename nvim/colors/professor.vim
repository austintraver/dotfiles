" Reset highlights back to default
highlight clear
set background=dark

" Set the normal name for colors
highlight clear Normal
highlight Normal cterm=none ctermfg=White ctermbg=Black

" hl-Cursor but in IME mode
highlight clear CursorIM
highlight CursorIM none

" Filler lines (~) after end of buffer
highlight clear EndOfBuffer
highlight EndOfBuffer none

" Cursor in a focused terminal
highlight clear TermCursor
highlight TermCursor none

" Cursor in an unfocused terminal
highlight clear TermCursorNC
highlight TermCursorNC none

" Substitute replacement text highlighting
highlight clear Substitute
highlight Substitute none

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

" Normal text in floating windows
highlight clear NormalFloat
highlight NormalFloat none

" Normal text in non-current windows
highlight clear NormalNC
highlight NormalNC none

" Current quickfix item in the quickfix item
highlight clear QuickFixLin
highlight QuickFixLin none

" Tab pages line, where there are no labels
highlight clear TabLineFill
highlight TabLineFill none

" 'nbsp', 'space', 'tab', 'trail' in the ('listchars') option
highlight clear Whitespace
highlight Whitespace none

" Any comment
highlight clear Comment
highlight Comment cterm=none ctermfg=LightGray ctermbg=bg

" Any constant
highlight clear Constant
highlight Constant cterm=none ctermfg=Cyan ctermbg=bg

" A string constant
highlight clear String
highlight String cterm=none ctermfg=Green ctermbg=bg

" A character constant: 'c', '\n'
highlight clear Character
highlight Character cterm=none ctermfg=Green ctermbg=bg

" A number constant: 234, 0xff
highlight clear Number
highlight Number cterm=none ctermfg=Yellow ctermbg=bg

" A boolean constant: TRUE, false
highlight clear Boolean
highlight Boolean cterm=none ctermfg=Yellow ctermbg=bg

" A normal program variable, (int 'foo')
highlight clear Variable
highlight Variable cterm=none ctermfg=Red ctermbg=bg

" A normal program class, (class 'Dog')
highlight clear Class
highlight Class cterm=none ctermfg=Yellow ctermbg=bg

" A floating point constant: 2.3e10
highlight clear Float
highlight Float cterm=none ctermfg=Yellow ctermbg=bg

" Any variable name
highlight clear Identifier
highlight Identifier cterm=none ctermfg=Red ctermbg=bg

" Function name (also: methods for classes)
highlight clear Function
highlight Function cterm=none ctermfg=Blue ctermbg=bg

" Any statement
highlight clear Statement
highlight Statement cterm=none ctermfg=Magenta ctermbg=bg

" If, then, else, endif, switch, etc.
highlight clear Conditional
highlight Conditional cterm=none ctermfg=Cyan ctermbg=bg

" For, do, while, etc.
highlight clear Repeat
highlight Repeat cterm=none ctermfg=Cyan ctermbg=bg

" Case, default, etc.
highlight clear Label
highlight Label cterm=none ctermfg=Cyan ctermbg=bg

"sizeof, +, *, etc.
highlight clear Operator
highlight Operator cterm=none ctermfg=Magenta ctermbg=bg

" Any other keyword
highlight clear Keyword
highlight Keyword cterm=none ctermfg=Magenta ctermbg=bg

" Try, catch, throw
highlight clear Exception
highlight Exception cterm=none ctermfg=Magenta ctermbg=bg

" Generic Preprocessor
highlight clear PreProc
highlight PreProc cterm=none ctermfg=Yellow ctermbg=bg

" Preprocessor #include
highlight clear Include
highlight Include cterm=none ctermfg=Cyan ctermbg=bg

" Preprocessor #define
highlight clear Define
highlight Define cterm=none ctermfg=Magenta ctermbg=bg

" Same as Define
highlight clear link
highlight link Macro Define

" Preprocessor #if, #else, #endif, etc.
highlight clear PreCondit
highlight PreCondit cterm=none ctermfg=Magenta ctermbg=bg

" Int, long, char, etc.
highlight clear Type
highlight Type cterm=none ctermfg=Yellow ctermbg=bg

" Static, register, volatile, etc.
highlight clear StorageClass
highlight StorageClass cterm=none ctermfg=Magenta ctermbg=bg

" Struct, union, enum, etc.
highlight clear Structure
highlight Structure cterm=none ctermfg=Magenta ctermbg=bg

" a typedef
highlight clear Typedef
highlight Typedef cterm=none ctermfg=Magenta ctermbg=bg

" Any special symbol
highlight clear Special
highlight Special cterm=none ctermfg=Blue ctermbg=bg

" Any special character
highlight clear SpecialChar
highlight SpecialChar cterm=none ctermfg=Cyan ctermbg=bg

" Special things inside a comment
highlight clear SpecialComment
highlight SpecialComment cterm=none ctermfg=LightGray ctermbg=bg

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
highlight Todo cterm=bold,italic ctermfg=fg ctermbg=bg



" Highlighting Groups
" (descriptions and ordering from `:h highlight-groups`)
" --------------------
" Used for the columns set with 'colorcolumn'
highlight clear ColorColumn
highlight ColorColumn cterm=none ctermfg=none ctermbg=DarkGray

" Placeholder characters substituted for concealed text (see 'conceallevel')
highlight clear Conceal
highlight Conceal none

" The character under the cursor
highlight clear Cursor
highlight Cursor cterm=none ctermfg=bg ctermbg=Blue

" The screen column that the cursor is in when 'cursorcolumn' is set
highlight clear CursorColumn
highlight CursorColumn cterm=none ctermfg=none ctermbg=DarkGray

" The screen line that the cursor is in when 'cursorline' is set
" Enable incrementation of 0b10 0x10 010 10, and char index 10
highlight clear CursorLine
highlight CursorLine cterm=none ctermfg=none ctermbg=DarkGray

" Directory names (and other special names in listings)
highlight clear Directory
highlight Directory cterm=none ctermfg=Blue ctermbg=bg

highlight clear Delimiter
highlight Delimiter cterm=none ctermfg=Cyan ctermbg=bg

" Diff mode: Added line
highlight clear DiffAdd
highlight DiffAdd cterm=none ctermfg=bg ctermbg=Green

" Diff mode: Changed line
highlight clear DiffChange
highlight DiffChange cterm=none ctermfg=bg ctermbg=DarkGray

" Diff mode: Deleted line (vimdiff)
highlight clear DiffDelete
highlight DiffDelete cterm=none ctermfg=bg ctermbg=Red

" Diff mode: Changed text within a changed line
highlight clear DiffText
highlight DiffText cterm=bold ctermfg=bg ctermbg=Yellow

" The column separating vertically split windows
highlight clear VertSplit
highlight VertSplit cterm=none ctermfg=fg ctermbg=LightGray

" Color used for closed folds
highlight clear Folded
highlight Folded cterm=none ctermfg=LightGray ctermbg=bg

" Color used for fold column
highlight clear FoldColumn
highlight FoldColumn cterm=none ctermfg=fg ctermbg=bg

" Last search pattern highlighting (see 'hlsearch').
" Also used for similar items that need to stand out.
highlight clear Search
highlight Search cterm=none ctermfg=bg ctermbg=Blue

" 'incsearch' highlighting; also used for the text replaced with ':s///c'
highlight clear IncSearch
highlight IncSearch cterm=none ctermfg=bg ctermbg=Yellow

" Color of the line number column
highlight clear LineNr
highlight LineNr cterm=none ctermfg=LightGray ctermbg=bg

" Color of the current line, the row within the line number column
highlight clear CursorLineNr
highlight CursorLineNr cterm=bold,italic ctermfg=fg ctermbg=bg

" Color for the sign column, left of the line number
highlight clear SignColumn
highlight SignColumn cterm=bold ctermfg=fg ctermbg=DarkGray

" If it is a paired bracket, and its match.
highlight clear MatchParen
highlight MatchParen cterm=bold ctermfg=bg ctermbg=fg

" '~' and '@' at the end of the window characters from 'showbreak' and
" Other characters that do not really exist in the text
" (e.g., '>' displayed when a double-wide character doesn't fit at EOL)
highlight clear NonText
highlight NonText cterm=none ctermfg=LightGray ctermbg=bg

" Normal text
highlight clear Normal
highlight Normal cterm=none ctermfg=fg ctermbg=bg

" Popup menu: normal item.
highlight clear Pmenu
highlight Pmenu cterm=none ctermfg=fg ctermbg=DarkGray

" Popup menu: selected item.
highlight clear PmenuSel
highlight PmenuSel cterm=none ctermfg=bg ctermbg=Blue

" Popup menu: scrollbar.
highlight clear PmenuSbar
highlight PmenuSbar cterm=none ctermfg=fg ctermbg=LightGray

" Popup menu: Thumb of the scrollbar.
highlight clear PmenuThumb
highlight PmenuThumb cterm=none ctermfg=fg ctermbg=fg

" Hit-enter prompt and yes/no questions
highlight clear Question
highlight Question cterm=none ctermfg=Magenta ctermbg=bg

" Current quickfix item in the quickfix window.
highlight clear QuickFixLine
highlight QuickFixLine cterm=none ctermfg=bg ctermbg=Yellow

" Meta and special keys listed with ':map' also for text used to
" show unprintable characters in the text, 'listchars'.
" generally: text that is displayed differently from what it really is.
highlight clear SpecialKey
highlight SpecialKey cterm=none ctermfg=LightGray ctermbg=bg

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
highlight SpellLocal cterm=none ctermfg=Yellow ctermbg=bg

" Word that is recognized by the spellchecker as one that is hardly ever used.
" This will be combined with the highlighting used otherwise.
highlight clear SpellRare
highlight SpellRare cterm=none ctermfg=Yellow ctermbg=bg

" Status line of current window
highlight clear StatusLine
highlight StatusLine cterm=bold ctermfg=bg ctermbg=LightGray

" Status lines of not-current windows
" Note: if this is equal to 'StatusLine'
" vim will use '^^^' in the status line of the current window.
highlight clear StatusLineNC
highlight StatusLineNC cterm=italic ctermfg=DarkGray ctermbg=LightGray

" Status line of current :terminal window
highlight clear StatusLineTerm
highlight StatusLineTerm cterm=bold ctermfg=bg ctermbg=LightGray

" Status line of non-current :terminal window
highlight clear StatusLineTermNC
highlight StatusLineTermNC cterm=italic ctermfg=DarkGray ctermbg=LightGray

" Tab pages line, not active tab page label
highlight clear TabLine
highlight TabLine cterm=none ctermfg=bg ctermbg=DarkGray

" Tab pages line, active tab page label
highlight clear TabLineSel
highlight TabLineSel cterm=bold ctermfg=fg ctermbg=LightGray

" Terminal window (see terminal-size-color)
highlight clear Terminal
highlight Terminal cterm=none ctermfg=fg ctermbg=bg

" Titles for output from ':set all' ':autocmd' etc.
highlight clear Title
highlight Title cterm=none ctermfg=Green ctermbg=bg

" Visual mode selection
highlight clear Visual
highlight Visual cterm=none ctermfg=none ctermbg=DarkGray

" Visual mode selection when vim is 'Not Owning the Selection'.
" Warning messages on the command line
highlight clear WarningMsg
highlight WarningMsg cterm=bold ctermfg=Yellow ctermbg=bg

" Error messages on the command line
highlight clear ErrorMsg
highlight ErrorMsg cterm=bold ctermfg=Red ctermbg=bg

" current match in 'wildmenu' completion
highlight clear WildMenu
highlight WildMenu cterm=none ctermfg=fg ctermbg=Blue
