#!/bin/bash

dir="$HOME/.config/rofi/helper"
theme="pastel_qalc"


expr=$(rofi -p "Expression > " -dmenu -i -theme $dir/$theme)

if [ -z "$expr" ] ; then
    exit
else
    action=$(echo $expr | awk -F ': ' '{print $1}')
    second=$(echo $expr | awk -F ': ' '{print $2}')
    echo $second
    echo $action
    if [ ! -z "$second" ]; then
        case $action in
            a)
                expr=$(printf "$second" | sed 's/ /+/g') ;;
            m)
                expr=$(printf "$second" | sed 's/ /*/g') ;;
        esac
    fi
    ans=$(qalc $expr)
    notify-send "$ans"
fi

