syntax match vimSpecial /\\\(\'\)/ containedin=vimString contained

syntax match vimNotation /\c<\(s-\)\?char-0\?x\?[0-9a-f]\{1,5}>/ contains=vimBracket

" Link highlight group highlighting to syntax group highlighting
highlight! link vimHiGroup vimGroup
highlight! link vimSpecial SpecialChar
highlight! link vimLineComment Comment
highlight vimParenSep ctermfg=white ctermbg=none cterm=bold

highlight! link vimHighlight Statement
highlight vimHiCterm ctermfg=193 ctermbg=none cterm=none
highlight! link vimHiCtermFgBg vimHiCTerm

highlight clear vimOption
highlight vimOption ctermfg=230

highlight! link vimSetSep Operator

" Highlight 'none' in ':highlight' statements
highlight! link vimHiAttrib Boolean
