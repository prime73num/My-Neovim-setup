

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
let g:startify_enable_special = 1
let g:startify_change_to_dir = 0

function s:foobar()
    return [
            \ { 'line': 'Neotree CWD', 'cmd': 'Neotree' },
            \ { 'line': 'Telescope CWD', 'cmd': 'lua require "telescope".extensions.file_browser.file_browser{ mycount = 1, initial_mode = "insert",}' },
            \ ]
endfunction

let g:startify_lists = [
      \ { 'type': function('s:foobar'), 'header': ['   Commands'] },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ ]

" let g:startify_custom_header = [
"       \ "                                                                                                                             ",
"       \ "                                                                                                                             ",
"       \ "                                                                                                   :~!!~.                    ",
"       \ "                                                                                                 .YB###BG?                   ",
"       \ "                                                                                                 7#&&&###B!                  ",
"       \ "                                                   .:.                                          .P#&@@@&#G5                  ",
"       \ "                                                .?YPPPJ!                                         7JG##BG5Y7                  ",
"       \ "                                               :P#B#BPPGJ                                         :~JYJ7?^                   ",
"       \ "                                               ~&&&&&##GP:                               ...::~???7!!!!~~..                  ",
"       \ "                                               :#@@@@&GJ~                              :^!!777?5PP55P5YJJJJJ7~.              ",
"       \ "                                               .5GB##GJ7:                            .^7?JY555PGP5555PBGP55P55~^^.           ",
"       \ "                                               ^?Y5Y7^:.    .                       .~!!!!5#GPBP~!!~?77YY?J55P7!!!~:         ",
"       \ "                                                ..       .!7!~.                  .~7JJ!~!7P#B#&G777!?7~?!~?!5P7!JY?!^        ",
"       \ "                                       :^     .. . .:.::.?PJ7!~:               .~YPGGGP?^:5B&&&GBBGY?YGG5YJG#B5JG#5?!:       ",
"       \ "                                     .~Y7 ::7^?Y!57?Y!!~:5B5!~::               :?Y5GGG5^ :55&&&G#P!:^.^G#BB###Y:J##P?7^:     ",
"       \ "                                    .~?PP~Y55?Y5JP5P5GB7.5##?.                :7JY?Y5~   .!Y&@&P#Y:^J^.YBB#B#B^  7GBPJ7~^.   ",
"       \ "                                  .^!?YGB~75??^^~^~~?5!:.7PG?^::.             :5PPY7.    ^?B@@&GG7^!~.~GB##G#5    ^5BP5J!^:  ",
"       \ "                                .~7??Y5?: ^:^^7JJ?~:~::^:~7YJ~ ..:^:           7PP5J:    ~B@@&&B5~:?!.~B##BG#J      ~YGPY!^: ",
"       \ "                             .~!?YYJ?!:   :^.7#7P@5~!.:^:!~7~   .~!~^           75PY:   7#@@##&BGGJ?7YG##BBP#7      .7BGP5?! ",
"       \ "                             ~&&&&&B:      ^:^JY##7!~.::.~!:    :~^^.            !55?: Y&##BB&&#BG#&&##BBBGPB~    .?GBP555?^ ",
"       \ "                              7B@@&&J      .^7G!5@P~::.:..^^   .^~^:              !5GBPPGB##&&###GGBBBBBBBGPP. .^?G#BP5?^.   ",
"       \ "                               .!YPPY7:     :?Y^YG7.:~~~!^.:   :^^.                7PG##G&@&&&&&&#######BGG57!JPBBPY?~.      ",
"       \ "                                  :?YPG7.   .. ..::^^:::^!7J?J?~~.                  .~YJG&##BGBGGBBBBBBBPGG5JPGY7~:          ",
"       \ "                                    .!YGGJ~.   .:::^~:.. .~JGGP5~                     :7B##BGBBGBBBBGGGGPGP5!:.              ",
"       \ "                                       ^?PJ.  :^~~~~~^:..:^!7PJ^                      !!GB#GBB#B#B&B#B#BG#PP~                ",
"       \ "                                         :^..:^~~~~~^^:...^~^~:                      .77G##GB##B##&B#B#BG#P5?                ",
"       \ ]







let g:startify_custom_header = [
      \ "                                                                                                                                                 .^~!YY:  ", 
      \ "                                                                                   :^!!:.                                                    .:~~~:. J&5  ", 
      \ "                                                                                 ~5GPPPYP7                                                .^~~^.     !#B. ", 
      \ "                                                                               ~5BGP5J75PGY                         :^!!!!!!~^:       .:^~^:         :B#~ ", 
      \ "                                                                              ^BJPGB5Y5PGGY                      :?55J?!:^??J77??^ .^~~:.            .G#? ", 
      \ "                                                                             .P#55BG5#PP#5:                     !BP:~:~. ~..~ .7PG5!.                 Y#P ", 
      \ "                                                                             J##BJ?JJJ!!^                       PB~:~.7 ^^^^.7JJ! JG.                 ?#B:", 
      \ "                                                                            ^B#B^                               ~BJ!7..7! ^7J!~^.^5P                 ^G#P.", 
      \ "                                                                            Y##Y             .::.                JJYP77~~~^Y? 77JP#P.           .^!JP#BY. ", 
      \ "                                                                           :B##?           ~5BBBGY:             .J!7?YGP55Y5J7J?PB##GY?.    :~?5GBBPY7:   ", 
      \ "                                                                           !#B#?           G######G:          .^^7YJ77?PJJG5JYYJ7^7B###~^7YGBGPJ7^.       ", 
      \ "                                                                           7###5!!^:       !B#BBBB#P.        :!:~^5P?7J77JGYY?:::^7####GG5J!^.            ", 
      \ "                                                                           .YG#####B5!!~:   5#BBBBBB^         ^^~^J5YJ?77YPJ:.^!J5PPY?~:.                 ", 
      \ "                                                                             .!P########BP5YB#BB#PJ!            :^~????7?PGY5PPY?~:                       ", 
      \ "                                                                               .!?5PB##B#####BBBBBBB5??!.            ^^~^.!7^.                            ", 
      \ "                                                                                    .J#BBB###BBBBB######G!                                                ", 
      \ "                                                                                     ~####G5B######BB##B#B:                                               ", 
      \ "                                                                                     .P#B5777Y5PGGB#BBB###G!                                              ", 
      \ "                                                                                    .7G#GY?YYJJJ?7J5#G^Y####5^                                            ", 
      \ "                                                                                   7G##B#B!~~BPJY5YP#J  ~5####P!                                          ", 
      \ "                                                                                  :B#BB#BJ!!7^~ J####^    ^5####Y:                                        ", 
      \ "                                                                                   J##B#P~~!GY:.G#B#Y       !G###B7                                       ", 
      \ "                                                                                .JGBBBBB##BB#BJY#B##^        .~YG#&P!                                     ", 
      \ "                                                                               ^P###BBBBBB##B###B#B7            .~JG#P!.                                  ", 
      \ "                                                                             :7B#BBBBBBBBBBBBBBB##~                 ^P#GY~                                ", 
      \ "                                                                           ~YB##BBBBBBBBBBBBBBBBB#~                  .!BYGP7:                             ", 
      \ "                                                                         ~P###BBBBBBBBBBBBBBBBBB#B:                    ~ .~!!.                            ", 
      \ "                                                                       .Y###BBBB#####BBBBBBBBBBB#Y                                                        ", 
      \ "                                                              !Y5?.^7?!!B#BB#####BP5PB#BBBBBBBB#B:                                                        ", 
      \ "                                                            ^5####B######B###BB?^..^G#BBBBBBBB##!                                                         ", 
      \ "                                                          !5B####BPGB#####GY!:: :JGB#BBBBBBBBB#5                                                          ", 
      \ "                                                         ?#####GJ: .:~?YJ~.     P&##B#BBBBBBB#B:                                                          ", 
      \ "                                                        .G###P~                 JPJ~:J#BBB####!                                                           ", 
      \ "                                                         ~YY!                        ~##B##GGJ          .  .  .   .  .                 .                  ", 
      \ "                                                                                     ?####Y    YY .P7 ^Y75~?5!?:5J7..75Y!!P7P^JY:5Y? :Y!?~ ?5^ J5~P7!P?~  ", 
      \ "                                                                                     :YGB5.    YY .P?~~P75!.5Y..PJ7: .P? 7P7G^JY^J5Y :5?Y!!JYP:?JJP7!P?!  ", 
      \ "                                                                                       .:      ..  ...  .       ...   .. .. . .. ..    .. .  ...  ......  ", 
      \ ]
