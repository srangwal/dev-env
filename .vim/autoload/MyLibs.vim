" MyLibs.vim: Utils functions
"
" Maintainer:	Sumit Rangwala
" Authors:	Sumit Rangwala (srangwal@gmail.com)
" Version:	1
" Date:		May 9, 2013


"---------- Basic functions to insert text ----------
function! MyLibs#InsertLine(linetext)
	call MyLibs#Insert(a:linetext, '')
endfunction

function! MyLibs#InsertText(linetext)
	call MyLibs#Insert(a:linetext, '')
endfunction

function! MyLibs#Insert(linetext, lineend)
	execute "normal! i" . a:linetext . a:lineend
endfunction



"---------- Basic functions to add footer ----------
" Note: comment_start and comment_end are string to start and end a comment
let s:footer = " vim: set ts=4 sw=4 sts=4 tw=120: "
function! MyLibs#AddFooter(linelist, comment_start, comment_end)
	" First add the lines given as argument
	echo a:comment_start
	for line in a:linelist
		call MyLibs#InsertLine(a:comment_start . a:linetext . a:comment_end)
	endfor

	" No newline since this is the last line
	call MyLibs#InsertText(a:comment_start . s:footer . a:comment_end)

	" Go to the start of the file
	normal! gg
endfunction


"---------- A function to add abbreviations ----------
"- If rhs_list has more than one element the second
"- element is considered the plural value of for the
"- abbreviation
function! MyLibs#AddAbbr(lhs, rhs_list)
	if len(a:rhs_list) == 0
		return
	endif

	" Check if abbreviation is already defined; inform accordingly
	if maparg(a:lhs, 'i', 1) != "" && maparg(a:lhs, 'i', 1) != a:rhs_list[0]
		echom a:lhs . " is already defined to " . maparg(a:lhs, 'i', 1) . " New rhs ". a:rhs_list[0]
		return
	endif


	" Set abbreviation for both lowercase and lettercase
	exec "iabbr" . " " . a:lhs . " " . a:rhs_list[0]
	let l:lhs_lettercase = substitute(a:lhs,"\\([a-z]\\)\\(.*\\)", "\\U\\1\\E\\2", "")
	let l:rhs_lettercase = substitute(a:rhs_list[0],"\\([a-z]\\)\\(.*\\)", "\\U\\1\\E\\2", "")
	exec "iabbr" . " " . l:lhs_lettercase . " " . l:rhs_lettercase

	" If plural value is given set for both lowercase and lettercase
	if len(a:rhs_list) == 2
		exec "iabbr" . " " . a:lhs . "s" . " " . a:rhs_list[1]
		let l:rhs_lettercase = substitute(a:rhs_list[1],"\\([a-z]\\)\\(.*\\)", "\\U\\1\\E\\2", "")
		exec "iabbr" . " " . l:lhs_lettercase . "s" . " " . l:rhs_lettercase
	endif
	return
endfunction


"---------- A function to set display settings for specified words ----------
" [TODO]: Escape all special characters. Change the case
" of the first alphabet rather than the first element of
" word
function! MyLibs#AddMatch(word, group)
	if len(a:word) == 0
		return
	endif

	" [TODO]: Check if match is already defined

	let l:word = tolower(a:word)

	" Set abbreviation for both lowercase and lettercase
	exec "let m = matchadd(\"" . a:group . "\",\"" . l:word . "\")"
	exec "let m = matchadd(\"" . a:group . "\",\"" . toupper(l:word) . "\")"
	let l:word_lettercase = substitute(tolower(l:word),"\\(\W*\\)\\(\w\\)\\(.*\\)", "\\1\\U\\2\\E\\3", "")
	exec "let m = matchadd(\"" . a:group . "\",\"" . l:word_lettercase . "\")"

	return
endfunction


"---------- A function to selectively change a highlighting group ----------
" Thanks ib. http://stackoverflow.com/questions/5172323/extending-a-highlighting-group-in-vim
function! MyLibs#ExtendHighlight(group, base, add)
		let base_hi = ''
		redir => base_hi
		try
				silent execute 'highlight ' . a:base
		finally
				redir END
		endtry
		let group_hi = split(base_hi, '\n')[0]
		let group_hi = substitute(group_hi, '^' . a:base . '\s\+xxx', '', '')
		silent execute 'highlight ' . a:group . group_hi . ' ' . a:add
endfunction


"---------- A function to increase/decrease the font size ----------
function! MyLibs#AlterFontSize(direction)
	let l:currentfont = substitute(&guifont, ' ', '\\ ', "")
	if (a:direction == "increase")
		let l:newfont = substitute(l:currentfont,'\(\d\+\)', '\=submatch(1) + 1', "")
	else
		let l:newfont = substitute(l:currentfont,'\(\d\+\)', '\=submatch(0) - 1', "")
	endif
  exec "set guifont=" . l:newfont
endfunction


"---------- Better Guilabels -------------
function! MyLibs#GuiTabLabel()
	let label = ''
	let bufnrlist = tabpagebuflist(v:lnum)

	" Add '+' if one of the buffers in the tab page is modified
	for bufnr in bufnrlist
		if getbufvar(bufnr, "&modified")
			let label = '+'
			break
		endif
	endfor

	" Append the number of windows in the tab page if more than one
	let wincount = tabpagewinnr(v:lnum, '$')
	if wincount > 1
		let label .= wincount
	endif
	if label != ''
		let label .= ' '
	endif

	" Append the buffer name
	return label . bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
endfunction


"-------- Toggle between current text width and very high text width ------
function MyLibs#ToggleFormating()
  if &textwidth < 20000
    let b:tw=&textwidth
    let &textwidth=20000
  else
    let &textwidth=b:tw
  endif
endfunction
