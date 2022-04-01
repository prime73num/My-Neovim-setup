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

require("user.cmd")
local ls = require "luasnip"
-- Setup nvim-cmp.
local lspkind = require "lspkind"
lspkind.init()
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `mp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
	['<CR>'] = cmp.mapping.confirm {
	  select = true,
	},
	["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
	["<c-k>"] = cmp.mapping(function()
		if ls.jumpable(-1) then
			ls.jump(-1)
		end
	end,{'i','s'}),
	["<c-j>"] = cmp.mapping(function()
		if ls.jumpable(1) then
			ls.jump(1)
		end
	end,{'i','s'}),
	["<c-l>"] = cmp.mapping(function()
		if ls.choice_active() then
			ls.change_choice(1)
		end
	end,{'i','s'}),
  },
  sources = {
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "path" },
    { name = "buffer", keyword_length = 4 },
    { name = "cmd" },
  },

  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
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
      },
    },
  },

  experimental = {
    ghost_text = false,
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
  completion = {
     autocomplete = false,
  },
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
      name = "dictionary",
      keyword_length = 4,
	  max_item_count = 20,
    },
    { name = 'buffer' },
    { name = 'calc' },
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


