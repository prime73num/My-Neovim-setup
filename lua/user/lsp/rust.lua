local M = {}
local function get_command(args)
  local ret = "cargo "
  for _, value in ipairs(args.cargoArgs) do
    ret = ret .. value .. " "
  end
  for _, value in ipairs(args.cargoExtraArgs) do
    ret = ret .. value .. " "
  end
  if not vim.tbl_isempty(args.executableArgs) then
    ret = ret .. "-- "
    for _, value in ipairs(args.executableArgs) do
      ret = ret .. value .. " "
    end
  end
  return ret
end

local function executor(args)
  local term = require("user.toggleterm").open_terminal()
  local dir = args.workspaceRoot
  local cmd = get_command(args)
  print(dir)
  term:toggle()
  term:change_dir(dir)
  term:send(cmd, false)
end

M.run = function()
  local handler = function(err, results, ctx)
    local r = ctx.params.position.line
    for num, item in ipairs(results) do
      if item.range.start.line == r then
        local commond = results[num].command
        executor(commond.arguments[1].args)
        break
      end
    end
  end
  local params = vim.lsp.util.make_position_params(0, nil)
  vim.lsp.buf_request(0, "textDocument/codeLens", params, handler)
end
local function setup_rust(capabilities, on_attach)
  require('lspconfig')['rust_analyzer'].setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      local opts = { buffer = bufnr, noremap = true, silent = true }
      vim.keymap.set('n', '<leader>ru', M.run, opts)
    end,
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
