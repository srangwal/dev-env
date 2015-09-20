if exists("b:did_ftplugin")
    finish
endif
let b:did_ftplugin = 1

setlocal smartindent tw=80 ts=4 nospell

" The following line sets the smartindent mode for *.py files. It means that
" after typing lines which start with any of the keywords in the list (i.e.,
" def, class, if, etc) the next line will automatically indent itself to the
" next level of indentation:
setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class


let b:comment_start = '#'
let b:comment_end = ""
let b:extralines = []
" Can't use BufNewFile because BufNewFile triggers FileType, not the other way around.
" http://stackoverflow.com/questions/23496243/autocommand-for-new-file-of-specific-filetype
if !filereadable(expand('%'))
  " BufNewFile
	call MyLibs#AddFooter(b:extralines,b:comment_start,b:comment_end)
endif

" This file might contain unicode characters
" vim: set ts=4 sw=4 sts=4 tw=60:
