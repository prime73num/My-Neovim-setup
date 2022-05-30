setlocal nonu
setlocal nornu
setlocal scl=no
" setlocal statusline=%{b:floaterm_name}

nnoremap <buffer>H :FloatermPrev<cr>
nnoremap <buffer>L :FloatermNext<cr>
nnoremap <buffer>q :FloatermHide<cr>
nnoremap <buffer>x :call <SID>Mykill()<cr>
tnoremap <buffer>jj <C-\><C-n>
nnoremap <buffer><leader>n :FloatermNew<cr>

function s:Mykill()
    let a = bufnr()
    exe "FloatermPrev"
    exe a.."FloatermKill"
    echo "Kill the terminal!"
endfunction
