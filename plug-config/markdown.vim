

nnoremap <silent>mt :call Toggle()<cr>

function Toggle()
	let line1 = search('<!-- Table -->','bn')+2
	let k = getline(line1)
	if k[0] == '|'
		call UnTable()
	else
		call ToTable()
	endif
endfunction

function ToTable()
	let line1 = search('<!-- Table -->','bn')+1
	let line2 = search('<!-- Table -->','n')-1
	call MyToTable(line1, line2)
endfunction
function UnTable()
	let line1 = search('<!-- Table -->','bn')+2
	exe line1.",".line1."d"
	let line1 = line1-1
	let line2 = search('<!-- Table -->','n')-1
	call MyUnTable(line1, line2)
endfunction

function MyToTable(line1, line2)
	let i = a:line1
	let max = -1
    while i <= a:line2
        let k = getline(i)
		let sp = split(k, "  ")
		if len(sp) > max
			let max = len(sp)
		endif
		let newline = join(sp, " | ")
		let newline = "| ".newline." |"
		call setline(i,newline)
		let i=i+1
    endwhile
	let k = 0
	let align = "|"
	while k < max
		let align = align." ---- |"
		let k += 1
	endwhile
	call append(a:line1, align)
endfunction

function MyUnTable(line1, line2)
	let i = a:line1
    while i <= a:line2
        let k = " ".getline(i)." "
		let sp = split(k, " | ")
		let newline = join(sp, "  ")
		call setline(i,newline)
		let i=i+1
    endwhile
endfunction

let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 1
let g:mkdp_open_ip = '127.0.0.1'
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 1
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0,
    \ 'toc': {}
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = '12345'
let g:mkdp_page_title = '「${name}」'
let g:mkdp_filetypes = ['markdown']
let g:mkdp_theme = 'dark'
