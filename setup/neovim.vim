

" _   _         __     ___           
"| \ | | ___  __\ \   / (_)_ __ ___  
"|  \| |/ _ \/ _ \ \ / /| | '_ ` _ \ 
"| |\  |  __/ (_) \ V / | | | | | | |
"|_| \_|\___|\___/ \_/  |_|_| |_| |_|
"                                    

syntax on
if has('termguicolors')
  set termguicolors
endif

" SIGNNATURE
let g:SignatureMarkOrder="⏾\m"
let g:SignatureMarkTextHL="Constant"
" autocmd BufReadPost * call signature#sign#Refresh() | call signature#mark#Purge("all")

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
set sw=2
set ts=2
set expandtab
set smartindent
set guicursor=n-v:block-Cursor,i:ver90-Cursor
set scrolloff=10
set backspace=indent,eol,start
set splitright
set splitbelow
set hidden
set scl=yes
set laststatus=3
set foldlevel=0
set foldclose=all 
" set foldcolumn=1 
set foldenable 
set viewoptions-=curdir
set cursorline

set nowrap
set mouse=
set clipboard=unnamed

set pumheight=20
set pumblend=7
set nohlsearch
" set winbar=%=%m\ %t

inoremap <c-a> <esc><Cmd>call search('}\\|)\\|]\\|"\\|>\\|\%x27', "ez", line("."))<cr>a
inoremap <c-h> <left>
inoremap <c-l> <right>
inoremap <c-p> <c-o>p

nnoremap <leader>i ciw
nnoremap <leader>; :
nnoremap <leader>w <C-w>
nnoremap <leader>q <C-w>c
nnoremap a $a
" nnoremap <leader>r <cmd>nohlsearch<cr> | diffupdate<cr> | syntax sync fromstart<cr><cl>
nnoremap <left> <cmd>vertical resize-5<CR>
nnoremap <right> <cmd>vertical resize+5<CR>
nnoremap J 3<c-e>3j
nnoremap K 3<c-y>3k
nnoremap <leader>e <cmd>e #<cr>
nnoremap n nzz
nnoremap N Nzz
nnoremap 0 ^
nnoremap <cr> $
nnoremap <leader>z <cmd>call <SID>Myfold()<cr>
nnoremap U u
nnoremap <leader>j <cmd>cnext!<cr>
nnoremap <leader>k <cmd>cNext!<cr>
nnoremap p p=`]
nnoremap <leader>. .
nnoremap ' `

cnoremap <c-j> <down> 
cnoremap <c-k> <up>

vnoremap J 3<c-e>3j
vnoremap K 3<c-y>3k
vnoremap [[ %
vnoremap <leader>j J


autocmd BufReadPost * 
	\ if line("'\"") > 1 && line("'\"") <= line("$") | 
	\ exe "normal! g`\"zz0" |
	\ endif

function s:Myfold()
    if foldlevel(line("."))==0
        exec "normal! zfi}"
    else
        exec "normal! zd"
    endif
endfunction

function! <SID>GotoPattern(pattern, dir) range
    let g:_saved_search_reg = @/
    let l:flags = "We"
    if a:dir == "b"
        let l:flags .= "b"
    endif
    for i in range(v:count1)
      call search(a:pattern, l:flags, line("."))
    endfor
    let @/ = g:_saved_search_reg
endfunction
" nnoremap <silent> w :<C-U>call <SID>GotoPattern('\(^\\|\<\)[A-Za-z0-9_]', 'f')<CR>
nnoremap <silent> e :<C-U>call <SID>GotoPattern('\(^\\|\<\)[A-Za-z0-9_]', 'b')<CR>
nnoremap <silent> w <cmd>call <SID>GotoPattern('[A-Za-z0-9_]\(\>\\|$\)', 'f')<CR>
