#!/bin/sh

eof="$(echo EOF_$1 | tr '.[[:lower:]]' '_[[:upper:]]')"

printf '%s() {\n' "$(echo $1 | tr . _)"
printf '\tuudecode -o- <<- %s\n' $eof
uuencode -m $1 < $1 | sed 's/^/\t/'
printf '\t%s\n}\n\n' $eof
