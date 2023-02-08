require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = false, -- use a classic bottom cmdline for search
    command_palette = false, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = true, -- add a border to hover docs and signature help
  },
  popupmenu = {
    enabled = true, -- enables the Noice popupmenu UI
    backend = "cmp", -- backend to use to show regular cmdline completions
    kind_icons = {}, -- set to `false` to disable icons
  },
  views = {
    cmdline_popup = {
      backend = "popup",
      relative = "editor",
      focusable = false,
      enter = false,
      zindex = 60,
      position = {
        row = "90%",
        col = "50%",
      },
      size = {
        min_width = 100,
        width = "auto",
        height = "auto",
      },
      border = {
        style = "rounded",
        padding = { 0, 1 },
      },
      win_options = {
        winhighlight = {
          Normal = "NoiceCmdlinePopup",
          FloatBorder = "NoiceCmdlinePopupBorder",
          IncSearch = "",
          Search = "",
        },
        cursorline = false,
      },
    },
  },
})
