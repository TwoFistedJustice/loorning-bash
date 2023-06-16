#!/bin/bash
## function_return_value.sh
## based on Mastering Linux by Paul Wang
## shows how to use function return values

prime=(2 3 5 7 11)

function sum() {
  local total=0;         ## local variable
  for i
    do let total+=$i     ## or (( total+=$1 ))
    done
    echo $total          ## return value (I)
}

s=$( sum ${prime[@]} )
echo $s


function newSum() {
  local p="$1[@]"   ## sets p equal to prime[@] (the whole array)
  for i in "${!p}"  ## for each element i in ${prime[@]}
    do let $2+=$i   ## $2 is the symbol myTotal
    done
}

myTotal=0
newSum prime myTotal ## passed both by reference
echo $myTotal
## a "predicate" is a function that tests for a condition and returns a boolean

## checks if file 1 is newer than file 2
function newer(){
  if [[ $1 -nt $2 ]]
    then return 0
  else
      return 1
  fi
}

## same as newer() but more succinct
function newerer(){
  [[ $1 -nt $2 ]]  ## can also use -ot for 'older than'
}

