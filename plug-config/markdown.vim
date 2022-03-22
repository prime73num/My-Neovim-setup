

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

