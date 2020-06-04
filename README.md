# Backup Scripts
Creating scripts that go through listed directories, check for changes, and backup changes to a server

## STATUS
Currently only lists all subdirs and files with modification info

## TODO
Add inode number to listing, check modified date for each dir, enter if > hist.log
If dir not in hist.log, update hist.log and continue
Push changes to a server or different directory with SCP

### Ideal Usage
* Directories listen in dirs.txt will be considered
* Recursively goes through sub directories and stats them
* Saves result to hist.log
* Next time called should check hist.log and only consider modified sub directories

