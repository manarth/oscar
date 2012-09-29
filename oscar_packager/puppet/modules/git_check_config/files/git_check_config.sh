#!/bin/bash

###
# Check if git is configured, and prompt if it isn't.
###
name=`git config --global --get user.name`
mail=`git config --global --get user.email`

if [[ -z "$name" || -z "$mail" ]];
then
  echo -e "\e[1;31mThe git identity is not configured."                  1>&2
  echo -e "\e[0;31mConfigure the git identity using:"                    1>&2
  tput sgr0
  echo "  git config --global user.name 'Your name'"          1>&2
  echo "  git config --global user.email 'email@example.com'" 1>&2
  echo
fi
