# script to remove duplicates

files=$(ls -lS --block-size=1 | awk '!seen[$5]++ {print $9}')

mkdir ../Result

mv $files ../Result/
