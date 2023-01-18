#!/bin/bash
typeset -A majors students

while read line;do
    record=($(echo $line|awk '{print $1,$2}'))
    student=${record[0]}
    major=${record[1]}

    majors[$major]=$((majors[$major]+1))
    students[$student]=$((students[$student]+1))
done<$1

for major in ${!majors[@]};do
    echo "$major ${majors[$major]}" 
done|sort -t$' ' -k2rn -k1;echo

count=0

for student in ${!students[@]};do
    if [ "${students[$student]}" -ge 2 ];then
        echo $student
    fi
    if [ "${students[$student]}" == 1 ];then
        count=$((count+1))
    fi 
done;echo $count



