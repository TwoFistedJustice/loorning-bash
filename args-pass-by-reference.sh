#!/bin/bash
## args-pass-by-reference.sh
# based on Mastering Linux by Paul Wang
# Arguments are normally passed by value. But they can be passed reference.

function addOne() {
  echo $1  # n => n, $n => 12
  let $1+=1;
}

n=12;
addOne n; # add $ before the n to see what is echo $1 generates
echo $n