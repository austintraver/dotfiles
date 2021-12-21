" Markdown Syntax Highlighting

" Support the Hugo front matter 
" https://gohugo.io/content-management/front-matter/#front-matter-formats
unlet b:current_syntax

" For YAML
syntax include @Yaml syntax/yaml.vim
syntax region yamlFrontmatter start=/\%^---$/ end=/^---$/ keepend contains=@Yaml

" For TOML
syntax include @Toml syntax/toml.vim
syntax region tomlFrontmatter start=/\%^+++$/ end=/^+++$/ keepend contains=@Toml

let b:current_syntax='markdown'

" syntax region markdownDescription start=/^/ end=/^:
" syntax match markdownFootnoteDefinition /^\[^[^\]]\+\]:/

highlight markdownHeadingDelimiter ctermfg=1
highlight markdownRule ctermfg=15
highlight markdownHeadingRule ctermfg=15
highlight markdownH1 ctermfg=1
highlight markdownH2 ctermfg=1
highlight markdownH3 ctermfg=1
highlight markdownH4 ctermfg=1
highlight markdownH5 ctermfg=1
highlight markdownH6 ctermfg=1
highlight markdownIdDelimiter ctermfg=5
highlight markdownId ctermfg=5
highlight markdownItalic ctermfg=5  cterm=italic
highlight markdownBold ctermfg=11  cterm=bold
highlight markdownListMarker ctermfg=1
highlight markdownOrderedListMarker ctermfg=1
highlight markdownIdDeclaration ctermfg=4
highlight markdownLinkText ctermfg=4
highlight markdownLinkDelimiter ctermfg=7
highlight markdownUrl ctermfg=5
highlight markdownFootnote ctermfg=3
highlight markdownFootnoteDefinition ctermfg=3
highlight markdownCode ctermfg=2
highlight markdownCodeDelimiter ctermfg=2

" Prevent Markdown from treating indented sections as codeblocks
" of exclusively monospace text, because when it does so, it refuses
" to syntax highlight any of the content within the indented block
syntax clear markdownCodeblock

