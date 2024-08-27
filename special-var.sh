#!/bin/bash

echo "printing all variables passed to script at run time : $@ "

echo "printing no of variables passed to script at run time : $# "

echo "to know your script name : $0"

echo "to know present directory : $PWD"

echo "home directory of user : $HOME"

echo "pid of current executing script $$"

sleep 100 &
echo "pid of last executed command $!"
 