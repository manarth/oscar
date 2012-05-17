# List all the '.local' vhosts in Apache.
apache2ctl -S 2>/dev/null | grep 'namevhost' |sed "s:.*namevhost \([^ ]*\) .*$:\1:" | grep -e '\.local$'
