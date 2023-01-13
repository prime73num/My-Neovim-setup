local M = {}
M.setup = function(capabilities, on_attach)
  require 'lspconfig'.gopls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = {"gopls", "serve"},
    settings = {
      gopls = {
        codelenses = {
          test = true
        },
        usePlaceholders = true
      },
    },
  }
end
return M
