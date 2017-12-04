#!/bin/bash
read N
i=1

while [ $i -le $N ]
do
	j=1
 	while [ $j -le $i ]
 	do
 		echo -n $i
 		j=`expr $j + 1`
 	done
 	echo
 	i=`expr $i + 1`
done