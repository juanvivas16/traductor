#!/bin/bash

a=1
b=1
c=1

read N
echo La serie con $N terminos es:
echo -n $a, $b, $c
i=4
while [ $i -le $N ]
do
  termino=`expr $a + $b`
  termino=`expr $termino + $c`
  echo -n , $termino
  a=$b
  b=$c
  c=$termino
  i=`expr $i + 1`
done
echo
