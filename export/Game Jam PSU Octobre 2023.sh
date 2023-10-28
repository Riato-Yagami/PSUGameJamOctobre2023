#!/bin/sh
echo -ne '\033c\033]0;Game Jam PSU Octobre 2023\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Game Jam PSU Octobre 2023.x86_64" "$@"
