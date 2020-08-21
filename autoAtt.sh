#!/bin/bash

IFS='"'
arry=(`grep -i "<span class=\"participant-name ng-binding\" dir=\"auto\">" src.html | cut -d ' ' -f 12-14 | cut -b 12- | rev | cut -b 8- | rev | awk '{print "\""$0""}'
`)

lenarry=${#arry[*]}
#lenarry=$((($lenarry/3) + 1))

#For updating date for every class
z=$(grep -n "Name" devops18.csv | cut -b 3-);
dt=$(date);
sed -i 's/'"$z"'/&'",$dt"'/' devops18.csv


#will be in while loop with data

i=1
while [ $i -lt $lenarry ]; do

temp=${arry[$i]}

arry[$i]="`echo $temp | cut -b 2-`"

if [ $i -le 9 ]; then
x=$(grep -ni "${arry[i]}" devops18.csv | cut -b 3-)
else
x=$(grep -ni "${arry[i]}" devops18.csv | cut -b 4-)
fi

y=$(sed -i 's/'"$x"'/&,1/' devops18.csv)

let i++
done
