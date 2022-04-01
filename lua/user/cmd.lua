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

function source:get_keyword_pattern()
  return [[\k\+]]
end

function source:get_trigger_characters()
  return { '@' }
end

local myfunc = function()
    print("hello")
end

local rustItem = {
    {
        label = "run",
        documentation = {
            kind = "markdown",
            value = "# Run\nCargo run!",
        },
        _funref = function()
            vim.cmd("FloatermNew! --title='~Choose_Dir~' cargo run")
        end,
    },
}
local allItem = {}
function source:complete(params, callback)
    if vim.bo.filetype=="rust" then
      callback(rustItem)
    else
      callback(allItem)
    end
end

function source:resolve(completion_item, callback)
  callback(completion_item)
end

function source:execute(completion_item, callback)
  callback(completion_item)
  vim.cmd("stopi")
  vim.cmd("undo")
  vim.cmd("silent undo")
  completion_item._funref()
end

require('cmp').register_source('cmd', source.new())


