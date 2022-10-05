
" _         _____
"| |    __ |_   _|____  __
"| |   / _` || |/ _ \ \/ /
"| |__| (_| || |  __/>  <
"|_____\__,_||_|\___/_/\_\
"

let g:tex_flavor = "latex"
let g:vimtex_enabled = 1
let g:vimtex_mappings_enabled = 0
let g:vimtex_quickfix_enabled = 1
let g:vimtex_view_enabled = 1
let g:vimtex_view_automatic = 1

let g:vimtex_view_method = 'skim'
let g:vimtex_view_skim_sync = 1
let g:vimtex_view_skim_activate = 0

let g:vimtex_indent_enaled = 0
let g:vimtex_compiler_latexmk = {
            \ 'build_dir' : 'build',
            \ 'callback' : 1,
            \ 'continuous' : 0,
            \ 'executable' : 'latexmk',
            \ 'hooks' : [],
            \ 'options' : [
                \   '-verbose',
                \   '-file-line-error',
                \   '-synctex=1',
                \   '-interaction=nonstopmode',
                \ ],
                \}

" Latex Keymap
nmap <buffer><leader><leader>l :w<cr>:VimtexCompile<cr>
nmap <buffer><leader><leader>v <plug>(vimtex-view)

