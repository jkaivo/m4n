.POSIX:

OUTPUTS=text.m4 html.m4
m4n: m4n.sh add_output.sh $(OUTPUTS)
	printf '#!/bin/sh\nset -e\n\n' > $@
	for m4 in $(OUTPUTS); do /bin/sh ./add_output.sh $$m4; done >> $@
	cat m4n.sh >> $@
	chmod +x $@
