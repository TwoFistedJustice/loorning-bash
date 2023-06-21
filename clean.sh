#!/bin/bash
##  cycle through all files in a directory and prompt to delete regular files
## usage: clean.sh dir
## Mostly same as clean.sh from pp151-153 Mastering Linux by Paul Wang
## consider using 'trash-cli' instead of rm to remove files

if (( $# != 1 )) ## num args not equal 1
then echo usage: $0 directory
  exit
fi
dir="$1"
if ! [[ -d "$dir" && -w "$dir" ]] ## not a dir or not writable
  then eco $dir not a writable directory
  echo usage: $0 directory; exit 1
fi

cd "$dir";

for file in *
do
  if ! [[ -f "$file" && -r "$file" ]]
    then continue
  fi
  echo " " ## a blank line
  /bin/ls -l "$file"
  while :
  do
    echo -n "*** Delete $file or not?? "
    echo -n "[y, n, e, m, t, !, or q]:"
    read c
    case $c in
    y) if [[ ! -w "$file" ]]
       then echo $file write-protected
       else /bin/rm "$file"
         if [[ -e "$file" ]]
         then echo cannot delete $file
         else echo "+++++ $file deleted"
         fi
       fi
       break ;; ## to handle next file
     n) echo "----- $file note deleted"
        break ;;
     e) ${EDITOR:-/usr/bin/nano} "$file" ; continue ;;
     m) /bin/more "$file"; continue ;;
     t) /bin/tail "$file"; continue ;;
     !) echo -n "command: "
        read cmd
        eval $cmd ;;
     q) break 2;; ## break 2 levels
     *) ## help for user
        echo "y yes delete file"
        echo "n don't delete file'"
        echo "e edit/view file with ${EDITOR:-/usr/bin/nano}"
        echo "m display tail of file"
        echo "! Shell escape"
        echo "q quit, exit from clean()"
        ;;
      esac
    done
  done


