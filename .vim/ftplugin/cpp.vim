if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

setlocal cindent nospell formatoptions+=ro
setlocal tw=80 cinkeys+=!^I
setlocal keywordprg=man foldmethod=syntax
setlocal ts=4 sts=4 sw=4 expandtab


let b:comment_start = '/*'
let b:comment_end = "*/"
let b:extralines = []
" Can't use BufNewFile because BufNewFile triggers FileType, not the other way around.
" http://stackoverflow.com/questions/23496243/autocommand-for-new-file-of-specific-filetype
if !filereadable(expand('%'))
  " BufNewFile
	call MyLibs#AddFooter(b:extralines,b:comment_start,b:comment_end)
endif
nnoremap <unique> ml :call MyLibs#AddFooter(b:extralines,b:comment_start,b:comment_end)<CR>
