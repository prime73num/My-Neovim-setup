local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local make_entry = require "telescope.make_entry"
local fb_picker = require "telescope._extensions.file_browser.picker"
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local allItem = {
    {
        label = "Open Terminal",
        _funref = function()
          vim.cmd(string.format("FloatermToggle First"))
        end,
    },
    {
        label = "Search in this file",
        _funref = function()
            local word = vim.fn.expand('<cword>')
            require('telescope.builtin').current_buffer_fuzzy_find()
        end,
    },
    {
        label = "String Grep Under Cursor in file root",
        _funref = function()
            local word = vim.fn.expand('<cword>')
            local root = require'lspconfig'.util.root_pattern('.git')() or vim.fn.expand("%:p:h")
            print(root)
            require('telescope.builtin').grep_string({
                search = word,
                cwd = root
            })
        end,
    },
    {
        label = "Git Reset hunk",
        _funref = function()
            vim.cmd("Gitsigns reset_hunk")
        end,
    },
    {
        label = "Git preview hunk",
        _funref = function()
            vim.cmd("Gitsigns preview_hunk")
        end,
    },
    {
        label = "Cargo Run",
        _funref = function()
            vim.cmd("w")
            local root = require'lspconfig'.util.root_pattern('Cargo.toml')() or vim.fn.getcwd()
            vim.cmd(string.format("FloatermNew!  cd %s && cargo run", root))
        end,
    },
    {
        label = "Split args",
        _funref = function()
          vim.cmd([[
          substitute@(\(.*\))@(\r\1\r)@ge
          normal k
          substitute@,\s*@,\r@ge
          normal j
          normal v``="
          nohlsearch
          ]])
        end,
    },
    {
        label = "Delete buffer.",
        _funref = function()
          vim.cmd("BufferLineCyclePrev")
          vim.cmd("bdelete #")
          print("Delete this buffer!")
        end,
    },
    {
        label = "Gitsign quickfix list",
        _funref = function()
          vim.cmd("Gitsigns setqflist")
          print("Git quickfix list")
        end,
    },
    {
        label = "Tagbar",
        _funref = function()
          vim.cmd("TagbarToggle")
          print("Tagbar")
        end,
    },
    {
        label = "Set Most Use Command",
        _funref = function()
            local cmd = vim.fn.input("Input the commond you want :")
            vim.g.mycmd = cmd
        end,
    },
}
local getres = function()
  return allItem
end


local M = {}
M.Cmdline = function(opts)
    opts = opts or {}
    opts = {
        prompt_prefix="  ",
        selection_caret = " ",
        initial_mode = "normal",
        scroll_strategy = "limit",
        previewer = false,
        sorting_strategy = "ascending",
        layout_strategy = "cursor",
        layout_config = {
            width = 0.3,
            height = 12,
        },
    }
    pickers.new(opts, {
        prompt_title = "~ Cmdline ~",
        finder = finders.new_table {
            results = getres(),
            entry_maker = function(entry)
                return {
                    value = entry,
                    display = entry.label,
                    ordinal = entry.label,
                    MyFunc = entry._funref,
                }
            end
        },
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                selection.MyFunc()
            end)
            return true
        end,
    }):find()
end

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<leader>'", ":lua require('user.Cmdline').Cmdline()<cr>")

return M
