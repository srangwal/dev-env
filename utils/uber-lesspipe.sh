#! /bin/bash

# Prerequisite:
#    Mac:
#      $> brew install lesspipe
#      $> brew install source-highlight
#      $> brew install highlight
#    Ubuntu:
#      $> sudo apt-get install source-highlight
#      $> sudo ln -s /usr/bin/lesspipe /usr/bin/lesspipe.sh
#      $> sudo apt-get install highlight
#    Redhat:
#      $> sudo yum install source-highlight
#      $> sudo yum install highlight
#
# Usage:
#    1. Add this file in a directory in your PATH (e.g., ~/utils/)
#    2. Add these lines to .bashrc
#      [ -x ~/utils/uber-lesspipe.sh ] && export LESSOPEN="| ~/utils/uber-lesspipe.sh %s"
#      # Set default less options
#      export LESS=" -gFJQRsXW "

[[ -z $PLATFORM ]] && PLATFORM=$(python -mplatform | tr '[:upper:]' '[:lower:]'| egrep -o 'ubuntu|redhat|darwin')

case "${PLATFORM}" in
  darwin)
    LESSDIR=$(brew --prefix)/bin
    SHLESSDIR=$(brew --prefix)/bin
    ;;
  ubuntu)
    LESSDIR=/usr/bin
    SHLESSDIR=/usr/share/source-highlight
    ;;
  redhat)
    LESSDIR=/usr/bin
    SHLESSDIR=/usr/bin
    ;;
esac

for source in "$@"; do
  case $source in
    # Get this list with
    #   $> egrep -o '\*.*\)'  /usr/bin/lesspipe | head -n # -2 | tr ')|' '  '  |xargs
    *.a|*.arj|*.tar.bz2|*.bz|*.bz2|*.deb|*.udeb|*.ddeb|*.doc|*.gif|*.jpeg|*.jpg|*.pcd|*.png|*.tga|*.tiff|*.tif|*.iso|*.bin|*.raw|*.lha|*.lzh|*.tar.lz|*.tlz|*.lz|*.tar.lzma|*.lzma|*.pdf|*.rar|*.r[0-9][0-9]|*.rpm|*.tar.gz|*.tgz|*.tar.z|*.tar.dz|*.tar.xz|*.txz|*.xz|*.gz|*.z|*.dz|*.tar|*.jar|*.war|*.ear|*.xpi|*.zip|*.7z|*.zoo)
      ${LESSDIR}/lesspipe.sh "$source"
      ;;

    *.abap4|*.abp|*.abnf|*.actionscript|*.as|*.ada|*.a|*.adb|*.ads|*.gnad|*.agda|*.ampl|*.dat|*.run|*.amtrix|*.hnd|*.s4|*.s4h|*.s4t|*.t4|*.applescript|*.arc|*.arm|*.ascend|*.a4c|*.asp|*.asa|*.aspect|*.was|*.wud|*.assembler|*.asm|*.ats|*.dats|*.autohotkey|*.ahk|*.autoit|*.au3|*.avenue|*.awk|*.bat|*.cmd|*.bbcode|*.bibtex|*.bib|*.bison|*.y|*.blitzbasic|*.bb|*.bms|*.bnf|*.boo|*.c|*.c++|*.cc|*.cpp|*.cxx|*.h|*.hh|*.hpp|*.hxx|*.chill|*.chl|*.clean|*.icl|*.clearbasic|*.cb|*.clipper|*.clojure|*.clp|*.cobol|*.cbl|*.cob|*.coldfusion|*.cfc|*.cfm|*.csharp|*.cs|*.css|*.d|*.diff|*.patch|*.dylan|*.ebnf|*.eiffel|*.e|*.se|*.erlang|*.erl|*.hrl|*.euphoria|*.eu|*.ew|*.ex|*.exw|*.wxu|*.express|*.exp|*.fame|*.inp|*.felix|*.flx|*.fortran77|*.f|*.for|*.ftn|*.fortran90|*.f90|*.f95|*.frink|*.fsharp|*.fs|*.fsx|*.go|*.graphviz|*.dot|*.haskell|*.hs|*.haxe|*.hx|*.hcl|*.html|*.htm|*.xhtml|*.httpd|*.icon|*.icn|*.idl|*.idlang|*.inc_luatex|*.informix|*.4gl|*.ini|*.innosetup|*.iss|*.interlis|*.ili|*.io|*.jasmin|*.j|*.java|*.groovy|*.grv|*.js|*.jsp|*.ldif|*.lhs|*.lilypond|*.ly|*.lindenscript|*.lsl|*.lisp|*.cl|*.clisp|*.el|*.lsp|*.sbcl|*.logtalk|*.lgt|*.lotos|*.lotus|*.ls|*.lua|*.luban|*.lbn|*.make|*.mak|*.mk|*.maple|*.mpl|*.matlab|*.m|*.maya|*.mel|*.mercury|*.miranda|*.mod2|*.def|*.mod|*.mod3|*.i3|*.m3|*.modelica|*.mo|*.ms|*.mssql|*.nasal|*.nas|*.nbc|*.nemerle|*.n|*.netrexx|*.nrx|*.nice|*.nsis|*.nsi|*.nxc|*.oberon|*.ooc|*.objc|*.ocaml|*.ml|*.mli|*.octave|*.oorexx|*.os|*.oz|*.paradox|*.sc|*.pas|*.perl|*.cgi|*.perl|*.pl|*.plex|*.plx|*.pm|*.php|*.php3|*.php4|*.php5|*.php6|*.pike|*.pmod|*.pl1|*.bdy|*.ff|*.fp|*.fpp|*.rpp|*.sf|*.sp|*.spb|*.spe|*.spp|*.sps|*.wf|*.wp|*.wpb|*.wpp|*.wps|*.pov|*.pro|*.progress|*.i|*.p|*.w|*.ps|*.ps1|*.psl|*.pure|*.pyrex|*.pyx|*.python|*.py|*.q|*.qmake|*.qu|*.r|*.rebol|*.rexx|*.rex|*.rx|*.the|*.rnc|*.ruby|*.pp|*.rb|*.rjs|*.ruby|*.s|*.sas|*.scala|*.scilab|*.sh|*.bash|*.ebuild|*.eclass|*.small|*.sma|*.smalltalk|*.gst|*.sq|*.st|*.sml|*.snmp|*.snobol|*.sno|*.spec|*.spn|*.sql|*.squirrel|*.nut|*.sybase|*.tcl|*.itcl|*.wish|*.tcsh|*.test_re|*.tex|*.cls|*.sty|*.ttcn3|*.txt|*.vala|*.vb|*.bas|*.basic|*.bi|*.vbs|*.verilog|*.v|*.vhd|*.xml|*.dtd|*.ecf|*.ent|*.hdr|*.hub|*.jnlp|*.nrm|*.sgm|*.sgml|*.svg|*.tld|*.vxml|*.wml|*.xsl|*.xpp|*.yaiff|*.znn)
      highlight -O xterm256 "$source"
      ;;
    *.gradle)
      highlight --syntax groovy -O xterm256 "$source"
      ;;
    *.json)
      underscore print --color -i "$source"
      ;;
    *)
      ${SHLESSDIR}/src-hilite-lesspipe.sh "$source" ;;
  esac
done
