#!/bin/bash
# This is the script that's being used to package the .box file.

# Base box.
# This is the VBox identity (found through `VBoxManage list runningvms`).
# Take the first running instance.
base=`VBoxManage list runningvms | grep --color=never -E 'oscar_packager_[0-9]+' | sed -E 's/"(oscar_packager_[0-9]+)".*/\1/' | head -n1`

# Validate that a base box has been found.
if [ -z "$base" ]
  then
    echo "Base box cannot be found. Ensure that a Project Oscar box is running, then re-run the packager script."
    exit 1
fi
echo "Using base box: $base"

# Get the path to the directory that this script is running within.
cwd="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# The new .box file will be saved to the `./packages` directory within the
# current working directory.
filepath="$cwd/packages"

# Filename used for the .box file.
filename="project_oscar.box"

# boxfile is the full path to the .box file.
boxfile="$filepath/$filename"


# Remove the old box, if it exists.
if [ -f $boxfile ]
  then
    echo "Removing old boxfile."
    rm $boxfile
fi

echo "Packaging $boxfile."
echo

# Package that box.
vagrant package --base $base --output $boxfile --vagrantfile Vagrantfile --include puppet/

