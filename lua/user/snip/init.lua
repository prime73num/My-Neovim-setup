require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/user/snip/ft"})
require("luasnip.loaders.from_vscode").load({paths = "~/.config/nvim/lua/user/snip/vsSnip"})

local ls = require "luasnip"
local types = require "luasnip.util.types"

ls.config.set_config {
  history = true,

  updateevents = "TextChanged,TextChangedI",

  enable_autosnippets = true,

  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "<-", "Error" } },
      },
    },
  },
}
