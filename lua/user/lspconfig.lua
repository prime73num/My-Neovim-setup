




local keymap = vim.keymap.set


local opts = { noremap=true, silent=true }
keymap("n","<leader>oo", "<cmd>Vista ctags<CR>",{ silent = true })
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
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>h', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', "<cmd>lua require('telescope.builtin').lsp_references()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', "<cmd>lua require('telescope.builtin').lsp_implementations()<CR>", opts)
  keymap({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
  keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { silent = true })
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local servers = { 'pyright', 'tsserver','rust_analyzer' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach,
  }
end

require'lspconfig'.sumneko_lua.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      completion = {
        callSnippet = "Both",
      }
    }
  }
}

require('lspconfig')['rust_analyzer'].setup{
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    ["rust-analyzer"] = {
      completion = {
        callable = {
          snippets = "fill_arguments"
        },
        autoimport = {
          enable = false
        },
        addCallParenthesis = true,
        postfix = {
          enable = false,
        }
      }
    }
  }
}

require'lspconfig'.clangd.setup{
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = {
    'clangd',
    '--background-index',
    '--all-scopes-completion=false',
    '--clang-tidy',
    '--header-insertion=never'
  },
}

local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = false,
  update_in_insert = false,
  severity_sort = false,
})

local border = { '┌', '─','┐', '▕', '┘','─', '└' ,'▏'}

-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end


