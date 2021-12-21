" Configure colors for git diff (applies during `git commit`)
highlight diffAdded ctermfg=Green ctermbg=bg cterm=none
highlight diffRemoved ctermfg=Red ctermbg=bg cterm=none
highlight diffFile ctermfg=DarkGray ctermbg=bg cterm=none
highlight diffLine ctermfg=Cyan ctermbg=bg cterm=bold,underline
highlight diffFile ctermfg=LightGray ctermbg=bg cterm=bold
highlight diffLine ctermfg=Cyan ctermbg=bg cterm=bold,underline
highlight diffIndexLine ctermfg=LightGray ctermbg=bg cterm=none

" highlight gitcommitSelectedType
highlight gitcommitSummary ctermfg=fg ctermbg=bg cterm=underline
highlight gitcommitDiff ctermfg=LightGray ctermbg=bg cterm=none

highlight! link gitcommitComment Comment
" Git Syntax Highlighting

highlight gitcommitBranch ctermfg=Magenta ctermbg=bg cterm=none

highlight! link gitcommitNoBranch gitcommitBranch

highlight gitcommitComment ctermfg=LightGray ctermbg=bg cterm=none
highlight! link gitcommitUntracked gitcommitComment
highlight! link gitcommitDiscarded gitcommitComment
highlight! link gitcommitSelected gitcommitComment

highlight gitcommitUnmerged ctermfg=Green
highlight gitcommitDiscardedType ctermfg=DarkRed
highlight gitcommitSelectedType ctermfg=Green
highlight gitcommitUntrackedFile ctermfg=Cyan

highlight gitcommitDiscardedFile ctermfg=DarkRed
highlight! link gitcommitDiscardedArrow gitcommitDiscardedFile

highlight gitcommitSelectedFile ctermfg=Green
highlight! link gitcommitSelectedArrow gitcommitSelectedFile

highlight gitcommitUnmergedFile ctermfg=Yellow
highlight! link gitcommitUnmergedArrow gitcommitUnmergedFile

highlight gitcommitOverflow ctermfg=DarkRed
