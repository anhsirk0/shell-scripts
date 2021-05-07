#!/bin/bash
ls | grep -E ".+\ +" > all_files_to_be_renamed
while read i; do
    mv -v "$i" "$(echo $i | sed 's/ /_/g')"
done < all_files_to_be_renamed

