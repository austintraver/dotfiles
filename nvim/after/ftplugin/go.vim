" Represent tabs as 4 blank columns
setlocal tabstop=4
" Prevent tabs from being expanded into spaces
setlocal noexpandtab

if executable('goimports')
        setlocal formatprg=goimports
elseif executable('gofmt')
        setlocal formatprg=gofmt
endif
