
" _         _____         
"| |    __ |_   _|____  __
"| |   / _` || |/ _ \ \/ /
"| |__| (_| || |  __/>  < 
"|_____\__,_||_|\___/_/\_\
"                         

let g:tex_flavor = "latex"
let g:vimtex_enabled = 1
let g:vimtex_mappings_enabled = 0
let g:vimtex_quickfix_enabled = 0
let g:vimtex_view_enabled = 0
let g:vimtex_view_automatic = 0
let g:vimtex_view_method = 'zathura'
let g:vimtex_indent_enaled = 1
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
nmap <leader><leader>l :w<cr><plug>(vimtex-compile)
nmap <leader><leader>v <plug>(vimtex-view)
