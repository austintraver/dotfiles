syn match gitignoreComment /^[#].*$/ contains=@Spell
hi def link gitignoreComment Comment

syn match gitignoreEscape  +\\[\\!#]+
hi def link gitignoreEscape Special

" TODO
" /file/path highlighting
" ** glob highlighting
" ! negation highlighting
" ? pattern highlighting
