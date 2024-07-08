#!/bin/bash

for filename in example_sub1.csv example_sub2.csv example_sub3.csv
do
  bash customized_count_200.sh $filename
done
