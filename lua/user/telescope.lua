local telescope = require "telescope"
local actions = require "telescope.actions"
local action_layout = require("telescope.actions.layout")
local fb_actions = require "telescope".extensions.file_browser.actions
local action_state = require "telescope.actions.state"
local fb_utils = require "telescope._extensions.file_browser.utils"
local previewers = require("telescope.previewers")

local Floaterm = function(prompt_bufnr)
    local selection = require("telescope.actions.state").get_selected_entry()
    local dir = vim.fn.fnamemodify(selection.filename, ":p:h")
    require("telescope.actions").close(prompt_bufnr)
    vim.cmd(string.format("FloatermNew! cd %s", dir))
end

local ChangeDir = function(prompt_bufnr)
    local selection = require("telescope.actions.state").get_selected_entry()
    local filename = selection.filename
    local dir = vim.fn.fnamemodify(filename, ":p:h")
    require("telescope.actions").close(prompt_bufnr)
    require 'telescope'.extensions.file_browser.file_browser{ 
      cwd = dir,
      previewer = false
    }
end

local new_maker = function(filepath, bufnr, opts)
  opts = opts or {}

  filepath = vim.fn.expand(filepath)
  vim.loop.fs_stat(filepath, function(_, stat)
    if not stat then return end
    if stat.size > 100000 then
      return
    else
      previewers.buffer_previewer_maker(filepath, bufnr, opts)
    end
  end)
end

telescope.setup {
    defaults = {
        buffer_previewer_maker = new_maker,
        prompt_prefix="  ",
        selection_caret = " ",
        initial_mode = "normal",
        scroll_strategy = "limit",
        layout_strategy = "vertical",
        layout_config = {
            vertical = {
                mirror = false,
                -- preview_height = 30,
            },
            width = 0.55,
            height = 0.8,
        },

        mappings = {
            i = {
                ["<C-j>"] = actions.cycle_history_next,
                ["<C-k>"] = actions.cycle_history_prev,
                -- ["<esc>"] = actions.close,
                -- ["<Down>"] = actions.move_selection_next,
                -- ["<Up>"] = actions.move_selection_previous,
                ["<CR>"] = actions.select_default,
                -- ["<PageUp>"] = actions.results_scrolling_up,
                -- ["<PageDown>"] = actions.results_scrolling_down,
                ["<Tab>"] = actions.move_selection_next,
                ["<S-Tab>"] = actions.move_selection_previous,
                -- ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                -- ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                -- ["<C-l>"] = actions.complete_tag,
                -- ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
            },
            n = {
                -- ["<esc>"] = actions.close,
                ["q"] = actions.close,
                ["<CR>"] = actions.select_default,
                ["o"] = actions.select_default,
                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<C-s>"] = actions.send_selected_to_qflist + actions.open_qflist,
                -- ["<Down>"] = actions.move_selection_next,
                -- ["<Up>"] = actions.move_selection_previous,
                ["P"] = action_layout.toggle_preview,
            },
        },
    },
    pickers = {
        buffers = {
            prompt_prefix=" BUFRS: ",
            sort_mru = true,
            theme = "dropdown",
            previewer = false,
            layout_config = {
                width = 0.4,
                height = 0.3,
            },
            mappings = {
                n = {
                    ["F"] = Floaterm,
                    ["cd"] = ChangeDir,
                }
            },
        },
        builtin = {
          layout_config = {
            width = 0.3,
            height = 0.5,
          },
            theme = "dropdown",
            previewer = false,
        },
        grep_string = {
            prompt_prefix=" STR: ",
            layout_config = {
                vertical = {
                    mirror = false,
                    preview_height = 30,
                },
                width = 0.6,
                height = 0.9,
                preview_cutoff = 10,
            },
            layout_strategy = "vertical",
            sorting_strategy = "descending",
        },
        git_status = {
            layout_config = {
                vertical = {
                    mirror = false,
                    preview_height = 30,
                },
                width = 0.6,
                height = 0.9,
                preview_cutoff = 10,
            },
            layout_strategy = "vertical",
            sorting_strategy = "descending",
        },
        oldfiles = {
          prompt_prefix=" OLDFILES: ",
            -- theme = "dropdown",
            previewer = false,
            initial_mode = "normal",
            -- layout_config = {
            --     width = 0.4,
            --     height = 0.6,
            --     preview_cutoff = 120,
            -- },
            mappings = {
                n = {
                    ["F"] = Floaterm,
                    ["cd"] = ChangeDir,
                }
            },
        },
    },

    extensions = {
        file_browser = require "user.tele_exten.file_brower",
        ctags_outline = require "user.tele_exten.ctags_outline",
        fzf = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = true,  -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        },
    },
}

require('telescope').load_extension('ctags_outline')
require('telescope').load_extension('fzf')
require("telescope").load_extension "file_browser"
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<Leader>bo", ":Telescope oldfiles<CR>")
map("n", "<Leader>f", ':lua require("user.telescope").find_files()<cr>')

local M = {}
M.find_files = function()
    require 'telescope'.extensions.file_browser.file_browser({
        prompt_title = "~Find file in CWD~",
        initial_mode = "insert",
        layout_strategy = "horizontal",
        layout_config = {
            width = 0.69,
            height = 0.5,
            horizontal = {
               preview_width=0.6
            }
        },
        fd_args = {
          depth = 5,
          type = "file",
          show_hide = false,
          show_gitignore = false,
        },
    })
end

vim.cmd([[
hi TelescopePreviewTitle ctermbg=110 guibg=#98BEDE guifg=#333333
hi TelescopePromptTitle ctermbg=108 guibg=#98BC99 guifg=#333333
hi TelescopeMatching guibg=NONE guifg=#4EC9B0
hi TelescopePromptPrefix guifg=#98BC99 
hi TelescopeSelectionCaret guifg=#98BEDE guibg=#007173
hi TelescopeSelection guifg=#DFBC72 guibg=NONE
]])
return M
