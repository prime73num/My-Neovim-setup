local M = {}
M.setup = function(capabilities, on_attach)
  require 'lspconfig'.sumneko_lua.setup {
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
end
return M
