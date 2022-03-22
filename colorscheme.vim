syntax on
set background=dark
let g:seoul256_background = 235
colorscheme seoul256 " Or whatever colorscheme you make
let g:seoul256_srgb = 1

" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif

hi Mycursor guifg=#00FFFF guibg=#00FFFF guisp=#00FFFF
hi MatchParen guibg=#565656 guifg=#ffffff

hi Pmenu ctermfg=247 ctermbg=239 guifg=#dddddd guibg=#616161
hi PmenuSel ctermbg=23 guibg=#007173
hi PmenuSbar ctermfg=247 ctermbg=239 guifg=#dddddd guibg=#616161

hi CmpItemAbbrDeprecated ctermfg=168 guifg=#E17899
hi CmpItemAbbrMatchFuzzy ctermfg=168 guifg=#E17899
hi CmpItemKind ctermfg=110 guifg=#98BEDE

hi DiagnosticError ctermfg=168 guifg=#E17899
hi DiagnosticSignError ctermfg=168 guifg=#E17899

hi TelescopePromptNormal ctermfg=247 ctermbg=239 guifg=#dddddd guibg=#555555
hi TelescopePromptBorder ctermfg=247 ctermbg=239 guifg=#555555 guibg=#555555
hi TelescopePromptCounter ctermfg=246 guifg=#eeeeee
hi TelescopePreviewTitle ctermbg=110 guibg=#98BEDE
hi TelescopePromptTitle ctermbg=108 guibg=#98BC99
hi TelescopeNormal guibg=#444444
hi TelescopeBorder guifg=#444444 guibg=#444444

" Misc
highlight TSError guifg=#F44747
highlight TSPunctDelimiter guifg=#ABB2BF
highlight TSPunctBracket guifg=#ABB2BF
highlight TSPunctSpecial guifg=#ABB2BF

" Constants
highlight TSConstant guifg=#DCDCAA
highlight TSConstBuiltin guifg=#569CD6
" Not sure about this guy
highlight TSConstMacro guifg=#4EC9B0
highlight TSString guifg=#CE9178
highlight TSStringRegex guifg=#CE9178
highlight TSStringEscape guifg=#D7BA7D
highlight TSCharacter guifg=#CE9178
highlight TSNumber guifg=#B5CEA8
highlight TSBoolean guifg=#569CD6
highlight TSFloat guifg=#B5CEA8
highlight TSAnnotation guifg=#DCDCAA
highlight TSAttribute guifg=#FF99CC
highlight TSNamespace guifg=#FF99CC


" Functions
" highlight TSFuncBuiltin guifg=#4EC9B0
highlight TSFuncBuiltin guifg=#DCDCAA
highlight TSFunction guifg=#DCDCAA
highlight TSFuncMacro guifg=#DCDCAA
highlight TSParameter guifg=#9CDCFE
highlight TSParameterReference guifg=#9CDCFE
highlight TSMethod guifg=#DCDCAA
highlight TSField guifg=#9CDCFE
highlight TSProperty guifg=#9CDCFE
highlight TSConstructor guifg=#4EC9B0

" Keywords
highlight TSConditional guifg=#C586C0
highlight TSRepeat guifg=#C586C0
highlight TSLabel guifg=#FF99CC
" Does not work for yield and return they should be diff then class and def
highlight TSKeyword guifg=#569CD6
highlight TSKeywordFunction guifg=#FF99CC
highlight TSKeywordOperator guifg=#569CD6
highlight TSOperator guifg=#ABB2BF
highlight TSException guifg=#C586C0
highlight TSType guifg=#4EC9B0
highlight TSTypeBuiltin guifg=#FF99CC
highlight TSStructure guifg=#FF99CC
highlight TSInclude guifg=#C586C0

" Variable
highlight TSVariable guifg=#9CDCFE
highlight TSVariableBuiltin guifg=#9CDCFE

" Text
highlight TSText guifg=#FF99CC
highlight TSStrong guifg=#FF99CC
highlight TSEmphasis guifg=#FF99CC
highlight TSUnderline guifg=#FF99CC
highlight TSTitle guifg=#FF99CC
highlight TSLiteral guifg=#FF99CC
highlight TSURI guifg=#FF99CC

" Tags
highlight TSTag guifg=#569CD6
highlight TSTagDelimiter guifg=#5C6370


"hi TagbarScope cterm=bold ctermfg=84 gui=bold guifg=#5af78e
"hi TagbarKind cterm=bold ctermfg=84 gui=bold guifg=#7fffd4

"Conditional    xxx ctermfg=110 guifg=#98BEDE
"Repeat         xxx ctermfg=68 guifg=#719CDF
"Label          xxx links to Statement
