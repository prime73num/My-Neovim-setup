
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,              -- false will disable the whole extension
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = false
  },
  textobjects = {
    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,
      keymaps = {
        ["ap"] = "@parameter.outer",
        ["ip"] = "@parameter.inner",
        ["ia"] = "@class.inner",
        ["aa"] = "@class.outer",
      },
      include_surrounding_whitespace = true,
    },
  },
}
