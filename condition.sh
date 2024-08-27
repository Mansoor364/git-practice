#!/bin/bash

NUMBER=$1
if [ $NUMBER>20 ]
then
    print "$NUMBER is greater than 20"
else 
    print "$NUMBER is less than 20"
fi