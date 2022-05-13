

" _   _         __     ___           
"| \ | | ___  __\ \   / (_)_ __ ___  
"|  \| |/ _ \/ _ \ \ / /| | '_ ` _ \ 
"| |\  |  __/ (_) \ V / | | | | | | |
"|_| \_|\___|\___/ \_/  |_|_| |_| |_|
"                                    

if !exists("g:mycount")
  let g:mycount = 1
  syntax on
  set background=dark
  let g:seoul256_background = 235
  colorscheme seoul256
  let g:seoul256_srgb = 1
endif

" SIGNNATURE
let g:SignatureMarkOrder="\m"
let g:SignatureMarkTextHL="TagbarKind"

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
set cursorline
set nowrap

"  Neovim Keymap
inoremap jj <esc>
inoremap // <esc>/\%<c-r>=line('.')<cr>l['"})\]]<cr>:nohlsearch<cr>a

nnoremap <leader>i ciw
nnoremap <leader>; :
nnoremap <leader>w <C-w>
nnoremap <leader>q <C-w>c
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
nnoremap <leader>z :call <SID>Myfold()<cr>
nnoremap U %
nnoremap } :cnext<cr>
nnoremap { :cNext<cr>

vnoremap J 3j
vnoremap K 3k
vnoremap [[ %
vnoremap <leader>j J



autocmd BufReadPost * 
	\ if line("'\"") > 1 && line("'\"") <= line("$") | 
	\ exe "normal! g`\"zz0" |
	\ endif
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" augroup Terminal
"   autocmd TermOpen * setlocal statusline=%{b:term_title}
"   autocmd TermOpen * setlocal nonu nornu scl=no
" augroup END

function s:Myfold()
    if foldlevel(line("."))==0
        exec "normal! zfi}"
    else
        exec "normal! zd"
    endif
endfunction

