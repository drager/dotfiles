#!/bin/sh

perc=0

    [ -f /sys/class/power_supply/ADP1/online ] &&
        path=/sys/class/power_supply/ADP1/online

    perc="$(acpi -b | cut -d % -f1 | cut -d , -f2 | awk '{$1=$1};1')"
    timeleft="$( acpi -b | awk -F 'remaining' '{print $1}' | awk -F ', ' '{print $3}')"

    if [ "$(cat $path)" -eq 1 ] ; then
        echo -e "\\uf492 $perc %" # charging
        exit
    fi

    #perc="$(battery)"
    #icon="$(\\uf240)"
    #echo $icon

[ -n "$perc" ] &&
if [ $perc -gt 76 ] ; then 
    echo -e "$timeleft \\uf240 $battery" # 76-100
elif [ $perc -gt 51 ] ; then 
    echo -e "$timeleft \\uf241" # 51-76
elif [ $perc -gt 26 ] ; then
    echo -e "$timeleft \\uf242" # 26-51
elif [ $perc -gt 10 ] ; then
    echo -e "$timeleft \\uf243" # 6-25
elif [ $perc -gt 5 ] ; then
    echo -e "$timeleft \\uf244" # 6-25
else 
    echo -e "$timeleft \\uf244☠️ " # 0-5
fi 
