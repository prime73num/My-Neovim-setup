local M = {}

local function setup_rust_tools()
    local tools = {
        autoSetHints = true,
        runnables = {use_telescope = true},
        inlay_hints = {show_parameter_hints = true},
        hover_actions = {auto_focus = true}
    }
    require('rust-tools').setup({
        tools = tools,
        server = {
            on_attach = lsp_on_attach,
            capabilities = capabilities,
        }
    })
end
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
M.run = function ()
  local handler = function (err, results, ctx)
    local r = ctx.params.position.line
    for num, item in ipairs(results) do
      if item.range.start.line == r then
        print(vim.inspect(results[num]))
      end
    end
  end
  local params = vim.lsp.util.make_position_params(0, nil)
  vim.lsp.buf_request(0, "textDocument/codeLens", params, handler)
end
M.setup = function(capabilities, on_attach)
  setup_rust_tools()
  setup_rust(capabilities, on_attach)
end
return M
