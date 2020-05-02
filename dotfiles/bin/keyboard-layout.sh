#setxkbmap -print | awk -F"+" '/xkb_symbols/ {print $2}'
xkblayout-state print %s
