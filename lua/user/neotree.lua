vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

vim.fn.sign_define("DiagnosticSignError",
  {text = " ", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn",
  {text = " ", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo",
  {text = " ", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint",
  {text = "", texthl = "DiagnosticSignHint"})

require("neo-tree").setup({
  close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
  popup_border_style = "rounded",
  enable_git_status = true,
  enable_diagnostics = true,

  default_component_configs = {
    indent = {
      indent_size = 2,
      padding = 1, -- extra padding on left hand side
      -- indent guides
      with_markers = true,
      indent_marker = "│",
      last_indent_marker = "└",
      highlight = "NeoTreeIndentMarker",
      -- expander config, needed for nesting files
      with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
      expander_collapsed = "",
      expander_expanded = "",
      expander_highlight = "NeoTreeExpander",
    },
    icon = {
      folder_closed = "",
      folder_open = "",
      folder_empty = "ﰊ",
      default = "*",
    },
    name = {
      trailing_slash = false,
      use_git_status_colors = true,
    },
    git_status = {
      symbols = {
        -- Change type
        added     = "✚",
        deleted   = "✖",
        modified  = "",
        renamed   = "",
        -- Status type
        untracked = "",
        ignored   = "",
        unstaged  = "",
        staged    = "",
        conflict  = "",
      }
    },
  },
  popup_border_style = "rounded",
  window = {
    popup = {
        position = {
            row = "20%",
            col = "7%"
        },
        size = { width = 60, height = "80%" },
    },
    width = 40,
    mappings = {
      ["<cr>"] = "open",
      ["o"] = "open",
      -- ["S"] = "open_split",
      -- ["s"] = "open_vsplit",
      -- ["C"] = "close_node",
      ["u"] = "navigate_up",
      ["."] = "set_root",
      ["H"] = "toggle_hidden",
      ["R"] = "refresh",
      -- ["/"] = "fuzzy_finder",
      -- ["f"] = "filter_on_submit",
      -- ["<c-x>"] = "clear_filter",
      -- ["n"] = "add",
      -- ["N"] = "add_directory",
      -- ["d"] = "delete",
      -- ["r"] = "rename",
      -- ["y"] = "copy_to_clipboard",
      -- ["x"] = "cut_to_clipboard",
      -- ["p"] = "paste_from_clipboard",
      -- ["c"] = "copy", -- takes text input for destination
      -- ["m"] = "move", -- takes text input for destination
      ["q"] = "close_window",
    }
  },
  nesting_rules = {},
  filesystem = {
    filtered_items = {
      visible = false, 
      hide_dotfiles = true,
      hide_gitignored = true,
      hide_by_name = {
        ".DS_Store",
        "thumbs.db"
      },
      never_show = { -- remains hidden even if visible is toggled to true
      },
    },
    follow_current_file = true, -- This will find and focus the file in the active buffer every
    bind_to_cwd = true, 
    hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
    use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
  },
  buffers = {
    show_unloaded = true,
    window = {
      mappings = {
        ["bd"] = "buffer_delete",
      }
    },
  },
  git_status = {
    window = {
      position = "float",
      mappings = {
        ["A"]  = "git_add_all",
        ["gu"] = "git_unstage_file",
        ["ga"] = "git_add_file",
        ["gr"] = "git_revert_file",
        ["gc"] = "git_commit",
        ["gp"] = "git_push",
        ["gg"] = "git_commit_and_push",
      }
    }
  }
})
vim.cmd([[nnoremap <leader>t :Neotree<cr>]])
vim.cmd([[hi NeotreeTitle ctermfg=68 guifg=#719CDF guibg=#444444]])
