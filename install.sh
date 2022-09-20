#!/bin/bash

# 
# Args:
#     -o output file (optional, default is ~/.emacs)
#     -i input file (optional, default is ./emacs-config)

DisplayHelp()
{
   # Display Help
   echo "Installs emacs config file in local directory into user's config location"
   echo
   echo "Syntax: install.sh [-i input_file] [-o output_loc]"
   echo "options:"
   echo "-i    File to be copied as emacs-config for current user. (Default ./emacs-config)"
   echo "-o    Location to copy the emacs configuration to. (Default $HOME/.emacs)"
   echo
}

INPUT="./emacs-config"
OUTPUT="$HOME/.emacs"

# Read the inputs
while getopts ":hi:o:" option; do
    case $option in
	h)
	    DisplayHelp
	    exit 0;;
	i)
	    INPUT=$OPTARG;;
	o)
	    OUTPUT=$OPTARG;;
	\?)
	    echo "Bad argument $OPTARG"
	    exit -1;
	;;
    esac
done

set -x
cp $INPUT $OUTPUT
