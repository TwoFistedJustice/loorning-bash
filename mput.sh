#!/bin/bash
## file mput.sh
## upload and download files using sftp
## Usage: mput "*.jpg" or mget "*.pdf"

## replace values with args and refactor file appropriately
### begin customizable: user, host, rdir
user=pwang                                          ## (1)
host=monkey.cs.kent.edu                             ## (2)
rdir=tmp                                            ## (3)
### end customizable

if [[ $0 == *mget* ]]                               ##(4)
  then action=mget
  else action=mput
fi

/usr/bin/sftp $user@host <<HERE
cd $rdir
$action "$@"


'Setting up a multi-boot of 5 Linux distributions by Manu Järvinen Medium.pdf'