local telescope = require "telescope"
local actions = require "telescope.actions"
local action_layout = require("telescope.actions.layout")
local fb_actions = require "telescope".extensions.file_browser.actions
local action_state = require "telescope.actions.state"
local fb_utils = require "telescope._extensions.file_browser.utils"

local Floaterm = function(prompt_bufnr)
    local selection = require("telescope.actions.state").get_selected_entry()
    local dir = vim.fn.fnamemodify(selection.filename, ":p:h")
    require("telescope.actions").close(prompt_bufnr)
    vim.cmd(string.format("FloatermNew! --title='~Choose_Dir~' cd %s", dir))
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

telescope.setup {
    defaults = {
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
            width = 0.6,
            height = 0.9,
        },

        mappings = {
            i = {
                ["<C-n>"] = actions.cycle_history_next,
                ["<C-p>"] = actions.cycle_history_prev,
                ["<esc>"] = actions.close,
                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,
                ["<CR>"] = actions.select_default,
                ["<PageUp>"] = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,
                ["<Tab>"] = actions.move_selection_next,
                ["<S-Tab>"] = actions.move_selection_previous,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                ["<C-l>"] = actions.complete_tag,
                ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
            },
            n = {
                ["<esc>"] = actions.close,
                ["q"] = actions.close,
                ["<CR>"] = actions.select_default,
                ["o"] = actions.select_default,
                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,
                ["P"] = action_layout.toggle_preview,
            },
        },
    },
    pickers = {
        buffers = {
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
            theme = "dropdown",
            previewer = false,
        },
        grep_string = {
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
            -- theme = "dropdown",
            previewer = false,
            initial_mode = "insert",
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
        file_browser = {
          layout_strategy = "vertical",
          sorting_strategy = "ascending",
          layout_config = {
            prompt_position = "top",
            width = 0.4,
            height = 0.6,
          },
            mappings = {
                ["n"] = {
                    ["I"] = function(prompt_bufnr)
                        local current_picker = action_state.get_current_picker(prompt_bufnr)
                        local finder = current_picker.finder

                        local selections = fb_utils.get_selected_files(prompt_bufnr, false)
                        if vim.tbl_isempty(selections) then
                            print "[telescope] Nothing currently selected to be moved"
                            return
                        end
                        require("telescope.actions").close(prompt_bufnr)

                        for _, selection in ipairs(selections) do
                            local filename = selection.filename
                            print(filename)
                            local dir = string.sub(filename,33)
                            local back = "[Name]: http://106.55.101.249/Mysite/Blog/"..dir
                            print("Import link -- "..back)
                            vim.call('cursor',8,1)
                            vim.call('append',8,back)
                        end
                    end,
                    ["S"] = function(prompt_bufnr)
                        local current_picker = action_state.get_current_picker(prompt_bufnr)
                        local finder = current_picker.finder
                        local dir = finder.path
                        require("telescope.actions").close(prompt_bufnr)
                        require('telescope.builtin').live_grep({
                            cwd = dir,
                        })
                    end,
                    ["."] = function(prompt_bufnr)
                        local current_picker = action_state.get_current_picker(prompt_bufnr)
                        local finder = current_picker.finder
                        finder.cwd = finder.path
                        vim.cmd("cd " .. finder.path)

                        fb_utils.redraw_border_title(current_picker)
                        current_picker:refresh(finder, { reset_prompt = true, multi = current_picker._multi })
                        print("Change CWD to "..finder.path)
                    end,
                    ["F"] = function(prompt_bufnr)
                        local current_picker = action_state.get_current_picker(prompt_bufnr)
                        local finder = current_picker.finder
                        local dir = finder.path
                        print("Open shell at: "..dir)
                        require("telescope.actions").close(prompt_bufnr)
                        vim.cmd(string.format("FloatermNew! --title='~Choose_Dir~' cd %s", dir))
                    end,
                },
            },
        },
        ctags_outline = {
            layout_config = {
                vertical = {
                    mirror = false,
                    preview_height = 28,
                },
                width = 0.6,
                height = 0.9,
                preview_cutoff = 10,
            },
            ctags = {'ctags'},
            ft_opt = {
                aspvbs = '--asp-kinds=f',
                awk = '--awk-kinds=f',
                c = '--c-kinds=fp',
                cpp = '--c++-kinds=fp --language-force=C++',
                cs = '--c#-kinds=m',
                erlang = '--erlang-kinds=f',
                fortran = '--fortran-kinds=f',
                java = '--java-kinds=m',
                javascript = '--javascript-kinds=f',
                lisp = '--lisp-kinds=f',
                lua = '--lua-kinds=f',
                matla = '--matlab-kinds=f',
                pascal = '--pascal-kinds=f',
                php = '--php-kinds=f',
                python = '--python-kinds=fm --language-force=Python',
                ruby = '--ruby-kinds=fF',
                scheme = '--scheme-kinds=f',
                sh = '--sh-kinds=f',
                sql = '--sql-kinds=f',
                tcl = '--tcl-kinds=m',
                verilog = '--verilog-kinds=f',
                vim = '--vim-kinds=f',
                go = '--go-kinds=f',
                rust = '--rust-kinds=fPM',
                ocaml = '--ocaml-kinds=mf',
            },
        },
    },
}

require('telescope').load_extension('ctags_outline')
require("telescope").load_extension "file_browser"
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<Leader>bb", ":Telescope buffers<CR>")
map("n", "<Leader>bo", ":Telescope oldfiles<CR>")
map("n", "<Leader>/", ":lua require('user.telescope').MyPicker(require('telescope.themes').get_dropdown{})<cr>")
map("n", "<Leader>f", ':lua require("user.telescope").find_files()<cr>')

local M = {}
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local make_entry = require "telescope.make_entry"
local fb_picker = require "telescope._extensions.file_browser.picker"

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
        mycount = 1,
    })
end
local fd_Myvim = function()
    require 'telescope'.extensions.file_browser.file_browser({
    previewer = false,
		cwd = "~/.config/nvim",
		prompt_title = "~MyNeovim~",
    })
end
local fd_Repo = function()
    require 'telescope'.extensions.file_browser.file_browser{
    previewer = false,
		cwd = "~/TMD",
		prompt_title = "~MyRepo~",
	}
end

local fd_MyBlog = function()
    require 'telescope'.extensions.file_browser.file_browser{
    previewer = false,
		cwd = "~/WorkSpace/Blog/source/_posts",
		prompt_title = "~MyBlogm~",
	}
end
local fd_cwd = function()
    require 'telescope'.extensions.file_browser.file_browser({
    previewer = false,
		cwd = ".",
		prompt_title = "~ CWD ~",
    })
end
local buf = function()
	require("telescope.builtin").buffers{}
end
local built = function()
	require("telescope.builtin").builtin{}
end
local oldf = function()
	require("telescope.builtin").oldfiles{}
end
local git_status = function()
	require("telescope.builtin").git_status{}
end
local live_grep = function()
    require('telescope.builtin').grep_string({
        search = "",
        initial_mode = "insert",
    })
end
local outline = function()
    require('telescope').extensions.ctags_outline.outline()
end
local hexo = function()
    vim.cmd("FloatermNew! cd ~/WorkSpace/Blog && hexo clean && hexo g")
end
local ReloadVim = function()
    vim.cmd("w")
    vim.cmd("so %")
    vim.cmd("source ~/.config/nvim/init.vim")
    print("Reload Vim!")
end
local loadsnip = function()
    vim.cmd("w")
    require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/user/snip/ft"})
    require("luasnip.loaders.from_vscode").lazy_load({paths = "~/.config/nvim/lua/user/snip/vsSnip"})
    print("Reload Snip!")
end

-- our picker function: colors
M.MyPicker = function(opts)
    opts = opts or {}
    -- opts = {
    --   initial_mode = "insert",
    -- }
    opts.initial_mode = "insert"
    opts.layout_config = {
      width = 0.3,
      height = 0.3,
    }
    pickers.new(opts, {
        prompt_title = " MyPicker ",
        finder = finders.new_table {
            results = {
                { "華CWD", fd_cwd },
                { "勇MyNeovim", fd_Myvim },
                { " MyBlog", fd_MyBlog },
                { " MyRepo", fd_Repo },
                { " GrepString", live_grep },
                { " Outline", outline },
                { " Git_status", git_status },
                { " BuiltIn", built },
                { " Reload Vim", ReloadVim },
                { " Reload Snip", loadsnip },
                { " Hexo", hexo },
            },
            entry_maker = function(entry)
                return {
                    value = entry,
                    display = entry[1],
                    ordinal = entry[1],
                    MyFunc = entry[2],
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

vim.cmd([[
hi TelescopePreviewTitle ctermbg=110 guibg=#98BEDE guifg=#333333
hi TelescopePromptTitle ctermbg=108 guibg=#98BC99 guifg=#333333
hi TelescopeNormal guibg=#282A36
hi TelescopeBorder guifg=#777777 guibg=#282A36
hi TelescopeMatching guibg=NONE guifg=#569CD6
hi TelescopePromptPrefix guifg=#98BC99 
hi TelescopeSelectionCaret guifg=#98BEDE guibg=#007173
]])
return M
