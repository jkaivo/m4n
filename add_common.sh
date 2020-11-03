#!/bin/sh

eof="$(echo EOF_$1 | tr '.[[:lower:]]' '_[[:upper:]]')"

printf '%s() {\n' "$(echo $1 | tr . _)"
printf 'uudecode -o- << %s\n' $eof
uuencode -m $1 < $1
printf '%s\n}\n\n' $eof
