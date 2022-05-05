local path = function()
    return "-------------- |  "..vim.fn.getcwd()
end

vim.cmd([[
function Mytitle()
  let bufnr = bufnr("%")
  let tmpl = "hello($1 | $2)"
  return floaterm#window#make_title(bufnr,tmpl)
endfunction
]])

local mytitle = function(tmpl)
  local bufnr = vim.fn.bufnr("%")
  local title = vim.fn['floaterm#window#make_title'](bufnr, tmpl)
  return title
end
local mysession1 = function()
  local tmpl = "Floaterm $1 of $2"
  local title = mytitle(tmpl)
  return title
end
local mysession2 = function()
  local tmpl = "Total: $2"
  local title = mytitle(tmpl)
  return title
end
local myname = function()
  if vim.b.floaterm_name == nil then
    return "[No Name]"
  else
    return vim.b.floaterm_name
  end
end

local floaterm = {
  sections = { 
    lualine_a = { myname },
    lualine_b = {
      { 'Title', fmt = function() return mytitle("Floaterm $1") end, },
      { 'Total', color = { fg = '#ffaa88', gui='italic' }, fmt = function() return mytitle("Total: $2") end, }
    },
  }, 
  filetypes = {'floaterm'} 
}

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'seoul256',
    component_separators = { left = '|', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {
        'filename',
        path
    },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {
    floaterm 
  }
}
