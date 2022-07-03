
" _         _____
"| |    __ |_   _|____  __
"| |   / _` || |/ _ \ \/ /
"| |__| (_| || |  __/>  <
"|_____\__,_||_|\___/_/\_\
"

let g:tex_flavor = "latex"
let g:vimtex_enabled = 1
let g:vimtex_mappings_enabled = 0
let g:vimtex_quickfix_enabled = 0
let g:vimtex_view_enabled = 1
let g:vimtex_view_automatic = 1

let g:vimtex_view_method = 'skim'
let g:vimtex_view_skim_sync = 1
let g:vimtex_view_skim_activate = 0

let g:vimtex_indent_enaled = 0
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
let g:vimtex#re#neocomplete =
      \ '\v\\%('
      \ .  '%(\a*cite|Cite)\a*\*?%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \ . '|%(\a*cites|Cites)%(\s*\([^)]*\)){0,2}'
      \     . '%(%(\s*\[[^]]*\]){0,2}\s*\{[^}]*\})*'
      \     . '%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \ . '|bibentry\s*\{[^}]*'
      \ . '|%(text|block)cquote\*?%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \ . '|%(for|hy)\w*cquote\*?\{[^}]*}%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \ . '|defbibentryset\{[^}]*}\{[^}]*'
      \ . '|\a*ref%(\s*\{[^}]*|range\s*\{[^,}]*%(}\{)?)'
      \ . '|hyperref\s*\[[^]]*'
      \ . '|includegraphics\*?%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \ . '|%(include%(only)?|input|subfile)\s*\{[^}]*'
      \ . '|([cpdr]?(gls|Gls|GLS)|acr|Acr|ACR)\a*\s*\{[^}]*'
      \ . '|(ac|Ac|AC)\s*\{[^}]*'
      \ . '|includepdf%(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|includestandalone%(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|%(usepackage|RequirePackage|PassOptionsToPackage)%(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|documentclass%(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|begin%(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|end%(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|\a*'
      \ . ')'


" Latex Keymap
nmap <buffer><leader><leader>l :w<cr>:VimtexCompile<cr>
nmap <buffer><leader><leader>v <plug>(vimtex-view)

