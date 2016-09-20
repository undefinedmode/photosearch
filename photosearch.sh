#!/bin/bash
# v2016-09-20 https://github.com/undefinedmode
# TODO known bugs: move option will overwrite files with identical names
# Script to find photo's on a drive (by filename notation) and copy/move them to a another folder. Very useful for people who have had camera's from multiple vendors over the years.
myuser=$(whoami)
# Set Destination folder
timestamp=$(date +%F_%H%M%S)
d="/home/$myuser/phtsearch-$timestamp"
##################################################################
echo "Source dir is:"
echo -e "\e[101m$(pwd)\e[00m"
sleep 1
echo "Destination dir is: "
echo -e "\e[104m$d\e[00m"
sleep 3
mkdir -p "$d"
##################################################################
echo "Choose method:"
echo "1: SAFE COPY MODE (copies files and leaves source folder intact)"
echo "2: MOVE MODE (NOT RECOMMENDED, will overwrite files with identical names!)"

read -r input;
if [ "$input" -eq "2" ]
then
	action="mv --backup=t "
	echo -e "\e[105mMOVE MODE SELECTED\e[00m"
	sleep 3
else
	action="cp"
	echo -e "\e[105mSAFE COPY SELECTED\e[00m"
	sleep 3
fi

echo "##################################################################"
echo -e "\e[104mSearching relevant default folder names\e[00m"
echo "##################################################################"

find . -type d \( -iname "DCIM" -o -iname "Camera" -o -iname "100NIKON"  -o -iname "1**msdf" -o -iname "10*DCF" -o -iname "1**PANA" -o -iname "1**CANON" -o -iname "101P_0*" \) -exec $action {} "$d" \;

echo "##################################################################"
echo -e "\e[104mSearch by default filename notation\e[00m"
echo "##################################################################"
find . -type f \( -iname "dcp*****.jpg" -o -iname "dsc*****.jpg" -o -iname "dscn****.jpg" -o -iname "mvc-***.jpg" -o -iname "mvc*****.jpg" -o -iname "P101****.jpg" -o -iname "PMDD****.jpg" -o -iname "IMG_***.jpg" -o -iname "IMAG****.jpg" -o -iname "1**-****.jpg" -o -iname "1**-****_IMG.jpg" -o -iname "IMG_****.jpg" -o -iname "_MG_****.jpg" -o -iname "dscf****.jpg" -o -iname "pdrm****.jpg" -o -iname "IM******.jpg" -o -iname "EX******.jpg" -o -iname "DC****S.jpg" -o -iname "pict****.jpg" -o -iname "MMDD****.JPG" -o -iname "YYMDD***.JPG" -o -iname "IMGP****.JPG" -o -iname "PANA****.JPG" -o -iname "IMG_YYYYMMDD_HHMMSS.JPG" -o -iname "DSCI*.JPG" -o -iname "P8*.JPG" \) -exec $action {} "$d" \;
echo -e "\e[102mComplete\e[00m"
