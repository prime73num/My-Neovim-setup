setlocal nonu
setlocal nornu
setlocal scl=no
" setlocal statusline=%{b:floaterm_name}

nnoremap <buffer>H :FloatermPrev<cr>
nnoremap <buffer>L :FloatermNext<cr>
nnoremap <buffer>q :FloatermHide<cr>
nnoremap <buffer>x :FloatermKill<cr>
tnoremap <buffer>jj <C-\><C-n>
nnoremap <buffer><leader>n :FloatermNew<cr>
