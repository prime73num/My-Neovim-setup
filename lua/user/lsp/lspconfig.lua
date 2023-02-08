local keymap = vim.keymap.set

local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
local _border = "single"
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
  border = _border
}
)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
  border = _border
}
)
vim.diagnostic.config {
  float = { border = _border }
}

local opts = { noremap = true, silent = true }
keymap("n", "<leader>oo", "<cmd>Vista ctags<CR>", { silent = true })
keymap("n", "[d", function()
  require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
keymap("n", "]d", function()
  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
vim.api.nvim_set_keymap('n', '<leader>dl', "<cmd>lua require('telescope.builtin').diagnostics()<CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>sd', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)

local on_attach = function(client, bufnr)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>h', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lf', '<cmd>lua vim.lsp.buf.format{ async = true } <CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', "<cmd>lua require('telescope.builtin').lsp_references()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', "<cmd>lua require('telescope.builtin').lsp_implementations()<CR>", opts)
  keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
  keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { silent = true })

  if client.server_capabilities.documentHighlightProvider then
    vim.opt.updatetime = 500
    vim.cmd [[
    hi! LspReferenceRead cterm=bold gui=bold guibg=#565656
    hi! LspReferenceText cterm=bold gui=bold guibg=#565656
    hi! LspReferenceWrite cterm=bold gui=bold guibg=#565656
  ]]
    vim.api.nvim_create_augroup('lsp_document_highlight', {
      clear = false
    })
    vim.api.nvim_clear_autocmds({
      buffer = bufnr,
      group = 'lsp_document_highlight',
    })
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      group = 'lsp_document_highlight',
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
      group = 'lsp_document_highlight',
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("user.lsp.go").setup(capabilities, on_attach)
require("user.lsp.clangd").setup(capabilities, on_attach)
require("user.lsp.rust").setup(capabilities, on_attach)
require("user.lsp.sumneko_lua").setup(capabilities, on_attach)
local servers = { 'pyright', 'tsserver' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach,
  }
end
