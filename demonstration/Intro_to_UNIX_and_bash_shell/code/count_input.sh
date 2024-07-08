#!/bin/bash
pattern=$1
file=$2
num_inputs=$(cat $file | grep $pattern | wc -l)
echo "$num_inputs"
