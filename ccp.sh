#!/bin/bash
##ccp.sh
## From Mastering Linux by Paul Wang, pp153-155
## usage: ccp.sh fromDir toDir [file ...]

## Check if the number of args is at least two
## AND args 1,2 are both directories
## On fail, display help to user (usage) and exit
## conditional command switches
## https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-Conditional-Expressions
(( $# >= 2 )) && [[ -d "$1" && -d "$2" ]] || { echo usage: $0 fromDir toDir [ file ... ]; exit 1; } ## (A)

## set the vars `from` and `to` to the valuesof the args 1,2
from=$1; to=$2
## check AGAIN if args are at least two (could make usage a fn and call it to eliminate one if stmt??)
if (( $# >= 2 )) ## files supplied
then filenames=${@:3}  ## (B)  ${@:from-index:to-index} is bash's "array.slice"
else ## all files in fromDir
  pushd $from                                       ## PUSHD - Save and then change the current directory.
  filenames=( * )
  popd                                              ## POPD - Restore the previous value of the current directory.
fi

for file in "${filenames[@]}"                       ## (D)
do
    echo $file;
    if [[ ! -f "$from/$file" ]]                     ## if not a regular file
      then continue                                 ## then go to next file
    fi
    if [[ -f "$to/$file" ]]                         ## $file in folder to $to
      then if [[ "$from/$file" -nt "$to/$file" ]]    ## (E) -n string - true if string.length is non zero
         then                                        ##-t fd - true if file descriptor fd is open and refers to a terminal
           echo /bin/cp \"$from/$file\" "\$to\"
           /bin/cp $from/$file" "$to"
           fi
      else                                          ## $file not in folder $to
        echo /bin/cp \"$from/$File\" \"$to\"
        /bin/cp "$from/$file" "$to"
    fi
done
