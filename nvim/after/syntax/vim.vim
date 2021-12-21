syntax match vimSpecial /\\\(\'\)/ containedin=vimString contained

syntax match vimNotation /\c<\(s-\)\?char-0\?x\?[0-9a-f]\{1,5}>/ contains=vimBracket

" Link highlight group highlighting to syntax group highlighting
highlight! link vimHiGroup vimGroup

highlight! link vimSpecial SpecialChar

highlight! link vimLineComment Comment

" Highlight parentheses in bold-white
highlight vimParenSep ctermfg=white ctermbg=none cterm=bold

" Highlight the ':highlight' command
highlight vimHighlight ctermfg=blue ctermbg=none cterm=none

" Highlight 'ctermfg=' and 'ctermbg='
highlight vimHiCtermFgBg ctermfg=cyan ctermbg=none cterm=none

" Highlight 'cterm='
highlight vimHiCTerm ctermfg=cyan ctermbg=none cterm=none

" Highlight 'none' in ':highlight' statements
highlight vimHiAttrib ctermfg=red ctermbg=none cterm=none
