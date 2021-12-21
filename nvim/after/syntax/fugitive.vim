" Set the color of added/removed text in an inline diff
highlight! link diffAdded DiffAdd
highlight! link diffRemoved DiffDelete

" Underlines the line number of the file (when presenting the inline diff)
highlight diffLine ctermfg=14 ctermbg=bg cterm=underline

" :Git status title, branch name, remote name
highlight fugitiveHeader ctermfg=14 ctermbg=bg cterm=bold
highlight fugitiveSymbolicRef ctermfg=12 ctermbg=bg cterm=italic

highlight! link fugitiveHunk Comment

" :Git status colors for untracked files
highlight fugitiveUntrackedHeading ctermfg=11 ctermbg=bg cterm=bold,underline
highlight fugitiveUntrackedModifier ctermfg=3 ctermbg=bg cterm=bold
highlight fugitiveUntrackedSection ctermfg=11 ctermbg=bg cterm=italic


" :Git status colors for unstaged files
highlight fugitiveUnstagedHeading ctermfg=9 ctermbg=bg cterm=bold,underline
highlight fugitiveUnstagedModifier ctermfg=1 ctermbg=bg cterm=bold
highlight fugitiveUnstagedSection ctermfg=9 ctermbg=bg cterm=italic

" :Git status colors for staged files
highlight fugitiveStagedHeading ctermfg=10 ctermbg=bg cterm=bold,underline
highlight fugitiveStagedModifier ctermfg=2 ctermbg=bg cterm=bold
highlight fugitiveStagedSection ctermfg=10 ctermbg=bg cterm=italic
