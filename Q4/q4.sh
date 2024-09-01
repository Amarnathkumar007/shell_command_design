#!/bin/bash

#part a
mkdir temp_activity
cd ./temp_activity

#part b
touch temp{1..50}.sh

#part c
for ((i=1; i<26; i++));
do
    mv temp$i.sh temp$i.txt
done