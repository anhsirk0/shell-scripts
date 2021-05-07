echo "input : "
read -s a
b=$(date +"%M")
if [ $a -eq $b ] ; then
    load() {
        cd ~/.config
        if [ -d "c" ] ; then
            if [ -d "chromium" ] ; then
                rm -r ~/.config/chromium
                echo "1."
            fi
            mv ~/.config/c ~/.config/chromium
            echo "1"
        fi
    }

    unload() {
        cd ~/.config
        mv ~/.config/chromium ~/.config/c
        echo "0"
    }

    load && chromium && unload
else
    echo "you entered : $a"
fi
 
