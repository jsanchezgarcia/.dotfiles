#!/bin/bash

# Backup VSCode extensions
directory="${HOME}/vscode"
if [ ! -d "$directory" ]; then
  mkdir -p "$directory"
fi

code --list-extensions > "${directory}/extensions.txt"