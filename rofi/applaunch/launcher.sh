#!/bin/bash

dir="$HOME/.config/rofi/applaunch"
theme=pastel

rofi -no-lazy-grab -show drun -modi drun -theme $dir/"$theme"
