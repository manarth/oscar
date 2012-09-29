# The following command is used to list all the named virtual hosts declared in
# Apache, which end with the suffix '.local'.
# These are typically announced via Avahi.
apache2ctl -S 2>/dev/null | grep 'namevhost' |sed "s:.*namevhost \([^ ]*\) .*$:\1:" | grep -e '\.local$'
