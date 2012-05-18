#!/bin/bash
# This is the script that's being used to package the .box.

# Base box.
base="ProjectOscar_1337284846"

# Path to the directory of this script.
cwd="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Path to the .box file.
filepath="$cwd/packages"

# Filename for the .box file
filename="project_oscar.box"

boxfile="$filepath/$filename"

# Remove the old box, if it exists.
if [ -f $boxfile ]
  then
    echo "Removing old boxfile."
    rm $boxfile
fi

echo "Packaging $boxfile."

# Package that box.
vagrant package --base $base --output $boxfile --vagrantfile Vagrantfile --include puppet/
