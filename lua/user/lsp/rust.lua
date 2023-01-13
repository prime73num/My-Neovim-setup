local M = {}
local function setup_rust(capabilities, on_attach)
  require('lspconfig')['rust_analyzer'].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      ["rust-analyzer"] = {
        lens = {
          run = {
            enable = true
          },
          debug = {
            enable = false
          },
          implementations = {
            enable = false
          }
        },
        completion = {
          callable = {
            snippets = "fill_arguments"
          },
          autoimport = {
            enable = false
          },
          postfix = {
            enable = false,
          },
        }
      }
    }
  }
end
M.setup = function(capabilities, on_attach)
  setup_rust(capabilities, on_attach)
end
return M
