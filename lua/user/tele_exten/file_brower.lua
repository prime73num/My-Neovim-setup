local action_state = require "telescope.actions.state"
local fb_utils = require "telescope._extensions.file_browser.utils"
local config = {
  hijack_netrw = true,
  prompt_prefix=" FIND: ",
  layout_strategy = "vertical",
  sorting_strategy = "ascending",
  hide_parent_dir = true,
  dir_icon_hl = "Directory",
  layout_config = {
    prompt_position = "top",
    width = 0.4,
    height = 0.6,
  },
  display_stat = {
    size = true,
  },
  make_args = function (fd_args)
    local args = {"-a"}
    if fd_args.show_hide then
      table.insert(args, "-H")
    end
    if fd_args.show_gitignore then
      table.insert(args, "--no-ignore-vcs")
    end
    if fd_args.type ~= "all" then
      table.insert(args, "--type")
      table.insert(args, fd_args.type)
    end
    if type(fd_args.depth) == "number" then
      table.insert(args, "--maxdepth")
      table.insert(args, fd_args.depth)
    end
    return args
  end,
  fd_args = {
    depth = 1,
    type = "all",
    show_hide = false,
    show_gitignore = true,
  },
  mappings = {
    ["n"] = {
      ["S"] = function(prompt_bufnr)
        local current_picker = action_state.get_current_picker(prompt_bufnr)
        local finder = current_picker.finder
        local dir = finder.path
        require("telescope.actions").close(prompt_bufnr)
        require('telescope.builtin').grep_string({
          search = "",
          cwd = dir,
        })
      end,
      ["f"] = function(prompt_bufnr)
        local current_picker = action_state.get_current_picker(prompt_bufnr)
        local finder = current_picker.finder
        if finder.fd_args.type == "all" then
          finder.fd_args.depth = 5
          finder.fd_args.type = "file"
          finder.fd_args.show_gitignore = false
          finder.fd_args.show_hide = false
        elseif finder.fd_args.type == "file" then
          finder.fd_args.type = "directory"
        else
          finder.fd_args.depth = 1
          finder.fd_args.type = "all"
          finder.fd_args.show_gitignore = true
          finder.fd_args.show_hide = false
        end

        fb_utils.redraw_border_title(current_picker)
        current_picker:refresh(finder, { reset_prompt = true, multi = current_picker._multi })
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
        vim.cmd(string.format("FloatermNew! cd %s", dir))
      end,
    },
  },
}
return config
