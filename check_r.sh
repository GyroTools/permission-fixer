#!/bin/bash

echo "check read only"
id


if [ -r "$1" ]
then 
    exit 0
else 
    exit 1
fi
