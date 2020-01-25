#!/bin/sh

#if there is no given argument, work in cwd.
if  [ $# -eq 0 ]; then
 #if cprogs file already exists, print error message. if not, create.
 if [ -e $PWD/cprogs ]; then 
  echo "cprogs file already exists."
 else
 mkdir "$PWD/cprogs"
 echo "A directory named cprogs is created under current working directory."
 fi

 #if there is no file ends with .c print error message. if there is, move to cprogs.
 count=`ls -1 *.c 2>/dev/null | wc -l`
 if [ $count != 0 ]; then 
  mv $PWD/*.c $PWD/cprogs
  echo "All the files whose names ends with .c in the current working directory are moved into cprogs directory."
 else 
  echo "There is no file ends with .c in current working directory."
 fi

#if there is a given argument, work on that path.
else
 #check if given path exists. if not, exit.
 if [ ! -e $1 ]; then
 echo "There is no such path. Try again."
 exit 0
 fi 
 #if cprogs file already exists, print error message. if not, create.
 if [ -e $1/cprogs ]; then 
  echo "cprogs file already exists."
 else
  mkdir "$1/cprogs"
  echo "A directory named cprogs is created under $1."
 fi

 #if there is no file ends with .c print error message. if there is, move to cprogs.
 files=$(ls $1/*.c 2> /dev/null | wc -l)
 if [ "$files" != "0" ]; then
  mv $1/*.c $1/cprogs
  echo "All the files whose names ends with .c in the $1 are moved into cprogs directory."
 else 
  echo "There is no file ends with .c in $1."
 fi
fi


