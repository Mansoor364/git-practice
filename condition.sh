#!/bin/bash

NUMBER=$1
if [ $NUMBER -gt 20 ]      #-gt greater than 
then
    echo "$NUMBER is greater than 20"
else 
    echo "$NUMBER is less than 20"
fi