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

"hi TagbarScope cterm=bold ctermfg=84 gui=bold guifg=#5af78e
"hi TagbarKind cterm=bold ctermfg=84 gui=bold guifg=#7fffd4

"Conditional    xxx ctermfg=110 guifg=#98BEDE
"Repeat         xxx ctermfg=68 guifg=#719CDF
"Label          xxx links to Statement
