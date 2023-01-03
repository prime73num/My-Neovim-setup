require("toggleterm").setup{
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  -- open_mapping = [[?]],
  insert_mappings = false, -- whether or not the open mapping applies in insert mode
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
  shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
  start_in_insert = false,
  terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  persist_size = true,
  persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
  direction = 'float',
  close_on_exit = false, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  auto_scroll = false, -- automatically scroll to the bottom on terminal output
  highlights = {
    Normal = {
      link = 'Normal'
    },
    NormalFloat = {
      link = 'NormalFloat'
    },
  },
  float_opts = {
    border = 'single',
    height = function ()
      return 33
    end,
    width = function ()
      return vim.o.columns * 0.8
    end,
    winblend = 1,
  },
  winbar = {
    enabled = true,
    name_formatter = function(term) --  term: Terminal
      return term.name
    end
  },
}
local terminfo = {
  next_id = 1,
  last_tem = 0,
  ids = {}
}

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

local toggleterm = require("toggleterm")
local terminal = require("toggleterm.terminal")
keymap("n", ".", function ()
  if next(terminfo.ids)==nil then
    table.insert(terminfo.ids, terminfo.next_id)
    terminfo.next_id = terminfo.next_id + 1
    terminfo.last_tem = 1
  end
  toggleterm.toggle(terminfo.ids[terminfo.last_tem])
end, opts)

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  keymap('t', '<esc>', [[<C-\><C-n>]], opts)
  keymap('n', 'q', [[<Cmd>close<CR>]], opts)
  keymap('n', 'x',function ()
    local id = terminfo.ids[terminfo.last_tem]
    local term = terminal.get(id)
    term:shutdown()
    table.remove(terminfo.ids, terminfo.last_tem)
    local size = table.getn(terminfo.ids)
    if size < terminfo.last_tem then
      terminfo.last_tem = size
    end
    if size ~= 0 then
      toggleterm.toggle(terminfo.ids[terminfo.last_tem])
    end
  end, opts)
  keymap('n', '<leader>n',function ()
    local id = terminfo.next_id
    terminfo.next_id = terminfo.next_id + 1
    table.insert(terminfo.ids, terminfo.last_tem + 1, id)
    terminfo.last_tem = terminfo.last_tem + 1
    toggleterm.toggle(terminfo.ids[terminfo.last_tem])
  end, opts)
  keymap('n', 'H',function ()
    local size = table.getn(terminfo.ids)
    terminfo.last_tem = terminfo.last_tem - 1
    if terminfo.last_tem == 0 then
      terminfo.last_tem = size
    end
    toggleterm.toggle(terminfo.ids[terminfo.last_tem])
  end, opts)
  keymap('n', 'L',function ()
    local size = table.getn(terminfo.ids)
    terminfo.last_tem = terminfo.last_tem + 1
    if terminfo.last_tem == size + 1 then
      terminfo.last_tem = 1
    end
    toggleterm.toggle(terminfo.ids[terminfo.last_tem])
  end, opts)
end
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
