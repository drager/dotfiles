unmute() { amixer set Master unmute ; }
mute() { amixer set Master mute ; }
get() {
    currentvol="$(amixer get Master|tail -n1|sed -r 's/.*\[(.*)%\].*/\1/')"

    icon=""

    if [ $currentvol -gt 51 ] ; then
        icon="\\uf028"
    elif [ $currentvol -gt 26 ] ; then
        icon="\\uf027"
    else
        icon="\\uf026"
    fi

    echo -e $icon $currentvol
}

case "$1" in
    -inc|-i) unmute ; amixer set Master "$2+" ;;
    -dec|-d) unmute ; amixer set Master "$2-" ;;
    -get|-g) get ;;
    -mute|-m) mute ;;
    --help|-h) usage
esac
