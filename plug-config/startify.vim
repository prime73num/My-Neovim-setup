

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
" let g:startify_custom_header =
" 		\ startify#pad(split(system('figlet -f larry3d "Hello(^-^) PG12138"'), '\n'))
let g:startify_lists = [
	  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
	  \ { 'type': 'files',     'header': ['   MRU']            },
	  \ { 'type': 'commands',  'header': ['   Commands']       },
	  \ ]

let g:startify_custom_header = [
      \ "                                                                                                                             ",
      \ "                                                                                                                             ",
      \ "                                                                                                   :~!!~.                    ",
      \ "                                                                                                 .YB###BG?                   ",
      \ "                                                                                                 7#&&&###B!                  ",
      \ "                                                   .:.                                          .P#&@@@&#G5                  ",
      \ "                                                .?YPPPJ!                                         7JG##BG5Y7                  ",
      \ "                                               :P#B#BPPGJ                                         :~JYJ7?^                   ",
      \ "                                               ~&&&&&##GP:                               ...::~???7!!!!~~..                  ",
      \ "                                               :#@@@@&GJ~                              :^!!777?5PP55P5YJJJJJ7~.              ",
      \ "                                               .5GB##GJ7:                            .^7?JY555PGP5555PBGP55P55~^^.           ",
      \ "                                               ^?Y5Y7^:.    .                       .~!!!!5#GPBP~!!~?77YY?J55P7!!!~:         ",
      \ "                                                ..       .!7!~.                  .~7JJ!~!7P#B#&G777!?7~?!~?!5P7!JY?!^        ",
      \ "                                       :^     .. . .:.::.?PJ7!~:               .~YPGGGP?^:5B&&&GBBGY?YGG5YJG#B5JG#5?!:       ",
      \ "                                     .~Y7 ::7^?Y!57?Y!!~:5B5!~::               :?Y5GGG5^ :55&&&G#P!:^.^G#BB###Y:J##P?7^:     ",
      \ "                                    .~?PP~Y55?Y5JP5P5GB7.5##?.                :7JY?Y5~   .!Y&@&P#Y:^J^.YBB#B#B^  7GBPJ7~^.   ",
      \ "                                  .^!?YGB~75??^^~^~~?5!:.7PG?^::.             :5PPY7.    ^?B@@&GG7^!~.~GB##G#5    ^5BP5J!^:  ",
      \ "                                .~7??Y5?: ^:^^7JJ?~:~::^:~7YJ~ ..:^:           7PP5J:    ~B@@&&B5~:?!.~B##BG#J      ~YGPY!^: ",
      \ "                             .~!?YYJ?!:   :^.7#7P@5~!.:^:!~7~   .~!~^           75PY:   7#@@##&BGGJ?7YG##BBP#7      .7BGP5?! ",
      \ "                             ~&&&&&B:      ^:^JY##7!~.::.~!:    :~^^.            !55?: Y&##BB&&#BG#&&##BBBGPB~    .?GBP555?^ ",
      \ "                              7B@@&&J      .^7G!5@P~::.:..^^   .^~^:              !5GBPPGB##&&###GGBBBBBBBGPP. .^?G#BP5?^.   ",
      \ "                               .!YPPY7:     :?Y^YG7.:~~~!^.:   :^^.                7PG##G&@&&&&&&#######BGG57!JPBBPY?~.      ",
      \ "                                  :?YPG7.   .. ..::^^:::^!7J?J?~~.                  .~YJG&##BGBGGBBBBBBBPGG5JPGY7~:          ",
      \ "                                    .!YGGJ~.   .:::^~:.. .~JGGP5~                     :7B##BGBBGBBBBGGGGPGP5!:.              ",
      \ "                                       ^?PJ.  :^~~~~~^:..:^!7PJ^                      !!GB#GBB#B#B&B#B#BG#PP~                ",
      \ "                                         :^..:^~~~~~^^:...^~^~:                      .77G##GB##B##&B#B#BG#P5?                ",
      \ ]
