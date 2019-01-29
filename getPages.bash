#!/bin/bash

# Pages downloader
# ================
# This script is supposed to get you the last version of the pictures from pepper and carrot website.
# Dependencies: you'll need wget and unzip installed on your system.

# author: laurent valentin jospin (laurent.valentin@famillejospin.ch) ; david revoy (info@davidrevoy.com)
# license: public domain

clear

# colors
Off=$'\e[0m'
Red=$'\e[1;31m'
Green=$'\e[1;32m'
Blue=$'\e[1;34m'

# configuration
lang="en"
if [[ "$1" =~ ^[a-z]{2}$ ]]; then
   lang="$1"
fi

file="$(date --utc +%Y-%m-%d)_${lang}_peppercarrot-all-pages.zip"
urlpath="https://www.peppercarrot.com/tmp/${file}"
workingpath="${PWD}/lang/${lang}"

if [ ! -d "$workingpath"/"pages" ]; then
   echo "${Red}=> Error : No directory -pages- found. Please execute the script in the sources directory. ${Off}"
   exit
fi

echo "${Green}=> Creating image cache to download in step 2. ${Off}"
curl "https://www.peppercarrot.com/downloader.php?l=${lang}" &> /dev/null

echo ""

echo "${Green}=> Downloading the [$lang] archive from peppercarrot.com .${Off}"
echo "${Blue}   Note: it's a 500MB download, it can be long.${Off}"
wget --continue --output-document="/tmp/${file}" "${urlpath}"

echo ""

if [ -f "/tmp/${file}" ]; then
   unzip -o "/tmp/${file}" -d "$workingpath"/"pages"
   echo "${Green}=> Unzip archive done. ${Off} "
   rm "/tmp/${file}"
else
   echo "=> Downloading ${Red} Error: $file is missing. ${Off} "
fi

echo ""

if [ -f "${workingpath}/pages/${lang}_Pepper-and-Carrot_by-David-Revoy_E01P00.png" ]; then
   echo "=> Test: ${Green}Success !${Off} All is done."
   echo ""
else
   echo "=> Test: ${Red} Error. Check test failed. ${Off} "
   echo "   Something didn't work in the process... Please report a bug here: https://github.com/Deevad/peppercarrot_print_book01/issues "
   echo "   Debug: ""$workingpath"/"pages"
   echo ""
fi

exit
