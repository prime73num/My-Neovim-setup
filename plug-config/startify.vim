

"     _             _   _  __       
" ___| |_ __ _ _ __| |_(_)/ _|_   _ 
"/ __| __/ _` | '__| __| | |_| | | |
"\__ \ || (_| | |  | |_| |  _| |_| |
"|___/\__\__,_|_|   \__|_|_|  \__, |
"                             |___/ 



function! StartifyEntryFormat()
	return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

let g:startify_custom_indices = ['i','a', 'd', 'f', 'g', 'h']
let g:startify_enable_special = 0
let g:startify_change_to_dir = 0
let g:startify_bookmarks = [ '.','~/.config/nvim' ]
let g:startify_custom_header =
		\ startify#pad(split(system('figlet -f larry3d "Hello(^-^) PG12138"'), '\n'))
let g:startify_lists = [
	  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
	  \ { 'type': 'files',     'header': ['   MRU']            },
	  \ { 'type': 'commands',  'header': ['   Commands']       },
	  \ ]

