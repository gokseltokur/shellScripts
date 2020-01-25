 #!/bin/bash
 # menu
 while :
  do
     echo " "
     echo " Please select an option "
     echo " "
     echo "[1] Check for palindromes"
     echo "[2] Move .c files"
     echo "[3] Draw hollowed square"
     echo "[4] Uppercase conversion"
     echo "[5] Delete files"
     echo "[6] Exit/Stop"
     
     read yourch
     case $yourch in
        1) echo "Enter a string: ";  read str; ./myprog1.sh $str;;
 	2) echo "Do you want to give a pathname? (y/n)";  read yn;
           case $yn in
		y) echo "Enter pathname: "; read path; ./myprog2.sh $path ;;
		n) ./myprog2.sh;;
		*) echo "Please enter y or n!" ;;
	   esac ;;   
 	3) echo "Enter two numbers: (first should be greater than second and difference should be even)";  read nums; 
                ./myprog3.sh $nums;;
 	4) echo "Enter a wildcard: "; read wildcard; wildcard=${wildcard:1: -1}; 
	   echo "Do you want to give a pathname? (y/n)";  read yn;
           case $yn in
		y) echo "Enter pathname: "; read path; ./myprog4.sh $wildcard $path ;;
		n) ./myprog4.sh $wildcard;;
		*) echo "Please enter y or n!" ;;
	   esac ;;   
 	5) echo "Do you want to give arguments (y/n)";  read yn;
           case $yn in
		y) echo "Give arguments: (-R, pathname or both)"; read arg; 
		   ./myprog5.sh $arg;; 
		n) ./myprog5.sh ;;
		*) echo "Please enter y or n!" ;;
	   esac ;;   
        6) exit 0 ;;
 	*) echo "Please select choice 1,2,3,4,5 or 6";
 	   echo "Press a key. . ." ; read ;;
     esac
  done
