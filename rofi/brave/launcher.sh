#!/bin/bash

options="$HOME/.config/rofi/brave/options.txt"
theme="~/.config/rofi/brave/pastel.rasi"

chosen=$(awk -F "|" '{print $1}' $options | \
        rofi -p "Brave menu" -dmenu -i -theme $theme)

if [ ! -z "$chosen" ] ; then
    notify-send "$chosen"
    first=$(echo $chosen | awk '{print $1}')
    url=$(grep "$chosen" $options | awk -F "|" 'NR==1 {print $2}')
    if [ ! -z $url ] ; then
        brave "$url" 
    elif [ "$first" == "yt"  ] ; then
        query=$(echo $chosen | cut -f2- -d ' ')
        url=https://www.youtube.com/results?search_query=
        brave "$url$query"
    elif [ "$first" == "g" ] ; then
        query=$(echo $chosen | cut -f2- -d ' ')
        url="https://www.google.com/search?q="
        brave "$url$query"
    else
        url="https://duckduckgo.com/?q=$chosen"
        brave "$url"
    fi
fi

