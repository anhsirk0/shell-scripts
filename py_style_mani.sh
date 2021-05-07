cp $1 $2

sed -i 's/    /\t/g' $2

sed -i 's/,/, /g' $2
sed -i 's/ :$/:/g' $2

# + - / *
sed -i 's/+/ + /g' $2
sed -i 's/*/ * /g' $2
sed -i 's/-/ - /g' $2
sed -i 's/%/ % /g' $2
sed -i 's/\// \/ /g' $2
sed -i 's/  / /g' $2

sed -i 's/+ *=/+=/g' $2
sed -i 's/- *=/-=/g' $2
# tabs to spaces

sed -i 's/\t/    /g' $2
