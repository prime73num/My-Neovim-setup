local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local make_entry = require "telescope.make_entry"
local fb_picker = require "telescope._extensions.file_browser.picker"
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local allItem = {
    {
      label = "F - Current Working Directory",
      _funref = function()
        require 'telescope'.extensions.file_browser.file_browser({
          previewer = false,
          prompt_title = "~ CWD ~",
        })
      end
    },
    {
      label = "F - Current file Directory",
      _funref = function()
        require 'telescope'.extensions.file_browser.file_browser({
          previewer = false,
          cwd = vim.fn.expand("%:p:h"),
          prompt_title = "~ CWD ~",
        })
      end
    },
    {
      label = "F - Neovim Directory",
      _funref = function()
        require 'telescope'.extensions.file_browser.file_browser({
          previewer = false,
          cwd = "~/.config/nvim",
          prompt_title = "~MyNeovim~",
        })
      end
    },
    {
      label = "S - Search in CWD",
      _funref = function()
        require('telescope.builtin').grep_string({
          search = "",
          only_sort_text = true,
          initial_mode = "insert",
        })
      end
    },
    {
        label = "S - Search in this file",
        _funref = function()
            local word = vim.fn.expand('<cword>')
            require('telescope.builtin').current_buffer_fuzzy_find()
        end,
    },
    {
        label = "S - Search Under Cursor in file root",
        _funref = function()
            local word = vim.fn.expand('<cword>')
            local root = require'lspconfig'.util.root_pattern('.git')() or vim.fn.expand("%:p:h")
            print(root)
            require('telescope.builtin').grep_string({
                only_sort_text = true,
                search = word,
                cwd = root
            })
        end,
    },
    {
      label = "S - Search buffer",
      _funref = function()
        require('telescope.builtin').buffers()
      end,
    },
    {
      label = "Y - Remote yank through SSH",
      _funref = function()
        require("osc52").copy_register('""')
        print("Yank Done!")
      end
    },
    {
        label = "G - Gitsign Reset hunk",
        _funref = function()
            vim.cmd("Gitsigns reset_hunk")
        end,
    },
    {
        label = "G - Gitsign preview hunk",
        _funref = function()
            vim.cmd("Gitsigns preview_hunk")
        end,
    },
    {
      label = "G - Gitsign quickfix list",
      _funref = function()
        vim.cmd("Gitsigns setqflist")
        print("Git quickfix list")
      end,
    },
    {
      label = "G - Git status",
      _funref = function()
        require("telescope.builtin").git_status{}
      end
    },
    {
      label = "R - Reload vim",
      _funref = function()
        vim.cmd("w")
        vim.cmd("so %")
        vim.cmd("source ~/.config/nvim/init.vim")
        print("Reload Vim!")
      end

    },
    {
      label = "R - Reload Snip",
      _funref = function()
        vim.cmd("w")
        require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/user/snip/ft"})
        require("luasnip.loaders.from_vscode").lazy_load({paths = "~/.config/nvim/lua/user/snip/vsSnip"})
        print("Reload Snip!")
      end
    },
    {
      label = "Outline",
      _funref = function()
        require('telescope').extensions.ctags_outline.outline()
      end
    },
    {
      label = "Telescope Builtin",
      _funref = function()
        require("telescope.builtin").builtin{}
      end
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
        -- sorting_strategy = "ascending",
        -- layout_strategy = "cursor",
        layout_config = {
            width = 0.3,
            height = 18,
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

map("n", "<leader>/", ":lua require('user.Cmdline').Cmdline()<cr>")

return M
