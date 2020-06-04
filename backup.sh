#!/bin/bash

dir="$1"
dirname=$(basename "$dir")
dirinfo=$(stat "$dir" | sed -n "s~Modify:~:~p")

depth="$2"
depthIncr=6
newdepth=$(($depthIncr + $depth))
dashlen=$(($depthIncr + 35))
dashlen=$(($dashlen - ${#dirname}))
# len=100 ch='#'
# printf '%*s' "$len" | tr ' ' "$ch"
# echo
# echo '%*s'

printf "%*s./%s\n" "$depth" " " "$dirname" 

printf '%*s' "$depth"

printf '%*s' "$dashlen" | tr " " "-"
printf '%s%s' "$dirname" "$dirinfo"
printf '%*s\n' "$dashlen" | tr " " "-"

for f in "$dir"*; do
   if [[ -f "$f" ]]; then
      filename="${f##*/}"
      info=$(stat "$f" | sed -n "s~Modify:~:~p")
      printf '%*s-> %32s%s\n' "$newdepth" " " "$filename" "$info"
      # echo "$depth            -> $filename"
   fi
done
for d in "$dir"*/; do
   if [[ -d "$d" ]]; then
      # dirname=$(basename "$d")
      # info=$(stat "$d" | sed -n "s~Modify:~$dirname:~p")
      # echo "$depth  ->  $info"
      # echo "$depth            -> $dirname"
      /home/aidan/scripts/backup/backup.sh "$d" "$newdepth"
   fi
done
