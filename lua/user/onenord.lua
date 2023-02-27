local colors = require("onenord.colors").load()
local config = require("onenord.config").options
local my_color = {
  pink = "#d0a39f",
  purple = "#C586C0",
  deeep_blue = "#9CDCFE",
  deep_green = "#4EC9B0",
  highlight = "#347474",
}
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
    ["@parameter"] = { fg = my_color.pink },
    ["@repeat"] = { fg = my_color.purple, style = config.styles.keywords },
    -- ["@field"] = { fg = colors.light_green },
    CmpItemAbbrMatch = { fg = my_color.deeep_blue, style = "bold" },
    CmpItemAbbrMatchFuzzy = { fg = my_color.deeep_blue, underline = true },
    CmpItemMenu = { fg = colors.fg_light },

    PmenuSel = { bg = my_color.highlight },
    Visual = { fg = colors.none, bg = my_color.highlight },
  },
  custom_colors = {
    blue = "#98BEDE",
  }, -- Overwrite default colors
})

