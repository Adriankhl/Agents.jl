#!/bin/bash

#export CLASSPATH mason.20.jar
times=()
for i in {1..100}
do
    startt=`date +%s%N`
    java sim.app.flockers.FlockersBenchmark -for 1000 -quiet
    endt=`date +%s%N`
    times+=(`expr $endt - $startt`)
done
readarray -t sorted < <(printf '%s\n' "${times[@]}" | sort)
echo "${sorted[0]} * 0.000001" | bc
