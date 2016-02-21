if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

setlocal cindent
" For multi line statement align with the starting (See :h cinoptions-values)
setlocal cinoptions+=(0
setlocal cinoptions+=}0
" Search for comment start upto n lines
setlocal cinoptions+=*120
setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=80
setlocal foldmethod=syntax foldlevel=8
set noexpandtab nospell

let java_mark_braces_in_parens_as_errors=1

" add javaid.vim to ~/.vim/syntax
let java_highlight_all=1
" or set highlighting for individual packages
"let java_highlight_java_lang_ids=1
"let java_highlight_java_io=1

" Function highlighting
let java_highlight_functions="style"

" println is highlighted
let java_highlight_debug=1
let java_minlines = 50


" Change color as parenthesis are nested
hi link javaParen1 Special
hi link javaParen2 Identifier


let b:comment_start = '//'
let b:comment_end = ""
let b:extralines = []
" Can't use BufNewFile because BufNewFile triggers FileType, not the other way around.
" http://stackoverflow.com/questions/23496243/autocommand-for-new-file-of-specific-filetype
if !filereadable(expand('%'))
  " BufNewFile
	call MyLibs#AddFooter(b:extralines,b:comment_start,b:comment_end)
endif
nnoremap <unique> ml :call MyLibs#AddFooter(b:extralines,b:comment_start,b:comment_end)<CR>

