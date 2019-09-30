#!/bin/bash

# Pages downloader
# ================
# This script is supposed to get you the last version of the pictures from pepper and carrot website.
# Dependencies: you'll need wget and unzip installed on your system.

# author: laurent valentin jospin (laurent.valentin@famillejospin.ch) ; david revoy (info@davidrevoy.com)
# license: public domain

# configuration
# -------------
# For lang available, check at least the one with ep1 translated here: https://www.peppercarrot.com/0_sources/ep01_Potion-of-Flight/lang/
lang="en"
# Season 1: from ep01 → ep11
# Season 2: from ep12 → ep21
# Season 3: from ep22 → ep29
# Season 4: from ep30 → (wip...)
season="1"

clear

# colors
Off=$'\e[0m'
Red=$'\e[1;31m'
Green=$'\e[1;32m'
Blue=$'\e[1;34m'

if [[ "$1" =~ ^[a-z]{2}$ ]]; then
   lang="$1"
fi

file="$(date --utc +%Y-%m-%d)_${lang}_S0${season}_peppercarrot-all-pages.zip"
urlpath="https://www.peppercarrot.com/tmp/${file}"
path="${PWD}/lang/${lang}"

# Block if executed not at root of directory.
if [ ! -d "lang" ]; then
  if [ ! -f "README.md" ]; then
   echo "${Red}=> Error :${Off} Can't find lang/ or README.md!"
   echo "Are you executing that at the root of the repo?"
   echo "Please try again."
   exit
  fi
fi

# Create the target folder
if [ ! -d "${path}/pages" ]; then
    echo "${Green}=>Missing directory for this lang: creating folder ${path}/pages ${Off}"
    mkdir -p "${path}/pages"
    if [ ! -d "${path}/pages" ]; then
      echo "${Red}=>Error: coudn't create directory. Please check permissions. ${Off}"
      exit
    fi
fi

echo "${Green}=> Query Pepper&Carrot website${Off}"
echo "${Blue}Calling the 'zip download generator' for getting a fresh pack.${Off}"

curl "https://www.peppercarrot.com/downloader.php?l=${lang}&s=${season}" &> /dev/null
echo "${Blue}Call done.${Off}"

echo ""
echo "${Blue}  ...Waiting 30sec to let the time for the server to generate${Off}"
echo "${Blue}  the big zip files. It prepares a 200MB zip with hundreds of PNGs inside.${Off}"
sleep 10
echo "${Blue}  ...20sec${Off}"
sleep 10
echo "${Blue}  ...10sec... Almost done!${Off}"
sleep 10
echo "${Blue}  ...${Off}${Green}=>GO!${Off}"
echo ""

echo "${Green}=> Downloading the [$lang] archive from peppercarrot.com .${Off}"
echo "${Blue}   Note: it's a 200MB download, it can be long.${Off}"
echo ""
wget --continue --output-document="/tmp/${file}" "${urlpath}"

echo ""

# Check if we have the archive.
if [ -f "/tmp/${file}" ]; then
   # Remove previous README.md files before unzipping
   if [ -f "${path}/pages/README.md" ]; then
      rm "${path}/pages/README.md"
   fi
   echo "${Green}=> Unzipping the archive .${Off}"
   echo ""
   unzip -o "/tmp/${file}" -d "$path"/"pages"
   echo "${Green}=> Unzip archive done. ${Off} "
   rm "/tmp/${file}"
else
   echo "=> Downloading ${Red} Error: $file is missing. ${Off} "
fi

echo ""

# We check for the presence of the new README.md inside the deflated archive.
# As we removed it before, this system ensure the work was done.
if [ -f "${path}/pages/README.md" ]; then
   echo "=> Quick install test: ${Green}Success !${Off}"
   echo "${Blue} All looks correctly setup.${Off}"
   echo ""
else
   echo "=> Quick install test: ${Red} Error. Check test failed. ${Off} "
   echo "   Something didn't work in the process... Please report a bug here: https://github.com/Deevad/peppercarrot_print_book01/issues "
   echo "   Debug: ""$path"/"pages"
   echo ""
fi

exit
