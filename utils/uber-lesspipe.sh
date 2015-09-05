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


[[ $(python -mplatform | tr '[:upper:]' '[:lower:]') =~ "darwin" ]] && platform="mac"
[[ $(python -mplatform | tr '[:upper:]' '[:lower:]') =~ "redhat" ]] && platform="redhat"
[[ $(python -mplatform | tr '[:upper:]' '[:lower:]') =~ "ubuntu" ]] && platform="ubuntu"

case "${platform}" in
  *mac*)
    LESSDIR=$(brew --prefix)/bin
    SHLESSDIR=$(brew --prefix)/bin
    ;;
  *ubuntu*)
    LESSDIR=/usr/bin
    SHLESSDIR=/usr/share/source-highlight
    ;;
  *redhat*)
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
