#!/bin/sh
# F2 literal scans for a draft reply; prints offending lines, exits 1 if any
f="$1"; bad=0
chk() { if grep -n -i -E "$1" "$f" | grep -v '^.*📋' ; then bad=1; fi; }
chk 'step [0-9]'
chk 'the (last|first|next) hop|same shape|as before|same path'
chk 'depends on the [A-Za-z-]+ flow'
chk '\b(hands|passes|shares|provides|gives access|integrates|leverages|bypasses|sits inside|separate[sd]?|distinguish|tell apart|attaches)\b'
chk 'nothing more|the whole (point|dependence)|that is all|exactly one place'
chk 'the row for|sheet row'
chk 'sibling table|Allow sheet|the second code|code for Crunchyroll'
awk '/^```/{inb=!inb; next} inb && gsub(/[A-Za-z_]+: /,"&")>=4 && /  +[a-z]+: .*  +[a-z]+: /' "$f" | grep -q . && { echo "side-by-side block line"; bad=1; }
echo "prose words: $(grep -v '^📋' "$f" | grep -v '^```' | wc -w)"
exit $bad
