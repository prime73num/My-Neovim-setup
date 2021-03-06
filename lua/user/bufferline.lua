vim.opt.termguicolors = true
require('bufferline').setup {
    options = {
        mode = "buffers", -- set to "tabs" to only show tabpages instead
        close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
        right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
        left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
        middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
        -- and so changing this is NOT recommended, this is intended
        -- as an escape hatch for people who cannot bear it for whatever reason
        indicator_icon = '▎',
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        --- name_formatter can be used to change the buffer's label in the bufferline.
        --- Please note some names can/will break the
        --- bufferline so use this at your discretion knowing that it has
        --- some limitations that will *NOT* be fixed.
        name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
            -- remove extension from markdown files for example
            if buf.name:match('%.md') then
                return vim.fn.fnamemodify(buf.name, ':t:r')
            end
        end,
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        tab_size = 18,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            return "("..count..")"
        end,
        offsets = {
            {
                filetype = "neo-tree",
                text = function()
                    return "File Explore NeoTree"
                end,
                highlight = "NeotreeTitle",
                text_align = "center"
            }
        },
        groups = {
            options = {
                toggle_hidden_on_enter = false 
            },
            items = {
                {
                    name = "CWD", -- Mandatory
                    highlight = {gui = "underline", guisp = "blue"}, -- Optional
                    priority = 2, -- determines where it will appear relative to other groups (Optional)
                    -- icon = "", -- Optional
                    matcher = function(buf) -- Mandatory
                        local cwd = vim.fn.getcwd()
                        local name = vim.fn.expand("#"..buf.id..":p")
                        local start = string.sub(name, 1, #cwd)
                        return start==cwd
                    end,
                },
                {
                    name = "Free",
                    highlight = {gui = "undercurl", guisp = "green"},
                    auto_close = false,  -- whether or not close this group if it doesn't contain the current buffer
                    matcher = function(buf)
                        local cwd = vim.fn.getcwd()
                        local name = buf.path
                        local start = string.sub(name, 1, #cwd)
                        return start~=cwd
                    end,
                },
            }
        },
        color_icons = true ,
        show_buffer_icons = false,
        show_buffer_close_icons = false,
        show_buffer_default_icon = true,
        show_close_icon = false,
        show_tab_indicators = true,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        separator_style = "thin",
        -- "slant", | "thick" | "thin" | { 'any', 'any' },
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        sort_by = 'insert_after_current' 
    },
}
vim.cmd([[
nnoremap L :BufferLineCycleNext<CR>
nnoremap H :BufferLineCyclePrev<CR>
hi BufferLineFill guifg=#719872 guibg=#444444
]])
