if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

setlocal foldmethod=syntax
setlocal foldlevel=1

" Generate \emph{}
map EM i\emph{}<Esc>i
" Generate \emph{}
map EW bi\emph{<Esc>ea}
map CC 0i\sumit{<Esc>$bea}<Esc>o
"make a text a section heading in latex
map S 0i\section{<Esc>$bea}<Esc>o
map SS 0i\subsection{<Esc>$bea}<Esc>o
map SSS 0i\subsubsection{<Esc>$bea}<Esc>o
map P 0i\paragraph{<Esc>$bea}<Esc>
map BE 0dwi\begin{<Esc>pa}\end{<Esc>pa}<Esc>O
map IT i\item[]<Esc>i

"Make a paragraph a note by Sumit
map NT o\note[SR]{}<Esc>i

" comment the line
vmap CM :s/^/%/
