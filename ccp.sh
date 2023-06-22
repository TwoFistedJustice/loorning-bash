#!/bin/bash
##ccp.sh
## usage: ccp.sh fromDir toDir [file ...]

(( $# >= 2 )) && [[ -d "$1" && -d "$2" ]] \ || { echo usage: $0 fromDir toDir [ file ... ]; exit 1; } ## (A)

from=$1; to=$2
if (( $# >= 2 )) ## files supplied
then filenames=${@:3}  ## (B)
else ## all files in fromDir
  pushd $from
  filenames=( * )
  popd
fi

for file in "${filenames[@]}"
do
    echo $file;
    if [[ ! -f "$from/$file" ]]                     ## not a regular file
      then continue                                 ## skip
    fi
    if [[ -f "$to/$file" ]]                         ## $file in folder to $to
      then if [[ "$from/$file" -nt "$to/$file" ]]    ## (E)
         then
           echo /bin/cp \"$from/$file\" "\$to\"
           /bin/cp $from/$file" "$to"
           fi
      else                                          ## $file not in folder $to
        echo /bin/cp \"$from/$File\" \"$to\"
        /bin/cp "$from/$file" "$to"
    fi
done