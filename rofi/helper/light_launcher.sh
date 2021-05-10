#!/bin/bash

dir="$HOME/.config/rofi/helper"
theme="pastel"

options=$dir/light_options.txt

bat=$(xbacklight -get | awk '{print int($1)+1}')
vol=$(pactl list sinks | grep Volume -m 1 | awk '{print int($5)}')
pres=$(xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/presentation-mode -v)

sed -i '/Pres/d' $options
echo "Pres ($pres)" >> $options
chosen=$(cat $options | rofi -p "Brightness ($bat) & Volume ($vol)" -dmenu -i -theme $dir/$theme)

if [ -z "$chosen" ] ; then
    exit
else
    action=$(echo $chosen | awk '{print $1}')
    second=$(echo $chosen | awk '{print $2}')
    num=${chosen//[^0-9]/}
    if [ "$num" == "$chosen" ] ; then
        xbacklight -set $num
        notify-send "Light $num"
        
    elif [ "${chosen:0:1}" == "a" ] ; then
        xbacklight -inc $num%
        notify-send "Light $(( bat+num ))"
        
    elif [ "${chosen:0:1}" == "d" ] ; then
        xbacklight -dec $num%
        notify-send "Light $(( bat-num  ))"

    else
        notify-send "$chosen"
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
                pactl set-sink-mute @DEFAULT_SINK@ toggle ;;

            Blugon)
                blugon ;;
                
            Pres*)
                xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/presentation-mode -T
                notify-send "Toggled presentation mode"
        esac
    fi
fi

