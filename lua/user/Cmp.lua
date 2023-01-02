require("cmp_dictionary").setup({
  dic = {
    ["*"] = { "/usr/share/dict/words", "/usr/share/dict/american-english" },
  },
  -- The following are default values, so you don't need to write them if you don't want to change them
  exact = 2,
  first_case_insensitive = true,
  document = false,
  document_command = "wn %s -over",
  async = false,
  capacity = 5,
  debug = false,
})

local ls = require "luasnip"
local lspkind = require "lspkind"
lspkind.init()
local cmp = require 'cmp'

cmp.setup({
  window = {
    documentation = {
      winhighlight = 'Normal:Pmenu',
    },
    completion = {
      col_offset = -3,
      side_padding = 0,
    },
  },
  matching = {
    disallow_prefix_unmatching = true,
  },
  preselect = cmp.PreselectMode.None,
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = {
    -- ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    -- ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    -- ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    -- ['<C-y>'] = cmp.config.disable, -- Specify `mp.config.disable` if you want to remove the default `<C-y>` mapping.
    -- ['<C-e>'] = cmp.mapping({
    -- i = cmp.mapping.abort(),
    -- c = cmp.mapping.close(),
    -- }),
    ['<CR>'] = cmp.mapping(cmp.mapping.confirm({ select = true }), { 'i' }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item({ behavior = "select" })
      else
        fallback()
      end
    end, { 'i' }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item({ behavior = "select" })
      else
        fallback()
      end
    end, { 'i' }),
    ["<c-k>"] = cmp.mapping(function()
      if ls.jumpable(-1) then
        ls.jump(-1)
      end
    end, { 'i', 's' }),
    ["<c-j>"] = cmp.mapping(function()
      if ls.jumpable(1) then
        ls.jump(1)
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = "luasnip", priority = 8 },
    { name = "nvim_lsp", priority = 5 },
    { name = "nvim_lua" },
    { name = "path" },
    { name = "buffer", keyword_length = 3 }
  },

  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local kind = lspkind.cmp_format({
        with_text = true,
        maxwidth = 30,
        menu = {
          buffer = "[buf]",
          nvim_lsp = "[LSP]",
          nvim_lua = "[api]",
          path = "[path]",
          luasnip = "[Snip]",
          tn = "[TabNine]",
          calc = "[Calc]",
          dictionary = "[Dic]",
          latex_symbols = "[LaTex]",
          cmd = "[Cmd]",
          omni = '[Omni]'
        },
      })(entry, vim_item)
      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      local f = string.sub(strings[2], 1, 1)
      kind.kind = strings[1] .. " " .. f
      return kind
    end,
  },
  experimental = {
    ghost_text = false,
    native_menu = false
  },
  view = {
    entries = "custom" -- can be "custom", "wildmenu" or "native"
  },
})

cmp.setup.cmdline('/', {
  completion = {
    autocomplete = false,
  },
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  completion = { autocomplete = false },
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
cmp.setup.filetype('tex', {
  sources = cmp.config.sources({
    { name = "luasnip" },
    {
      name = 'omni',
    },
    {
      name = "dictionary",
      keyword_length = 5,
      max_item_count = 20,
    },
    { name = 'buffer' },
  })
})
cmp.setup.filetype('markdown', {
  sources = cmp.config.sources({
    { name = "luasnip" },
    {
      name = "dictionary",
      keyword_length = 4,
      max_item_count = 20,
    },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'calc' },
  })
})
cmp.setup.filetype('text', {
  sources = cmp.config.sources({
    {
      name = "dictionary",
      keyword_length = 4,
      max_item_count = 20,
    },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'calc' },
  })
})

vim.cmd([[
" hi Pmenu guifg=#C5CDD9 guibg=#22252A
hi Pmenu guifg=#C5CDD9
hi CmpItemAbbrDeprecated ctermfg=168 guifg=#E17899
hi CmpItemAbbrMatchFuzzy ctermfg=168 guifg=#E17899
hi CmpItemKind ctermfg=110 guifg=#98BEDE
hi CmpItemMenu ctermfg=110 guifg=#98BEDE
highlight CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
highlight CmpItemAbbrMatch guibg=NONE guifg=#4EC9B0
highlight CmpItemAbbrMatchFuzzy guibg=NONE guifg=#4EC9B0
highlight CmpItemKindVariable guibg=NONE guifg=#9CDCFE
highlight CmpItemKindInterface guibg=NONE guifg=#9CDCFE
highlight CmpItemKindText guibg=NONE guifg=#9CDCFE
highlight CmpItemKindFunction guibg=NONE guifg=#C586C0
highlight CmpItemKindMethod guibg=NONE guifg=#C586C0
highlight CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
highlight CmpItemKindProperty guibg=NONE guifg=#D4D4D4
highlight CmpItemKindUnit guibg=NONE guifg=#D4D4D4
]])
