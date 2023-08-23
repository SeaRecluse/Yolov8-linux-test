##########################################################################################
## (C)Copyright 2020-2030 Akuvox .Ltd 
##
##########################################################################################

#!/bin/bash


PWD=$(pwd)

clear(){
	echo "clear cache!"
	for x in CMakeCache.txt cmake_install.cmake Makefile CTestTestfile.cmake; do
		if [ -f $PWD/$x ]; then
			rm -rf $x
		fi
	done

	for x in thirdlib modulelib CMakeFiles; do
		if [ -d $PWD/$x ];then
			rm -rf $x
		fi
	done
	
}

compile_linux_x86_64() {
    clear

	echo "====================================================="
	echo "--------------- start linux_x86_64 ------------------"
	echo "====================================================="

	cmake  ../src
	make -j 4

	if [ -f $PWD/TestDemo ];then
		mv $PWD/TestDemo $PWD/../demo/TestDemo
	fi
}

# 判断是否有参数输入
compile_linux_x86_64
clear
