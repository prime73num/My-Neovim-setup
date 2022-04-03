local Popup = require("nui.popup")
local event = require("nui.utils.autocmd").event

local M = {}

local popup = Popup({
  enter = true,
  focusable = true,
  border = {
    padding = {
      top = 1,
      bottom = 1,
      right = 1,
    },
    style = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    text = {
      top = " ~OUTPUT~ ",
      top_align = "left",
      bottom = "I am bottom title",
      bottom_align = "left",
    },
  },
  position = {
    row = "20%",
    col = "10%",
  },
  size = {
    width = "50%",
    height = "40%",
  },
  buf_options = {
    modifiable = true,
    readonly = false,
  },
  win_options = {
    winblend = 10,
    winhighlight = "Normal:myPopup,FloatBorder:myPopupborder",
    rnu = true,
    nu = true,
  },
})


M.output = function()
    popup:on(event.BufLeave, function()
      popup:unmount()
    end)
    popup:mount()
    vim.api.nvim_buf_set_lines(popup.bufnr, 0, 1, false, { "Hello World" })
end

return M
