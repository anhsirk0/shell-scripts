#!/bin/bash

dir="$HOME/.config/rofi/command/text"
theme="style_2"

options=$dir/options.txt

chosen=$(awk -F ":" '{print $1}' $options | \
                rofi -p "run command" -dmenu -i -theme $dir/$theme)

if [[ ! -z "$chosen" ]] ; then
    notify-send "$chosen"
    cmd="$(grep "$chosen" $options | cut -d ":" -f2)"
    [[ ! -z "$cmd" ]] && notify-send "$(eval "$cmd")" || eval $chosen
fi
