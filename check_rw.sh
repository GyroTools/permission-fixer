#!/bin/bash

echo "check read/write"
id

if [ -w "$1" ]
then 
    exit 0
else 
    exit 1
fi
