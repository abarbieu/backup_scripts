#!/bin/bash

echo $(date)
echo
initdepth=6
while read -r dir; do
   echo sending: "$dir"
   /home/aidan/scripts/backup/backup.sh "$dir" "$initdepth"
done < /home/aidan/scripts/backup/dirs.txt