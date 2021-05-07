cp $1 $2

# spaces to tabs
sed -i 's/    /\t/g' $2

# ) { --> )\n{
sed -i 's/) *{$/)\n{/g' $2

# if() --> if ()
for i in if for while;
do sed -i 's/'$i'(/'$i' (/g' $2
done

# } else --> } \n else
sed -i 's/} *else/}\nelse/g' $2
sed -i 's/else *{/else\n{/g' $2

# ++ -- // !! must come before !!
sed -i 's/++/PP/g' $2
sed -i 's/--/MM/g' $2
sed -i 's/\/\//CC/g' $2

# + - / * > < =
for i in 
sed -i 's/+/ + /g' $2
sed -i 's/-/ - /g' $2
sed -i 's/\// \/ /g' $2

sed -i 's/  / /g' $2

sed -i 's/+ *=/+=/g' $2
sed -i 's/- *=/-=/g' $2

sed -i 's/=/ = /g' $2 
sed -i 's/>/ > /g' $2
sed -i 's/</ < /g' $2

sed -i 's/  / /g' $2
sed -i 's/= *=/==/g' $2
sed -i 's/! *=/!=/g' $2
sed -i 's/ *> *=/ >=/g' $2
sed -i 's/ *< *=/ <=/g' $2

# library < stdio.h > --> <stdio.h>
grep "< [a-z,0-9,.]* >" $2 -n | cut -b 1 > lines
while read i; 
	do
		sed -i ' '$i' s/< /</g' $2
		sed -i ' '$i' s/ >/>/g' $2
done<lines

rm lines

sed -i 's/  / /g' $2


# *char

#restore ++ -- //
sed -i 's/PP/++/g' $2
sed -i 's/MM/--/g' $2
sed -i 's/CC/\/\//g' $2

# % 
sed -i 's/%/ % /g' $2

# restore %d %s %c %i
for i in d s c i; 
	do sed -i 's/% *'$i'/%'$i'/g' $2
done

sed -i 's/,/, /g' $2
sed -i 's/;/; /g' $2
sed -i 's/ $//g' $2
sed -i 's/ ,/,/g' $2
#optimizations
sed -i 's/( /(/g' $2 
sed -i 's/ )/)/g' $2 
sed -i 's/" %/"%/g' $2
sed -i 's/  / /g' $2

# tabs to spaces
sed -i 's/\t/    /g' $2

