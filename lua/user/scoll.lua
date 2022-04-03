require('neoscroll').setup({
    -- All these keys will be mapped to their corresponding default scrolling animation
    hide_cursor = true,          -- Hide cursor while scrolling
    stop_eof = false,             -- Stop at <EOF> when scrolling downwards
    use_local_scrolloff = true, -- Use the local scope of scrolloff instead of the global scope
    respect_scrolloff = true,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = nil,       -- Default easing function
    pre_hook = nil,             -- Function to run before the scrolling animation starts
    post_hook = nil,             -- Function to run after the scrolling animation ends
    performance_mode = false,    -- Disable "Performance Mode" on all buffers.
}) 
local t = {}
-- Syntax: t[keys] = {function, {function arguments}}
t['<c-j>'] = {'scroll', {'vim.wo.scroll', 'true', '500',[['sine']]}}
t['<c-k>'] = {'scroll', {'-vim.wo.scroll', 'true', '500',[['sine']]}}
t['zt']    = {'zt', {'250'}}
t['zz']    = {'zz', {'250'}}
t['zb']    = {'zb', {'250'}}

require('neoscroll.config').set_mappings(t)
