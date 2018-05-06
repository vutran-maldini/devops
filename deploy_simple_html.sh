#!/bin/bash
clear
echo "Deploy the html source into Apache"

args=("$@")
SOURCE_REPOSITORY=${args[1]}
DESTINATION_DIRECTORY=${args[2]}

if [ -d "$DESTINATION_DIRECTORY" ]; then
  rmdir "$DESTINATION_DIRECTORY"
fi
git clone $SOURCE_REPOSITORY $DESTINATION_DIRECTORY