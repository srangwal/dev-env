"---------- Some strings of importance should be highlighted ----------
" [NOTE]: Use match rather than syntax match because
" match has higher precedence. Therefore, overrides syntax
" highlighting settings.
" [TODO]: better selection of highlighting group;

" It should be an autocmd since colorscheme generally erase all hi
autocmd ColorScheme * hi MyItalic term=italic cterm=italic gui=italic

" '\\*\\*.*\\*\\*' means anything with ** around it should be in bold face;
"\   '\\[\\w\\+\\]:'          : 'Question'     ,
  let b:special_words = {
\   '\\[caveat\\]:'          : 'Todo'         ,
\   '\\[todo\\]:'            : 'Todo'         ,
\   '\\[imp\\]:'             : 'Todo'         ,
\   '\\[ask\\]:'             : 'Todo'         ,
\   '\\[note\\]:'            : 'Question'     ,
\   '\\[notes\\]:'           : 'Question'     ,
\   '\\[info\\]:'            : 'Question'     ,
\   '\\[req\\]:'             : 'Question'     ,
\   '\\[comments\\]:'        : 'Comment'      ,
\   'i\\.e\\.'               : 'Comment'      ,
\   'e\\.g\\.'               : 'Comment'      ,
\   'et al\\.'               : 'Comment'      ,
\   'etc\\.'                 : 'Comment'      ,
\   'Sumit'                  : 'Comment'      ,
\   'Rangwala'               : 'Comment'      ,
\   'srangwal'               : 'Comment'      ,
\   'srangwala'              : 'Comment'      ,
\   '\\*\\*.*\\*\\*'         : 'ModeMsg'      ,
\   '##.*##'                 : 'ModeMsg'      ,
\}
  for [b:word, b:group] in items(b:special_words)
    call MyLibs#AddMatch(b:word,b:group)
  endfor



