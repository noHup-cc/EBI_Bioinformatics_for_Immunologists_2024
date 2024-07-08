#!/bin/bash

# print a message to the user
echo "Processing file: $1"

# count the number of lines containing the word "ATOM"
cat "$1" | grep "200" | wc -l
