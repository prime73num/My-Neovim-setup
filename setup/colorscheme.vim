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


hi StartifyHeader ctermfg=116 guifg=#97DDDF

hi WinSeparator ctermfg=253 ctermbg=NONE guifg=#666666 guibg=NONE

hi FloatermBorder ctermfg=253 ctermbg=236 guifg=#666666 guibg=#282A36
hi Floaterm ctermfg=253 ctermbg=236 guifg=#F8F8F2 guibg=#282A36


hi NeoTreeFloatTitle ctermbg=108 guibg=#98BC99 guifg=#333333
hi NeoTreeDirectoryIcon ctermfg=108 gui=bold guifg=#719CDF

hi myPopup ctermfg=253 ctermbg=236 guifg=#F8F8F2 guibg=#282A36
hi myPopupborder ctermfg=253 ctermbg=236 guifg=#666666 guibg=#282A36

hi MatchParen guibg=#565656 guifg=#ffffff

hi Pmenu ctermfg=181 guifg=#dddddd guibg=NONE ctermbg=NONE
hi PmenuSel ctermbg=23 guibg=#007173
hi PmenuSbar ctermfg=247 ctermbg=239 guifg=#dddddd guibg=#616161


hi DiagnosticError ctermfg=168 guifg=#E17899
hi DiagnosticSignError ctermfg=168 guifg=#E17899

" hi TelescopePromptNormal ctermfg=247 ctermbg=239 guifg=#dddddd guibg=#555555
" hi TelescopePromptBorder ctermfg=247 ctermbg=239 guifg=#555555 guibg=#555555
" hi TelescopePromptCounter ctermfg=246 guifg=#eeeeee
hi TelescopePreviewTitle ctermbg=110 guibg=#98BEDE guifg=#333333
hi TelescopePromptTitle ctermbg=108 guibg=#98BC99 guifg=#333333
hi TelescopeNormal guibg=#282A36
hi TelescopeBorder guifg=#777777 guibg=#282A36
hi TelescopeMatching guibg=NONE guifg=#569CD6
hi TelescopePromptPrefix guifg=#98BC99 
hi TelescopeSelectionCaret guifg=#98BEDE guibg=#007173

" Misc
highlight TSError guifg=#F44747
highlight TSPunctDelimiter guifg=#ABB2BF
highlight TSPunctBracket guifg=#ABB2BF gui=italic
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
highlight TSFunction guifg=#DCDCAA gui=italic
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
highlight TSType guifg=#4EC9B0 gui=italic
highlight TSTypeBuiltin guifg=#FF99CC gui=italic
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

" gray
hi CmpItemAbbrDeprecated ctermfg=168 guifg=#E17899
hi CmpItemAbbrMatchFuzzy ctermfg=168 guifg=#E17899
hi CmpItemKind ctermfg=110 guifg=#98BEDE
" gray
highlight CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
highlight CmpItemAbbrMatch guibg=NONE guifg=#569CD6
highlight CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
highlight CmpItemKindVariable guibg=NONE guifg=#9CDCFE
highlight CmpItemKindInterface guibg=NONE guifg=#9CDCFE
highlight CmpItemKindText guibg=NONE guifg=#9CDCFE
highlight CmpItemKindFunction guibg=NONE guifg=#C586C0
highlight CmpItemKindMethod guibg=NONE guifg=#C586C0
highlight CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
highlight CmpItemKindProperty guibg=NONE guifg=#D4D4D4
highlight CmpItemKindUnit guibg=NONE guifg=#D4D4D4

