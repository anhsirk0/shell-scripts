#!/bin/bash
recents_file=$HOME/.local/share/recently-used.xbel
rm $recents_file
touch $recents_file

sudo chattr +i $recents_file
