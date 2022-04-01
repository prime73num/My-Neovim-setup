

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
set guicursor=n-v:block-Cursor,i:ver90-Cursor
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
	\ exe "normal! g`\"zz0" |
	\ endif

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
nnoremap a $a
cnoremap <c-n> <down> 
cnoremap <c-p> <up>
nnoremap <leader>r :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><cl>
nnoremap <left> :vertical resize-5<CR>
nnoremap <right> :vertical resize+5<CR>
nnoremap J 4<c-d>
nnoremap K 4<c-u>
nnoremap ee :b #<cr>
nnoremap n nzz
nnoremap N Nzz
nnoremap I ea
nnoremap <cr> ^

vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv

nnoremap [[ %
vnoremap [[ %

inoremap ww <esc>/['"})\]]<cr>:nohlsearch<cr>a
nnoremap <silent><leader><leader>s :w \| so % \| source $HOME/.config/nvim/setup/vim-plug.vim \| source $HOME/.config/nvim/setup/neovim.vim \| source $HOME/.config/nvim/plug-config/init.vim \| lua require "user.init"<cr>
