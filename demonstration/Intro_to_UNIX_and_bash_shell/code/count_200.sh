#!/bin/bash

# count the number of lines containing the word "200"
cat example.csv | grep "200" | wc -l
