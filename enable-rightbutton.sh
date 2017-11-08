#!/bin/bash

if [ $# -ne 1 ]; then
        echo "$0 <device id|device name>"
        exit 1
fi

i=0
while read label min delim max; do
    if [ $i -eq 0 ]; then
        minx=$min
        maxx=$max
    elif [ $i -eq 1 ]; then
        miny=$min
        maxy=$max
        break
    fi

    (( i++ ))
done < <(xinput list "$1" | grep Range)

left=`echo \($maxx - $minx\) / 2 + $minx | bc -l`
right=$maxx
top=`echo \($maxy - $miny\) \* 0.8 + $miny | bc -l`
bottom=$maxy

#Changed per https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-input-synaptics/+bug/944961
#xinput set-prop "$1" "Synaptics Right Button Area" $left $right $top $bottom
xinput set-prop "$1" "Synaptics Soft Button Areas" $left $right $top $bottom 0 0 0 0
