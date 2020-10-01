#!bin/bash

# check all packages are installed and install using homebrew if not
echo "\033[1;31mChecking for necessary packages...\033[0m";
all_installed=1

# some of the installations may need changing so they happen quietly

which brew
if [ $? != 0 ]; then
	echo "brew not installed";
fi
which kubectl
which minikube
if [ $? != 0 ]; then
	echo "brew not installed";
fi
which hyperkit
if [ $? != 0 ]; then
	echo "brew not installed";
fi
which docker
