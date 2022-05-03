local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local make_entry = require "telescope.make_entry"
local fb_picker = require "telescope._extensions.file_browser.picker"
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local allItem = {
    {
        label = "Open Shell        -- Open shell.",
        _funref = function()
          local cmd = vim.g.mycmd or ""
          vim.cmd(string.format("FloatermNew! %s", cmd))
        end,
    },
    {
        label = "String Grep       -- Grep String under cursor.",
        _funref = function()
            local word = vim.fn.expand('<cword>')
            require('telescope.builtin').grep_string({
                search = word,
            })
        end,
    },
    {
        label = "Git Reset hunk    -- Reset hunk",
        _funref = function()
            vim.cmd("Gitsigns reset_hunk")
        end,
    },
    {
        label = "Git preview hunk    -- Reset hunk",
        _funref = function()
            vim.cmd("Gitsigns preview_hunk")
        end,
    },
    {
        label = "Cargo Run         -- Cargo run.",
        _funref = function()
            vim.cmd("w")
            local root = require'lspconfig'.util.root_pattern('Cargo.toml')() or vim.fn.getcwd()
            vim.cmd(string.format("FloatermNew!  cd %s && cargo run", root))
        end,
    },
    {
        label = "Set Cmd        -- Type a commond",
        _funref = function()
          local myfunc = function(value)
            vim.g.mycmd = value
            print("Set commond to "..value)
          end
          require("user.nui").input(myfunc)
        end,
    },
    {
        label = "Split args         -- Split args.",
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
        label = "Delete buffer      -- Delete this buffer.",
        _funref = function()
          vim.cmd("b #")
          vim.cmd("bd #")
          print("Delete this buffer!")
        end,
    },
    {
        label = "Gitsign quickfix list -- Git fix list.",
        _funref = function()
          vim.cmd("Gitsigns setqflist")
          print("Git quickfix list")
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
        initial_mode = "insert",
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

map("n", ":", ":lua require('user.Cmdline').Cmdline()<cr>")

return M
