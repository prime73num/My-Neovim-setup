local M = {}
M.setup = function(capabilities, on_attach)
  require 'lspconfig'.clangd.setup {
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
end
return M
