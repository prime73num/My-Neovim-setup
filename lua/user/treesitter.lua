
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
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ap"] = "@parameter.outer",
        ["ip"] = "@parameter.inner",
        ["ia"] = "@class.inner",
        ["aa"] = "@class.outer",
      },
      include_surrounding_whitespace = true,
    },
    move = {
      enable = true,
      set_jumps = false, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["<c-j>"] = "@function.outer",
      },
      -- goto_next_end = {
        -- ["]M"] = "@function.outer",
      -- },
      goto_previous_start = {
        ["<c-k>"] = "@function.outer",
      },
      -- goto_previous_end = {
        -- ["[M"] = "@function.outer",
      -- },
    },
  },
}
