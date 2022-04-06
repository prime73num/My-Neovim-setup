

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
set scrolloff=20
set backspace=indent,eol,start
set splitright
set splitbelow
set hidden
set scl=yes
set laststatus=3
set foldlevel=0
set foldclose=all 
set foldcolumn=1 
set foldenable 
set viewoptions-=curdir

let g:lightline = {				
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'filetype', 'filename', 'modified', 'absolutepath', 'percent' ] ]
      \ },
      \ }

autocmd BufReadPost * 
	\ if line("'\"") > 1 && line("'\"") <= line("$") | 
	\ exe "normal! g`\"zz0" |
	\ endif
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

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
nnoremap J 3j
nnoremap K 3k
nnoremap ee :b #<cr>
nnoremap n nzz
nnoremap N Nzz
nnoremap I ea
nnoremap <cr> ^
nnoremap <leader>z :call Myfold()<cr>

vnoremap J 4j
vnoremap K 4k

nnoremap [[ %
vnoremap [[ %

inoremap ww <esc>/\%<c-r>=line('.')<cr>l['"})\]]<cr>:nohlsearch<cr>a
nnoremap <silent><leader><leader>s :w \| so % \| source $HOME/.config/nvim/setup/vim-plug.vim \| source $HOME/.config/nvim/setup/neovim.vim \| source $HOME/.config/nvim/plug-config/init.vim \| lua require "user.init"<cr>


function Myfold()
    if foldlevel(line("."))==0
        exec "normal! zfi}"
    else
        exec "normal! zd"
    endif
endfunction

