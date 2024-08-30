#!/bin/bash
ls -l > output.txt #redirecting output into file
cat output.txt

ls -l 1>output.txt #redirecting success of command into file
cat output.txt

lsss -l 2>output.txt #redirecting failure of command into file
cat output.txt

lss -l &>output.txt #redirecting both success or failure into file
cat output.txt

ls -l&>>output.txt #appending status of command in file
cat output.txt



