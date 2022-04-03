local source = {}

source.new = function()
    local self = setmetatable({cache = {}}, {__index = source})
    return self
end

function source:is_available()
  return true
end

function source:get_debug_name()
  return 'debug name'
end


function source:get_trigger_characters()
  return { '@' }
end

function merge(t1, t2)
   for k,v in ipairs(t2) do
      table.insert(t1, v)
   end
   return t1
end
local rustItem = {
    {
        label = "CargoRun",
        documentation = {
            kind = "markdown",
            value = "# Run\nCargo run!",
        },
        _funref = function()
            vim.cmd("w")
            vim.cmd("FloatermNew! cargo run")
        end,
    },
}
local allItem = {
    {
        label = "GoShell",
        documentation = {
            kind = "markdown",
            value = "# Shell\nOpen shell!",
        },
        _funref = function()
            vim.cmd("FloatermNew!")
        end,
    },
    {
        label = "StringGrep",
        documentation = {
            kind = "markdown",
            value = "# GrepString\nGrep string under the cursor!",
        },
        _funref = function()
            local word = vim.fn.expand('<cword>')
            require('telescope.builtin').grep_string({
                search = word,
            })
        end,
    },
    {
        label = "ResetHunk",
        documentation = {
            kind = "markdown",
            value = "# Git hubk\nGrep Reset hunk!",
        },
        _funref = function()
            local word = vim.fn.expand('<cword>')
            vim.cmd("Gitsigns reset_hunk")
        end,
    },
}

rustItem = merge(rustItem, allItem)
function source:complete(params, callback)
    if vim.bo.filetype=="rust" then
      callback(rustItem)
    else
      callback(allItem)
    end
end


function source:execute(completion_item, callback)
  callback(completion_item)
  vim.cmd("stopi")
  vim.cmd("undo")
  vim.cmd("silent undo")
  completion_item._funref()
end

require('cmp').register_source('cmd', source.new())


