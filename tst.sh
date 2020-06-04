#!/bin/bash

depth="$1"
depthIncr=6
newdepth=$(($depthIncr + $depth))

printf '%*s hi\n' "$newdepth"