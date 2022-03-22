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


