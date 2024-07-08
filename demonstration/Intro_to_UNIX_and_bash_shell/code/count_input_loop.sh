#!/bin/bash
pattern=$1
for filename in example_sub1.csv example_sub2.csv example_sub3.csv
do
  bash count_input.sh $pattern $filename
done
