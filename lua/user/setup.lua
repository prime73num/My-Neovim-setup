
Init = false
local function setup()
  if Init then
    return
  end
  Init = true
  vim.cmd([[ colorscheme onenord ]])
end
setup()

