#!/bin/bash
read X
i=2
j=4
contador=0
while [ $j -le $X ]
do
  mod=`expr $X % $i`
  if [ $mod -eq 0 ]
  then
    contador=`expr $contador + 1`
  fi
  i=`expr $i + 1`
  j=`expr $i \* $i`
done

if [ $contador -eq 0 ]
then
  if [ $X -eq 1 ]
  then
    echo $X No es primo
  else
    echo $X Es primo
  fi
else
  echo $X No es primo
fi
