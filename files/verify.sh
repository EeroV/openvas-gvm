for i in $(ls *.tar.gz)
do
# echo "$i"
 gpg --verify $i.asc $i
done
