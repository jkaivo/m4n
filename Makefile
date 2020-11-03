.POSIX:

OUTPUTS=text.m4 html.m4 man.m4
COMMON=pre.m4 post.m4

m4n: m4n.sh add_common.sh add_output.sh $(OUTPUTS) $(COMMON) LICENSE
	printf '#!/bin/sh\n' > $@
	cat LICENSE | sed 's/^/# /' >> $@
	printf 'set -e\n\n' >> $@
	for m4 in $(COMMON); do /bin/sh ./add_common.sh $$m4; done >> $@
	for m4 in $(OUTPUTS); do /bin/sh ./add_output.sh $$m4; done >> $@
	cat m4n.sh >> $@
	chmod +x $@
