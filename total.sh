#!/bin/bash
## bash script: total.sh
# compute total bytes in files under any given directory hierarchy
## Copied from Mastering Linux by Paul Wang, pp 155-156
## conditional command switches
## https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-Conditional-Expressions

## I ran this and it just recurses, forever repeating ""*" not included in the total"
##  The bug was that I omitted the equal sign on line 41 where dir="$1" which caused it to try to run in a non-existent directory

# -d true of if file exists and is a directory
[[ $# == 1 && -d "$1" ]] || { echo usage: $0 directory; exit; } # if there is exactly one argument and it's a directory OR display usage

function total(){
  local count=0                                     # bytes used inside working dir
  for file in .* *                                  # all files including hidden
    do
        if [[ -f "$file" ]]                         # if it's a regular file (not a directory)
        then
            fl=( $(/bin/ls -ld "$file" ) )            #(A) output of ls -ld is stored in an array - "drwxr-x--- 22 user user 4096 Jun 26 11:09 ."
            let count+=${fl[4]}                       #(B) add the 4th field (byte size) of the previous output to count
            continue
        fi
        if [[ "$file" == *\. || "$file" == *\.\. ]]         #(C) exclude the special files "." and ".."
        then
            continue
        fi
        if [[ -d "$file" ]]                                   #   if the file is a directory
          then
            pushd "$file" >/dev/null                        #(D) flush stdout of pushd
            sum=$( total )                                  #(E) recursive call to total()
            let count+=$sum
            popd >/dev/null                                 #(F) flush stdout of popd
          else
            echo \"$file\" not included in the total >&2
        fi
      done
      echo $count                                           #(G)  return $count
}

dir="$1"
cd $dir
echo "Total for $dir = " $( total ) Bytes                    #(H)