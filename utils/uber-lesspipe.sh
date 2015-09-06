#! /bin/bash

# Prerequisite:
#    Mac:
#      $> brew install lesspipe
#      $> brew install source-highlight
#    Ubuntu:
#      $> sudo apt-get install source-highlight
#      $> sudo ln -s /usr/bin/lesspipe /usr/bin/lesspipe.sh
#    Redhat:
#      $> sudo yum install source-highlight
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
        ${LESSDIR}/lesspipe.sh "$source" ;;
    *)
        ${SHLESSDIR}/src-hilite-lesspipe.sh "$source" ;;
    esac
done
