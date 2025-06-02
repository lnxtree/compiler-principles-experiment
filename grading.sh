#!/bin/bash

cd src || exit
cd build || exit
if [ -f compiler ];
then 
    chmod +x compiler
	cd ../../test_cases
    read -p '' case
    src=$case
    irfile=${case/".sy"/".ll"}
    target=${case/".sy"/".target"}
    infile=${case/".sy"/".in"}
    ../src/build/compiler -ir $case > $irfile
    clang -o $target $irfile ../lib/sylib.c -w
    # If InFile exists, Redirect and Compare
    if [ -f $infile ];
    then
	  ./$target < $infile 
	  echo $?
    else
	  ./$target 
	  echo $?
    fi
else  
    echo "代码未编译成功，请排查错误！以下是提示信息："
    make 
fi