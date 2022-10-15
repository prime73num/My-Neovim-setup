




local keymap = vim.keymap.set

local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

local opts = { noremap=true, silent=true }
keymap("n", "[d", function()
  require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
keymap("n", "]d", function()
  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
vim.api.nvim_set_keymap('n', '<leader>dl', "<cmd>lua require('telescope.builtin').diagnostics()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>sd', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)

  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', "<cmd>lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_dropdown())<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>h', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)

  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', "<cmd>lua require('telescope.builtin').lsp_references()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', "<cmd>lua require('telescope.builtin').lsp_implementations()<CR>", opts)
  keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
  keymap("n", "<leader>h", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
  keymap({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
  keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { silent = true })
  keymap("n","<leader>oo", "<cmd>LSoutlineToggle<CR>",{ silent = true })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lsp_flag = {
  debounce_text_changes = 150,
}

local servers = { 'pyright', 'tsserver','rust_analyzer' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flag
  }
end


require'lspconfig'.jdtls.setup{
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
   cmd = { 'jdtls' },
   root_dir = function(fname)
      return require'lspconfig'.util.root_pattern('pom.xml', 'gradle.build', '.git')(fname) or vim.fn.getcwd()
   end
}
require'lspconfig'.clangd.setup{
  capabilities = capabilities,
  on_attach = on_attach,
  flags = lsp_flag,
  handlers = lsp_handlers,
  cmd = {
    'clangd',
    '--background-index',
    '--all-scopes-completion=false',
    '--clang-tidy',
    '--header-insertion=never'
  },
}

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = false,
  update_in_insert = false,
  severity_sort = false,
})
