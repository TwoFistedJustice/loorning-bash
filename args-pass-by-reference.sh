#!/bin/bash
## args-pass-by-reference.sh
# based on Mastering Linux by Paul Wang
# Arguments are normally passed by value. But they can be passed reference.

function addOne() {
  echo "Pass $3 by $2"
  echo "\${!1} evaluates to: ${!1}" ## ${!1} means `eval \$$1` or $variable
  echo "\$1 evaluates to: $1"   # n => n, $n => 12
  let $1+=1;
}

n=12;
addOne n "reference" n; # comment this out and decomment the next line to see what $1 generates
echo "\$n evaluates to: $n"; echo -e


p=100;
addOne $p "value" p;  # 101 and error "attempted assignment to non-variable "
echo "\$p evaluates to: $p"

