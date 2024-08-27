#!/bin/bash

NUMBER=$1
if [ $NUMBER -gt 20 ]      #-gt greater than 
then
    print "$NUMBER is greater than 20"
else 
    print "$NUMBER is less than 20"
fi