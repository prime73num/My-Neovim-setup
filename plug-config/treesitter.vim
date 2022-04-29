" _                      _ _   _            
"| |_ _ __ ___  ___  ___(_) |_| |_ ___ _ __ 
"| __| '__/ _ \/ _ \/ __| | __| __/ _ \ '__|
"| |_| | |  __/  __/\__ \ | |_| ||  __/ |   
" \__|_|  \___|\___||___/_|\__|\__\___|_|   
"                                           
"
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    additional_vim_regex_highlighting = false,
  },
}
EOF
lua <<EOF
require'nvim-treesitter.configs'.setup {
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  indent = {
    enable = false
  }
}
EOF

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



