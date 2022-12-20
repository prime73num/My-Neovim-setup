require('osc52').setup {
  max_length = 5000,  -- Maximum length of selection (0 for no limit)
  silent = false,  -- Disable message on successful copy
  trim = false,    -- Trim text before copy
}
-- vim.cmd([[
-- nnoremap <leader>pp :lua require("osc52").copy_register('""')<cr>
-- ]])
