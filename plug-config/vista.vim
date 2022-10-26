let g:vista_sidebar_open_cmd = "split"
let g:vista_close_on_jump = 0
let g:vista_echo_cursor = 0
let g:vista_default_executive = 'ctags'

let g:vista_executive_for = {
      \ 'rust': 'nvim_lsp',
      \ 'cpp': 'nvim_lsp',
      \ }
