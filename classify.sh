#!/bin/sh

# Classify files by year and month
for i in $(ls | egrep -i '.*20[12][0123789]-?(0[1-9]|1[012])-?(0[1-9]|[12][0-9]|3[01]).*\..*' ); do
   touch -d $(sed 's/[^0-9]//g;s/^\(.\{8\}\).*/\1/' <<< "$i") "$i";
   echo item: $i ' processed';
   year=$(sed 's/[^0-9]//g;s/^\(.\{4\}\)\(.\{4\}\).*/\1/' <<< "$i");
   month=$(sed 's/[^0-9]//g;s/^\(.\{4\}\)\(.\{2\}\)\(.\{2\}\).*/\2/' <<< "$i");
   echo $year$month
   mkdir -p /mnt/c/Users/Néstor/Documents/procesado2/$year/$month
   mv  $i /mnt/c/Users/Néstor/Documents/procesado2/$year/$month;
   echo item: $i ' movido';
done

# Replace whitespaces in filenames
for file in *
do 
    mv "$file" "${file// /_}"
done
