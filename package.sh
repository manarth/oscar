#!/bin/bash
# This is the script that's being used to package the .box.

# Base box.
base="ProjectOscar_1337284846"

# Path to the .box file.
# TODO: make this relative to this package.sh script.
filepath="~/Development/ProjectOscar/packages"

# Filename for the .box file
filename="project_oscar.box"

boxfile="$filepath/$filename"

# Package that box.
vagrant package --base $base --output $boxfile --vagrantfile Vagrantfile --include README.md,puppet/
