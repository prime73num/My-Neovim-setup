"
" __  __       __     ___           
"|  \/  |_   _ \ \   / (_)_ __ ___  
"| |\/| | | | | \ \ / /| | '_ ` _ \ 
"| |  | | |_| |  \ V / | | | | | | |
"|_|  |_|\__, |___\_/  |_|_| |_| |_|
"        |___/_____|                
"vim-plug
call plug#begin('~/.config/nvim/plugged')

Plug 'connorholyday/vim-snazzy'			"snazzy colorscheme
Plug 'itchyny/lightline.vim'			"statusline 
"Plug 'kyazdani42/nvim-web-devicons' 		" for file icons
"Plug 'kyazdani42/nvim-tree.lua'			
Plug 'kshenoy/vim-signature' 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'preservim/tagbar'
Plug 'lervag/vimtex'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " W
Plug 'junegunn/seoul256.vim'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'PhilRunninger/nerdtree-buffer-ops'
Plug 'mhinz/vim-startify'
Plug 'voldikss/vim-floaterm'


call plug#end()
"vim-plug
"lightline
let g:lightline = {				
      \ 'colorscheme': 'snazzy',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'charvaluehex' ] ]
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ }
"lightline

autocmd BufReadPost * 
	\ if line("'\"") > 1 && line("'\"") <= line("$") | 
	\ exe "normal! g`\"zz" |
	\ endif



" _   _         __     ___           
"| \ | | ___  __\ \   / (_)_ __ ___  
"|  \| |/ _ \/ _ \ \ / /| | '_ ` _ \ 
"| |\  |  __/ (_) \ V / | | | | | | |
"|_| \_|\___|\___/ \_/  |_|_| |_| |_|
"                                    


" Unified color scheme (default: dark)
let g:seoul256_background = 236
colo seoul256

" Switch
set background=dark


let mapleader=" "

set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set encoding=UTF-8
set nu
set nuw=3
set noshowmode
set cmdheight=1
set ignorecase
set sw=4
set ts=4
set smartindent
set guicursor=n-v-c-sm:block-Mycursor,i-ci-ve:ver90-Cursor,r-cr-o:hor20
set path=.,/usr/include,/usr/include/c++/5
set scrolloff=6
set backspace=indent,eol,start
set splitright
set splitbelow
set hidden
set nois

"hi Mycursor ctermbg=255 ctermfg=255 guibg=#00ffff guifg=#00ffff
"hi Mycursor cterm=bold ctermfg=84 gui=bold guifg=#00ffff
hi Mycursor guifg=#00FFFF guibg=#00FFFF guisp=#00FFFF
hi LineNr guifg=#A9A9A9
hi MatchParen ctermfg=0 ctermbg=49
" <++>
inoremap jj <esc>
nnoremap <leader>i ciw
nnoremap <leader>; :
nnoremap <leader>w <C-w>
nnoremap <leader>q <C-w>c
nnoremap <leader>h :-tabnext<cr>
nnoremap <leader>l :+tabnext<cr>
nnoremap <leader>t :NERDTreeToggle<cr>
nnoremap a $a
cnoremap <c-n> <down> 
cnoremap <c-p> <up>
nnoremap <leader>r :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><cl>
nnoremap <left> :vertical resize-5<CR>
nnoremap <right> :vertical resize+5<CR>
nnoremap J 5<c-d>
nnoremap K 5<c-u>
nnoremap <leader>ve :vs<cr>:e $MYVIMRC<cr>
nnoremap <leader>vs :w<cr>:source $MYVIMRC<cr>
nnoremap ee :b #<cr>
nnoremap n nzz
nnoremap N Nzz
nnoremap w e
nnoremap [[ %

inoremap ( ()<esc>i
inoremap { {}<esc>i
inoremap [ []<esc>i
inoremap ' ''<esc>i
inoremap " ""<esc>i
inoremap $ $$<esc>i
inoremap ww <esc>:call search('[)}\]">$]','e')<cr>a

" TREE
let NERDTreeQuitOnOpen=3
let NERDTreeWinSize=25
let NERDTreeMapCWD='a'
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
" you can add these colors to your .vimrc to help customizing
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "8faa54"
let s:orange = "8faa54"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb

let g:WebDevIconsDefaultFolderSymbolColor = s:beige " sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue " sets the color for files that did not match any rule


" TREE


" SIGNNATURE
let g:SignatureMarkOrder=">\m"
let g:SignatureMarkTextHL="Repeat"
" SIGNNATURE


"     _             _   _  __       
" ___| |_ __ _ _ __| |_(_)/ _|_   _ 
"/ __| __/ _` | '__| __| | |_| | | |
"\__ \ || (_| | |  | |_| |  _| |_| |
"|___/\__\__,_|_|   \__|_|_|  \__, |
"                             |___/ 



function! StartifyEntryFormat()
	return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

let g:startify_custom_indices = ['i','a', 's', 'd', 'f', 'g', 'h']
let g:startify_enable_special = 0
let g:startify_change_to_dir = 0
let g:startify_bookmarks = [ '.','~/.config/nvim/init.vim', '~/.zshrc' ]
let g:startify_custom_header =
		\ startify#pad(split(system('figlet -f larry3d "Hello(^-^) PG12138"'), '\n'))
let g:startify_lists = [
	  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
	  \ { 'type': 'files',     'header': ['   MRU']            },
	  \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
	  \ { 'type': 'sessions',  'header': ['   Sessions']       },
	  \ { 'type': 'commands',  'header': ['   Commands']       },
	  \ ]


"  ____           
" / ___|___   ___ 
"| |   / _ \ / __|
"| |__| (_) | (__ 
" \____\___/ \___|
"                 
set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" <++>
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent><leader>sd :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>cn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ca  <Plug>(coc-codeaction)
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
"



"  ____               _     _     _   
" / ___|___   ___    | |   (_)___| |_ 
"| |   / _ \ / __|   | |   | / __| __|
"| |__| (_) | (__    | |___| \__ \ |_ 
" \____\___/ \___|___|_____|_|___/\__|
"               |_____|               
command! -nargs=+ -complete=custom,s:GrepArgs Rg exe 'CocList grep '.<q-args>

function! s:GrepArgs(...)
  let list = ['-S', '-smartcase', '-i', '-ignorecase', '-w', '-word',
        \ '-e', '-regex', '-u', '-skip-vcs-ignores', '-t', '-extension']
  return join(list, "\n")
endfunction

" <++>
nnoremap <silent> <Leader>gf :exe 'CocList --normal -I --input='.expand('<cword>').' grep'<CR>
nnoremap <Leader>/ :exe 'CocList --normal --ignore-case'<CR>
nnoremap <Leader>bb :exe 'CocList --normal --ignore-case buffers'<CR>
"coc-list-grep


" _____           ____             
"|_   _|_ _  __ _| __ )  __ _ _ __ 
"  | |/ _` |/ _` |  _ \ / _` | '__|
"  | | (_| | (_| | |_) | (_| | |   
"  |_|\__,_|\__, |____/ \__,_|_|   
"           |___/                  
nnoremap <silent><leader>oo :TagbarToggle<cr>

let g:tagbar_left = 1
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_width = 25
let g:tagbar_foldlevel = 0
hi TagbarScope cterm=bold ctermfg=84 gui=bold guifg=#5af78e
hi TagbarKind cterm=bold ctermfg=84 gui=bold guifg=#7fffd4


" _         _____         
"| |    __ |_   _|____  __
"| |   / _` || |/ _ \ \/ /
"| |__| (_| || |  __/>  < 
"|_____\__,_||_|\___/_/\_\
"                         
nmap <leader><leader>l :w<cr><plug>(vimtex-compile)
nmap <leader><leader>v <plug>(vimtex-view)

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

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
    additional_vim_regex_highlighting = false,
  },
}
EOF
lua <<EOF
require'nvim-treesitter.configs'.setup {
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  indent = {
    enable = false
  }
}
EOF


