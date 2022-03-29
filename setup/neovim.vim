

" _   _         __     ___           
"| \ | | ___  __\ \   / (_)_ __ ___  
"|  \| |/ _ \/ _ \ \ / /| | '_ ` _ \ 
"| |\  |  __/ (_) \ V / | | | | | | |
"|_| \_|\___|\___/ \_/  |_|_| |_| |_|
"                                    


let mapleader=" "
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set encoding=UTF-8
set nu rnu
set nuw=3
set showmode
set cmdheight=1
set ignorecase
set sw=4
set ts=4
set expandtab
set smartindent
set guicursor=n-v:block-Mycursor,i:ver90-Cursor
set path=.,/usr/include,/usr/include/c++/5
set scrolloff=6
set backspace=indent,eol,start
set splitright
set splitbelow
set hidden
set scl=yes
"lightline
let g:lightline = {				
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'absolutepath', 'percent' ] ]
      \ },
      \ }
"lightline

autocmd BufReadPost * 
	\ if line("'\"") > 1 && line("'\"") <= line("$") | 
	\ exe "normal! g`\"zz" |
	\ endif

"hi Mycursor ctermbg=255 ctermfg=255 guibg=#00ffff guifg=#00ffff
"hi Mycursor cterm=bold ctermfg=84 gui=bold guifg=#00ffff


" NERDTree
let NERDTreeQuitOnOpen=3
let NERDTreeChDirMode=2
let NERDTreeWinSize=25
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
let g:SignatureMarkOrder="\m"
let g:SignatureMarkTextHL="TagbarKind"
" SIGNNATURE

"  Neovim Keymap
inoremap jj <esc>
nnoremap <leader>i ciw
nnoremap <leader>; :
nnoremap <leader>w <C-w>
nnoremap <leader>q <C-w>c
nnoremap <leader>h :-tabnext<cr>
nnoremap <leader>l :+tabnext<cr>
nnoremap <leader>t :NERDTreeCWD<cr>
nnoremap <leader><leader>s :w<cr>:source $HOME/.config/nvim/plug-config/init.vim<cr>:lua require 'user.init'<cr>
nnoremap a $a
cnoremap <c-n> <down> 
cnoremap <c-p> <up>
nnoremap <leader>r :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><cl>
nnoremap <left> :vertical resize-5<CR>
nnoremap <right> :vertical resize+5<CR>
nnoremap J 2<c-d>
nnoremap K 2<c-u>
nnoremap ee :b #<cr>
nnoremap n nzz
nnoremap N Nzz
nnoremap I eli


nnoremap [[ %
vnoremap [[ %
nnoremap c ci

inoremap ww <esc>/['"})\]]<cr>:nohlsearch<cr>a
