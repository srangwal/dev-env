" File: .gvimrc
" Author: Sumit Rangwala
" Description:
" Last Modified: September 15, 2015


" [NOTE]:
"   Ubuntu
"     For vim-outliner
"       1. sudo apt-get install vim-vimoutliner
"       2. vim-addons install vimoutliner
"     Enable few other addons
"       $> vim-addons install matchit
"   Redhat and OS-X
"     Install vimoutliner manually from github


"----------VUNDLE------------
" These should at the top of .vimrc file
" We will maintain plugins with Vundle.
" Plugins are installed in .vim/bundle
" To add a plugin add it below, open vim and run :BundleInstall
" To update plugins open vim and run :BundleUpdate
" Installation: $> git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

  set nocompatible              " be iMproved, required
  filetype off                  " required

  " set the runtime path to include Vundle and initialize
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()

  " let Vundle manage Vundle, required
  Plugin 'VundleVim/Vundle.vim'

  Plugin 'tpope/vim-fugitive'
  Plugin 'tpope/vim-surround'

  Plugin 'ekalinin/Dockerfile.vim'
  Plugin 'motus/pig.vim'
  Plugin 'uarun/vim-protobuf'
  Plugin 'davidzchen/jproperties.vim'

  Plugin 'luochen1990/rainbow'
    let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

  Plugin 'flazz/vim-colorschemes'


  " All Plugins must be added before vundle#end()
  call vundle#end()            " required
  filetype plugin indent on    " required


"------------------PLATFORM TYPE-----------------------
" Use these only to set the fonts and nothing else:
" Are we using terminal vim on OS-X: !has("gui_running") && has("macunix")
" Are we using a gui on OS-X: has("gui_running") && has("macunix")
" Are we using a gui on OS-X and the gui is MacVim: has("gui_running") && has("gui_macvim")
" For every other settings it is better to check if a feature exists and then use it rather then relying on the OS to
" guess if the feature exists
  if !exists("g:os")
   if has("win64") || has("win32") || has("win16")
     let g:os = "Windows"
   else
     " Will be set to either Darwin or Linux
     let g:os = substitute(system('uname'), '\n', '', '')
     if has("gui_running")
       let g:os .= "-gui"
     endif
   endif
  endif


"----------GLOBAL SETTINGS-------------------
" [NOTE]: may be overridden in ftplugin for specific filetype
  set shell=/bin/bash         " Set the shell when you go to shell through sh command
                              " Don't set this to 'SHELL' because this variable does not
                              " get set to /bin/bash in cygwin
  "set autochdir               " Automatically cd into the directory that the file is in
  set viminfo='20,\"50        " viminfo list that specifies what to write in the viminfo file
  set fileformats=unix,dos,mac
  set nocompatible            " NEVER CHANGE THIS! Use Vim mode, not vi mode; we are in 21st century


"---- SOME IMPORTANT SETTINGS -------
  "------ SET THE LEADER --------
  let mapleader = ","
  "----- ALWAYS USE UNICODE -------
  if has("multi_byte")
    set encoding=utf-8
  endif



"---------- COLOR SCHEME -----------------------

  " We will work on darker background and 256 colors
  " Requires Plugin 'altercation/vim-colors-solarized'
  let g:solarized_termcolors=256
  " If you use a terminal emulator with a transparent background and Solarized isn't displaying the background color
  " transparently, set this to 1 and Solarized will use the default (transparent) background of the terminal emulator.
  let g:solarized_termtrans=1
  " Setting this option to high or low does use the same Solarized palette but simply shifts some values up or down in
  " order to expand or compress the tonal range displayed.
  let g:solarized_contrast="high"
  " Special characters such as trailing whitespace, tabs, newlines, when displayed using :set list can be set to one of
  " three levels depending on your needs
  let g:solarized_visibility="high"

  function SetColorScheme ()
    if !has("gui_running")
      return
    endif
    if &filetype != "votl" && &filetype != "vo_base"
      set background=dark
      colorscheme solarized
    else
      " TODO: Need to find a better darker colorscheme for vim-outliner files
      "set background=light
      "colorscheme solarized
    endif
  endfunction
  au BufEnter * call SetColorScheme()   " It is not possible to have different color scheme for different windows if multiple windows are open.
                                        " http://stackoverflow.com/questions/4543430/applying-different-colorschemes-to-different-windows


"--------- FONTS --------
  " Install fonts using
  "   (a) Synaptic
  "   (b) Google font directory  (http://code.google.com/p/googlefontdirectory/)
  "   (c) Download individual fonts from the web and copy the " ttf file of the font in ~/.fonts/ and run
  "       $> [sudo] fc-cache -vf

  if g:os == "Linux-gui"
    set guifont=Monaco\ 11
    set guifont=Inconsolata\ 13

  elseif g:os == "Darwin-gui"
    set guifont=Monaco:h15
    set guifont=Consolas:h15
    set guifont=Inconsolata:h15

  endif



"
""-----------UTILITY FUNCTIONS-----------------------------------
"  " Defined in .vim/autoload/MyLibs.vim  see :h write-library-script for details
"


"--------------FORMATTING-------------
  set bs=2                " backspace 0, 1 or 2; what <BS> can do in Insert mode
  set shiftwidth=2        " shiftwidth  number of spaces used for each step of (auto)indent (local to buffer)
  set tabstop=2           " tabstop - how many columns should the cursor move for one tab
  set softtabstop=2       " This makes the backspace key treat the four spaces like a tab (so one backspace goes back a full 2 spaces).
  set expandtab           " always expands tab to spaces
  set nojoinspaces        " Don't add two spaces after '.' when lines are joined using "J"
  set textwidth=120       " Individual filetypes should change it in the corresponding .vim/after/ftplugin


"--------------DISPLAY-------------
  set cf                      " confirm start a dialog when a command fails
  set shortmess=st            " shortmess list of flags to make messages shorter, shm= specifies No abbreviation of message.
  set noterse
  set showcmd                 " showcmd show (partial) command keys in the status line
  set ch=1                    " Make command line one line height
  set scrolloff=3             " Show 3 lines above and below while searching
  set laststatus=2            " Show the status line even if only one file is being edited
  set wh=3                    " minimal number of lines used for the current window
  set wmh=3                   " minimal number of lines used for any window {hard limit}
  set showmatch               " show matching brackets When inserting a bracket, briefly jump to its match
  set mat=3                   " tenth of a second to show a match for 'showmatch'
  set matchpairs=(:),{:},[:]  " list of pairs that match for the "%" command (local to buffer)
  set lbr                     " wrap long lines at a character in 'breakat' (local to window)
  set brk=\ \ !@*+_;:,.?      " breakat which characters might cause a line break
  set sbr=+\                  " string to put before wrapped screen lines
  set ruler                   " Show ruler
  set stl=%m%r%h%w\ %F\ %l\ %c\ %p%%\ %P\ %L     " Format to be used for a status line
  set ww=h,l,~,b,s,<,>,[,]    " Allow specified keys to wrap to the previous/next line
                              " when the cursor is on the first/last character in the line.
  set report=0                " Always show the number of lines changed
  set virtualedit=block


"--------------SPLITTING -------------
  set sb                      " new window is put below the current one
  set splitright              " Split horizontally and place the new window above the current window
  set splitbelow
  set equalalways             " When on, all the windows are automatically made the same size after splitting or closing a window


"--------------SEARCHING-------------
  set ignorecase              " Case insensitive search (ic - ignore case )
  set hlsearch                " highlights the previously searched string
  set incsearch               " higlight search string as search pattern is entered
  set smartcase               " Smartcase i.e.,  when search pattern is typed in upper case
                              " make search case sensitive and when typed in lower case
                              " make it case insensitive

"-----------NUMBERS--------------
  set nrformats-=octal         " Never consider numbers as octal for CTRL-A/CTRL-X


"-----------DICTIONARY--------------
  set dict+=/usr/share/dict/words " list of dictionary files for keyword completion
                                  " ( CTRL_P or CTRL_N for word completion)
  set complete=.,w,b,u,t,i,d,k    " complete  specifies how Insert mode completion works (local to buffer)
  set infercase                   " adjust case of a keyword completion match (local to buffer)


"--------- VIMDIFF SETTINGS --------
  set diffopt+=iwhite

"-----TEXT COMPLETION-------------------
  set wildmenu                    " wildmenu  command-line completion shows a list of matches
  set wildmode=list,full          " wildmode  specifies how command line completion works
  set wildignore=*.o,*.obj,*.exe,*.a,*.so,*.aux,*.swp,*.zip,*/tmp*/    " wildignore  list of patterns to ignore files for file name completion


"--------MODELINES--------
  " Remember there is a security risk with modelines
  set ml              " modeline enables using settings from modelines when reading a file (local to buffer)
  set mls=5           " number of lines to check for modelines


"--------SEARCH PATH--------
  set path=.,,**      " search for file in the directory containing current file (.), then the current
                      " directory (empty text between two commas), then each directory under the current directory
                      " ('**').


"----- GUI SPECIFIC SETTINGS -------------
  if has('gui_running')
    " --------------GUI SETTINGS -------------
    set guioptions-=m             " Remove the menubar
    set guioptions-=T             " Remove the toolbar
    set guioptions-=l             " Remove the left scrollbar (don't combine options; sometimes they don't work)
    set guioptions-=L             " Remove the left scrollbar
    set guioptions-=r             " Remove the right scrollbar
    set guioptions-=R             " Remove the right scrollbar
    set guioptions-=b             " Remove the bottom scrollbar
    set guioptions-=B             " Remove the bottom scrollbar

    set lines=999 columns=999     " The only way I found to maximize the window on startup; not clean though

    " On some platforms (Mac) we have an addition option of using fullscreen with vim (this is different from gvim
    " starting with window maximized). We will add couple of commands to switch between fullscreen mode
    if has("fullscreen")
      " Command-Shift-F for fullscreen; Command-Shift-B to return back
      noremap <D-F> :set fullscreen<CR>
      noremap <D-B> :set nofullscreen<CR>
    endif


    "-----------MOUSE SETTINGS--------------
      set nomousefocus                " Do *not* activate the window when mouse is moved around
      set mousehide                   " Hide the mouse pointer while typing
      set mouse=a                     " Enable mouse in all modes
      set mousemodel=popup_setpos     " On right click popup suggested corrections


    "----------TABS----------
      set tabpagemax=20                 "Limit on number of tabs to open
      " Label tabs
      set guitablabel=%{MyLibs#GuiTabLabel()}  "Smart tabs
      " open new files in new tab
      cabbr e tab dr
  endif



"----------SPELL CHECKER--------------------
  set spell
  let spell_auto_type="tex,doc,mail"
  "let spell_filter="grep -v '^#' "
  let spell_update_time = 500
  set spellsuggest=best,5
  setlocal spell spelllang=en_us
  " Don't set spell checker for conf files
  autocmd FileType conf set nospell
  autocmd FileType vim set nospell


"---- TOHTML SETTINGS -------
  let html_use_css = 1          " generate CSS version
  let html_ignore_folding = 1   " unfold completely before generating html
  "let html_dynamic_folding = 1  " allow folding/unfolding in html; not working?



"----------BACKUP----------
  "----------ON EVERY WRITE AT DIFFERENT CLOCK HOURS----------
  set backup
  set backupskip+=~/misc/documents/
  set backupdir=~/.vim/backup           " List of directories to put backup files in. Create the directory first.
  " Issue: Two files with the same name in different directories will
  " overwrite each other. (possible solution: fnamemodify(expand("%:p:h"),":gs?/?-?:s?-??") )
  au BufWritePre * let &bex = '-' . strftime("%Y%m%d-%H") . '.vimbackup'  " setting backup extension; a new backup
                                                                          " is created if the writes are at different
                                                                          " hours
  " Add a file with the following lines in /etc/cron.monthly
  " #!/usr/bin/env bash
  " # Clear backup of last 2 to 7 months
  "
  " for i in 2 3 4 5 6 7
  " do
  "   strtosearch=`date --date="$i month ago" "+%Y%m"`
  "   rm -f /home/srangwal/.vim/backup/*${strtosearch}*
  " done



"---------OTHER MISC SETTINGS---------------
  syntax on                     " Syntax highlighting


  " Now you can use <F3> to toggle between paste mode (and no paste mode). When in paste-mode auto indent will be turned
  " off. This is very useful when pasting text that's already indented.
  set pastetoggle=<F3>

  " ---- Quick Help (Very useful) --------
  " keywordprg  program used for the "K" command; This
  " setting implies that when you put the cursor over a word
  " and then press K the command set by keywordprg will be
  " run with the word under the cursor as argument
  set keywordprg=:help

  " Indent line automatically following previous lines indentation (local to buffer)
  "set autoindent

  "------ For git difftool---------
  highlight DiffAdd cterm=none  ctermbg=Green gui=none  guibg=Green
  highlight DiffDelete cterm=none  ctermbg=Red gui=none  guibg=Red
  highlight DiffChange cterm=none  ctermbg=Yellow gui=none  guibg=Yellow
  highlight DiffText cterm=none  ctermbg=Magenta gui=none  guibg=Magenta

  "----------SHORT HANDS and ABBREVIATIONS--------------------
  " [TODO]: See if this can be done using autoload or after
  " USEFUL ABBREVIATIONS FOR SPELL CORRECTIONS
  source ~/.vim/my-rc/autocorrect.vim

  " HIGHLIGHT SPECIAL WORLDS
  source ~/.vim/my-rc/special-words.vim

  " GENERIC SHORTHANDS
  source ~/.vim/my-rc/short-hands.vim


  "----- CLIPBOARD SETTINGS ------
  " On Mac OS X and Windows, the * and + registers both point to the system clipboard so unnamed and unnamedplus have
  " the same effect: the unnamed register is synchronized with the system clipboard.
  "
  " On Linux, you have essentially two clipboards: one is pretty much the same as in the other OSes (CtrlC and CtrlV in
  " other programs, mapped to register + in Vim), the other is the "selection" clipboard (mapped to register * in Vim).
  "
  if g:os =~ 'Linux' && has('unnamedplus')
    set clipboard^=unnamedplus
  else
    set clipboard^=unnamed
  endif



"------GENERAL MAPPING---------"
  "-- [NOTE]: All mapping should be at a single place ---
  " Use <leader>space to clear search. This will remove the highlighted
  nnoremap <unique> <leader><space> :noh<cr>

  " Space (Shift-Space) in normal mode works like in a browser
  nmap <unique> <Space> <PageDown>
  nmap <unique> <S-Space> <PageUp>

  " Convert all tabs in a file to white space. Number of spaces added == current value of retab
  command TabToSpace retab
  " Convert 'tabstop' number of continuous white spaces in a file to tab
  command SpaceToTab retab!

  " Add space in the escape mode
  nmap <unique> t i<Space><Esc>

  "Allow easy scrolling in insert mode
  inoremap <unique> <C-E> <C-X><C-E>
  inoremap <unique> <C-Y> <C-X><C-Y>

  " Move around windows using Ctrl-h/j/k/l
  nnoremap <unique> <C-h> <C-w>h
  nnoremap <unique> <C-j> <C-w>j
  nnoremap <unique> <C-k> <C-w>k
  nnoremap <unique> <C-l> <C-w>l


  " Ctrl+Up Arrow to increase font; Ctrl+Down Arrow to decrease font (in normal mode)
  map <unique> <C-Up> :call MyLibs#AlterFontSize("increase")<CR>
  map <unique> <C-Down> :call MyLibs#AlterFontSize("decrease")<CR>

  " gk and gj are like k and j, except they move by display line rather than actual lines.
  nnoremap <unique> k gk
  nnoremap <unique> j gj
  nnoremap <unique> gk k
  nnoremap <unique> gj j

  if g:os =~ "Linux"
    " Ctrl+PageUp/PageDown to change tabs
    map <unique> <C-PageUp> :tabnext<CR>
    map <unique> <C-PageDown> :tabprev<CR>

  elseif g:os =~ "Darwin"
    " Command+Shift+Arrows to change tabs
    map <unique> <D-S-Right> :tabnext<CR>
    map <unique> <D-S-Left> :tabprev<CR>

  endif

  "F4 removes the ^M in a dos file
  map <F4> :%s/<C-v><CR>/\r/g<CR>

  " Detect the filetype again. Useful when new file is
  " created; set to F5 to match with refresh in browsers
  map <unique> <F5> :filetype detect<CR>

  " Toggle line formating
  map <F6> :call MyLibs#ToggleFormating()<CR>

  " ^P to follow a tag
  map  

  "----------------FOLDING----------------------
  " [NOTE]: In visual mode after selection zf = fold
  " To fold
  noremap f zc
  " to unfold recursively, use l to open by only one level
  noremap F zO


""-----------END MAPPING----------------


"[NOTE]: Since autocommands are mostly used for specific settings they should be at the end ##
"------------------AUTOCOMMANDS BEGIN---------------------

  " Don't do autocmd! It resets other settings like syntax on etc.
  "autocmd!

  " Many people like to remove any extra whitespace from the ends of lines. Here is one way to do it when saving your
  " file.
  autocmd BufWritePre * :%s/\s\+$//e

  "---- Syntax highlighting for gradle ----
  au BufNewFile,BufRead *.gradle setf groovy

  "-------Gnuplot files-------
  au BufNewFile,BufRead *.gp      set noautoindent textwidth=220

  " [NOTE]:  Filetype specific settings should be added to respective file in .vim/after/ftplugin/

"------------------AUTOCOMMANDS END---------------------


" Use this only when needed
"-----------VERBOSE SETTINGS (FOR DEBUGGING) --------------
  " Set on the verbose mode and direct messages to a file for
  " debugging. Increase the number and view the verbosefile to
  " see a wealth of information

  "set verbose=2
  "set verbosefile=~/.vim/verbose-file


"TODOs:
" - All map (and abbr) should have a <unique>, i.e., map <unique> DQ ..
"
" -  Write a function to do this
"  21 if !hasmapto('<Plug>TypecorrAdd')
"  22   map <unique> <Leader>a  <Plug>TypecorrAdd
"  23 endif
" This checks if a mapping to "<Plug>TypecorrAdd" already exists, and only
" defines the mapping from "<Leader>a" if it doesn't.  The user then has a
" chance of putting this in his vimrc file: >


" vim: set ts=2 sw=2 sts=2 tw=120:
