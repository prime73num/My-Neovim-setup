local settings = {
    -- every line should be same width without escaped \
    header = {
        type = "text",
        align = "center",
        fold_section = false,
        title = "Header",
        margin = 5,
        content = require("startup.headers").hydra_header,
        highlight = "Statement",
        default_color = "",
        oldfiles_amount = 0,
    },
    header_2 = {
        type = "text",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Quote",
        margin = 5,
        content = require("startup.functions").quote(),
        highlight = "Constant",
        default_color = "",
        oldfiles_amount = 0,
    },
    -- name which will be displayed and command
    body = {
        type = "mapping",
        align = "center",
        fold_section = true,
        title = "Basic Commands",
        margin = 5,
        content = {
            { " File Browser", "Neotree reveal=true reveal_force_cwd", "i" },
            { " Find File", "lua require('user.telescope').find_files()", "a" },
            { " Quit", "q", "q" },
            -- { " New File", "lua require'startup'.new_file()", "e" },
            { " Recent Files", "Telescope oldfiles", "<leader>bo" },
            { " Colorschemes", "Telescope colorscheme", "<leader>cs" },
        },
        highlight = "String",
        default_color = "",
        oldfiles_amount = 0,
    },
    oldf = {
        type = "oldfiles",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Oldfiles",
        margin = 5,
        content = { "startup.nvim" },
        highlight = "TSString",
        default_color = "#FFFFFF",
        oldfiles_amount = 10,
    },

    clock = {
        type = "text",
        content = function()
            local clock = " " .. os.date("%H:%M")
            local date = " " .. os.date("%d-%m-%y")
            return { clock, date }
        end,
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "",
        margin = 5,
        highlight = "TSString",
        default_color = "#FFFFFF",
        oldfiles_amount = 10,
    },

    footer_2 = {
        type = "text",
        content = {
            "Author: PG12138",
            "Shen Zhen",
            "Startup.vim",
        },
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "",
        margin = 5,
        highlight = "Label",
        default_color = "#FFFFFF",
        oldfiles_amount = 10,
    },
    mappings = {
        -- execute_command = "<CR>",
        open_file = "o",
        open_file_split = "<c-o>",
        open_section = "<cr>",
        open_help = "?",
    },

    options = {
        after = function()
            require("startup.utils").oldfiles_mappings()
            vim.cmd("set nohlsearch")
        end,
        -- mapping_keys = true,
        cursor_column = 0.2,
        empty_lines_between_mappings = false,
        disable_statuslines = true,
        paddings = { 4, 1, 1, 2, 2, 2, 2 },
    },
    colors = {
        background = "#1f2227",
        folded_section = "#56b6c2",
    },
    parts = {
        "header",
        "header_2",
        "body",
        "oldf",
        "clock",
        "footer_2",
    },
}
require("startup").setup(settings)

