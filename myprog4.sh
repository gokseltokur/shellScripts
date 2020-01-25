#!/bin/bash

#if there is no given argument, print error message.
if  [ $# -eq 0 ]; then
 echo "Enter a wildcard."
 exit 0
fi

#if there is only wildcard argument
if [ $# -eq 1 ]; then

 #check if txt file exists
 files=$(ls $PWD/*.txt 2> /dev/null | wc -l)
 if [ "$files" == "0" ]; then
  echo "There is no txt file. Try again."
  exit 0
 fi

 #visit all txt files
 for filename in $PWD/*.txt;
  do
  #read file
  text=$(cat $filename)
  wildcard=$1
   #check every string if contains wildcard
   for word in $text;
   do
    if [[ $word == $wildcard ]] ; then
      #convert string to uppercase
      sed -i -r "s/((\s)+|^)${word}/\1${word^^}/1" $filename
      echo "The word “$word” inside $filename is substituted with “${word^^}”."
    fi
   done
 done
fi

#if there is more than one argument, work on that path, if path exists.
if [ $# -ge 2 ]; then
 if [ ! -e $2 ]; then
  echo "There is no such path. Try again."
  exit 0
 fi 

 #check if txt file exists
 files=$(ls $2/*.txt 2> /dev/null | wc -l)
 if [ "$files" == "0" ]; then
  echo "There is no txt file. Try again."
  exit 0
 fi

 for filename in $2/*.txt;
  do
  text=$(cat $filename)
  wildcard=$1
   for word in $text;
   do
    if [[ $word == $wildcard ]] ; then
      echo "The word “$word” inside $filename is substituted with “${word^^}”."
      sed -i "s/${word}/${word^^}/g" $filename
    fi
   done
 done
fi
