local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end


local actions = require "telescope.actions"
local action_layout = require("telescope.actions.layout")
local fb_actions = require "telescope".extensions.file_browser.actions
local action_state = require "telescope.actions.state"
local fb_utils = require "telescope._extensions.file_browser.utils"

telescope.setup {
  defaults = {

	prompt_prefix="  ",
    selection_caret = " ",
    initial_mode = "normal",
	scroll_strategy = "limit",
	sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
     horizontal = {
        prompt_position = "top",
        preview_width = 0.6,
        results_width = 0.5,
        mirror = true,
     },
     vertical = {
        mirror = false,
     },
     width = 0.87,
     height = 0.80,
     preview_cutoff = 120,
    },

    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        ["<esc>"] = actions.close,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,

        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

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
       ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

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
    find_files = {
      theme = "dropdown",
	  no_ignore = false,
	  previewer = false,
	  mappings = {
        n = {
          ["D"] = function(prompt_bufnr)
            local selection = require("telescope.actions.state").get_selected_entry()
            local dir = vim.fn.fnamemodify(selection.path, ":p")
            require("telescope.actions").close(prompt_bufnr)
            vim.cmd(string.format("!cp %s .", dir))
          end,
          ["U"] = function(prompt_bufnr)
            local selection = require("telescope.actions.state").get_selected_entry()
            local dir = vim.fn.fnamemodify(selection.path, ":p")
            require("telescope.actions").close(prompt_bufnr)
            vim.cmd(string.format("!cp %s ~/TMD", dir))
          end
        }
      },
    },
    buffers = {
	  sort_mru = true,
      theme = "dropdown",
	  previewer = false,
	  mappings = {
        n = {
          ["cd"] = function(prompt_bufnr)
            local selection = require("telescope.actions.state").get_selected_entry()
			local filename = selection.filename
            local dir = vim.fn.fnamemodify(filename, ":p:h")
            require("telescope.actions").close(prompt_bufnr)
            require 'telescope'.extensions.file_browser.file_browser{ cwd = dir }
          end,
          ["F"] = function(prompt_bufnr)
            require("telescope.actions").close(prompt_bufnr)
            local selection = require("telescope.actions.state").get_selected_entry()
			local filename = selection.filename
            local dir = vim.fn.fnamemodify(filename, ":p:h")
            vim.cmd(string.format("FloatermNew! --title='~Choose_Dir~' cd %s", dir))
          end,
        }
      },
    },
    builtin = {
      theme = "dropdown",
	  previewer = false,
    },
    oldfiles = {
      theme = "dropdown",
	  previewer = false,
	  mappings = {
        n = {
          ["F"] = function(prompt_bufnr)
            local selection = require("telescope.actions.state").get_selected_entry()
            local dir = vim.fn.fnamemodify(selection.path, ":p:h")
            require("telescope.actions").close(prompt_bufnr)
            vim.cmd(string.format("FloatermNew! --title='~Choose_Dir~' cd %s", dir))
          end,
          ["cd"] = function(prompt_bufnr)
            local selection = require("telescope.actions.state").get_selected_entry()
            local dir = vim.fn.fnamemodify(selection.path, ":p:h")
            require("telescope.actions").close(prompt_bufnr)
            require 'telescope'.extensions.file_browser.file_browser{ cwd = dir }
          end,
        }
      },
    },
   },

   extensions = {
     file_browser = {
       theme = "dropdown",
       previewer = false,
       mappings = {
         ["i"] = {
           -- your custom insert mode mappings
         },
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
   }
} 
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

local M = {}
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local make_entry = require "telescope.make_entry"
local fb_picker = require "telescope._extensions.file_browser.picker"

local fd_Myvim = function()
    require 'telescope'.extensions.file_browser.file_browser({
		cwd = "~/.config/nvim",
		prompt_title = "~MyNeovim~",
    })
end
local fd_Repo = function()
    require 'telescope'.extensions.file_browser.file_browser{
		cwd = "~/TMD",
		prompt_title = "~MyRepo~",
	}
end

local fd_MyBlog = function()
    require 'telescope'.extensions.file_browser.file_browser{
		cwd = "~/WorkSpace/Blog/source/_posts",
		prompt_title = "~MyBlogm~",
	}
end
local fd_cwd = function()
    require 'telescope'.extensions.file_browser.file_browser{}
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
local live_grep = function()
    require('telescope.builtin').live_grep()
end
local HexoCG = function()
	vim.cmd("FloatermNew! --title='~Clean&Get~' cd ~/WorkSpace/Blog && hexo clean && hexo g")
end

-- our picker function: colors
M.MyPicker = function(opts)
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = " MyPicker ",
    finder = finders.new_table {
      results = {
        { "華CWD", fd_cwd },
        { "勇MyNeovim", fd_Myvim },
        { " MyBlog", fd_MyBlog },
        { " MyRepo", fd_Repo },
        { " Live_Grep", live_grep },
        { " BuiltIn", built },
        { " Hexo_C&G", HexoCG },
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

return M
