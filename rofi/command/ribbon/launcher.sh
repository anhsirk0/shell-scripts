#!/bin/bash

dir="$HOME/.config/rofi/helper/ribbon"
theme="ribbon_bottom_round"

options=$dir/options.txt

bat=$(xbacklight -get | awk '{print int($1)+1}')
vol=$(pactl list sinks | grep Volume -m 1 | awk '{print int($5)}')

chosen=$(cat $options | rofi -p "Control Brightness ($bat) & Volume ($vol)" -dmenu -i -theme $dir/$theme)
notify-send "$chosen"

if [ -z "$chosen" ] ; then
    exit
else
    action=$(echo $chosen | awk '{print $1}')
    second=$(echo $chosen | awk '{print $2}')
    num=${chosen//[^0-9]/}
    case $action in
        *ight)
            xbacklight -set $num ;;

        *ound)
            pactl set-sink-volume @DEFAULT_SINK@ $num% ;;

        *nc)
            [ $second == "light" ] && xbacklight -inc $num%
            [ $second == "sound" ] && pactl set-sink-volume @DEFAULT_SINK@ +$num% ;;

        *ec)
            [ $second == "light" ] && xbacklight -dec $num%
            [ $second == "sound" ] && pactl set-sink-volume @DEFAULT_SINK@ -$num% ;;
        *ute)
            pactl set-sink-mute @DEFAULT_SINK@ toggle
    esac
fi
