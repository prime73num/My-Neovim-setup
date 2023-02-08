local colors = require("onenord.colors").load()
local config = require("onenord.config").options
require('onenord').setup({
  theme = nil, -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
  borders = true, -- Split window borders
  fade_nc = false, -- Fade non-current windows, making them more distinguishable
  -- Style that is applied to various groups: see `highlight-args` for options
  disable = {
    background = true, -- Disable setting the background color
    cursorline = false, -- Disable the cursorline
    eob_lines = true, -- Hide the end-of-buffer lines
  },
  inverse = {
    match_paren = false,
  },
  custom_highlights = {
    -- ["@variable"] = { fg = colors.cyan , style = config.styles.variables },
    ["@punctuation.bracket"] = { fg = colors.fg },
    ["@function"] = { fg = colors.light_green, style = config.styles.functions },
    ["@function.call"] = { fg = colors.light_green },
    ["@method"] = { fg = colors.light_green, style = config.styles.functions },
  },
  custom_colors = {}, -- Overwrite default colors
})
