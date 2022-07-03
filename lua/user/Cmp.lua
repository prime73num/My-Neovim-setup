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
-- Setup nvim-cmp.
local lspkind = require "lspkind"
lspkind.init()
local cmp = require'cmp'
local compare = require('cmp.config.compare')

local label_comparator = function(entry1, entry2)
    return entry1.completion_item.label > entry2.completion_item.label
end
local lspkind_comparator = function(entry1, entry2)
    local conf = {
        kind_priority = {
            Variable = 14,
            Field = 12,
            -- Property = 11,

            Enum = 10,
            Function = 10,
            Method = 10,
            Reference = 10,
            EnumMember = 10,
            Event = 10,
            Operator = 10,
            Module = 10,
            Struct = 8,

            Keyword = 7,
            -- Snippet = 7,

            File = 8,
            Folder = 8,
            Class = 5,
            Color = 5,
            Constant = 1,
            Constructor = 1,
            Interface = 1,
            Text = 1,
            TypeParameter = 1,
            Unit = 1,
            Value = 1,
        }
    }
    local lsp_types = require('cmp.types').lsp
        if entry1.source.name ~= 'nvim_lsp' or entry2.source.name ~= "nvim_lsp" then
            return nil
        end
        local kind1 = lsp_types.CompletionItemKind[entry1:get_kind()]
        local kind2 = lsp_types.CompletionItemKind[entry2:get_kind()]

        local priority1 = conf.kind_priority[kind1] or 0
        local priority2 = conf.kind_priority[kind2] or 0
        if priority1 == priority2 then
            return nil
        end
        return priority2 < priority1
end


cmp.setup({
  window = {
    documentation = {
        winhighlight = 'Normal:Pmenu',
    }
  },
  matching = {
      disallow_prefix_unmatching = true,
  },
  preselect = cmp.PreselectMode.None,
  sorting = {
      comparators = {
        lspkind_comparator,
        compare.offset,
        compare.exact,
        -- compare.scopes,
        compare.score,
        compare.recently_used,
        compare.locality,
        compare.kind,
        compare.sort_text,
        compare.length,
        compare.order,
      },
  },
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
    ['<CR>'] = cmp.mapping(cmp.mapping.confirm({ select = true }), { 'i', 'c' }),
	["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item({behavior = "select"})
      else
        fallback()
      end
    end,{'i'}),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item({behavior = "select"})
      else
        fallback()
      end
    end,{'i'}),
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
    { name = "luasnip" , priority = 8},
    { name = "nvim_lsp" , priority = 5},
    { name = "nvim_lua" },
    { name = "path" },
    { name = "buffer", keyword_length = 3 }
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
        omni = '[Omni]'
      },
    },
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
  completion = {
     autocomplete = false,
  },
  sources = {
    { name = 'path' },
    { name = 'cmdline' }
  }
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
hi CmpItemAbbrDeprecated ctermfg=168 guifg=#E17899
hi CmpItemAbbrMatchFuzzy ctermfg=168 guifg=#E17899
hi CmpItemKind ctermfg=110 guifg=#98BEDE
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
