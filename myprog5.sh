#!/bin/bash

#if there is no given argument, work in current directory
if  [ $# -eq 0 ]; then
 #add all size 0 files to array
 array=()
 while IFS=  read -r -d $'\0'; do
    array+=("$REPLY")
 done < <(find $PWD -maxdepth 1 -type f -size 0 -print0)
 #if there is no size 0 file, print error message
 if [ -z ${array[0]} ]; then
   echo "There is no file with size 0."
   exit 0
 fi
 #ask to delete files one by one
 for filename in "${array[@]}";
 do
 echo "Do you want to delete $filename? (y/n):"; read yn;
 case $yn in
	y) rm $filename; echo "1 file deleted.";;
	n) ;;
	*) echo "Please enter y or n!" ;;
 esac
 done

#if there is only one given argument
elif  [ $# -eq 1 ]; then
 #check if the argument is -R option, then find all subdirectories
 if [ $1 == "-R" ]; then
  echo "-R"
  array=()
  while IFS=  read -r -d $'\0'; do
    array+=("$REPLY")
  done < <(find $PWD -type f -size 0 -print0)

  if [ -z ${array[0]} ]; then
   echo "There is no file with size 0."
   exit 0
  fi
 
  for filename in "${array[@]}";
  do
  echo "Do you want to delete $filename? (y/n):"; read yn;
  case $yn in
	y) rm $filename; echo "1 file deleted.";;
	n) ;;
	*) echo "Please enter y or n!" ;;
  esac
  done

 #if the given argument is a path, work on that path
 else
  path=$1
  #check if path exists
  if [ ! -e $1 ]; then
   echo "There is no such path. Try again."
   exit 0
  fi 

  array=()
  while IFS=  read -r -d $'\0'; do
    array+=("$REPLY")
  done < <(find $path -maxdepth 1 -type f -size 0 -print0)

  if [ -z ${array[0]} ]; then
   echo "There is no file with size 0."
   exit 0
  fi

  for filename in "${array[@]}";
  do
  echo "Do you want to delete $filename? (y/n):"; read yn;
  case $yn in
	y) rm $filename; echo "1 file deleted.";;
	n) ;;
	*) echo "Please enter y or n!" ;;
  esac
  done
 fi

#if there is 2 or more argument;
elif  [ $# -ge 2 ]; then
 #work on that path
 path=$2
 #check if path exists
 if [ ! -e $2 ]; then
  echo "There is no such path. Try again."
  exit 0
 fi 
 
 array=()
  while IFS=  read -r -d $'\0'; do
    array+=("$REPLY")
  done < <(find $path -type f -size 0 -print0)
  
  if [ -z ${array[0]} ]; then
   echo "There is no file with size 0."
   exit 0
  fi 

  for filename in "${array[@]}";
  do
  echo "Do you want to delete $filename? (y/n):"; read yn;
  case $yn in
	y) rm $filename; echo "1 file deleted.";;
	n) ;;
	*) echo "Please enter y or n!" ;;
  esac
  done

fi
