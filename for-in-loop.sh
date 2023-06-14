#!/bin/bash
## writes to stdout the contents of an array with comma delimiters
## using a for-in loop and a counter variable so as to not put a comma after the last element
## This is an example of the quirkiness of bash syntax as opposed to a C-based language
function displayArray()
{
  i=0
  iterations=$#  ## buck-hash is the bash equivelent of arguments.lenth
  length_minus_one='((iterations--))' ##used by itself, decrement syntax requires double parenthesis, used to set a variable it also requires quotes (either kind)
  echo -n "(";  ## bash arrays are enclosed in parenthesis instead of square brackets
  for el
    do  ## bash requires test expressions to be enclosed in double square brackets with a space on each side- will NOT work without the spaces
    if [[ $i < $length_minus_one ]]  ## add a comma delimiter to all but the last array member
      then
      echo -n " $el, "
      else
      echo -n " $el "
    fi
    ((i++))  ## standalone increment operator requires double parenthesis without the leading '$'
    done
  echo ")"
}

prime=(2 3 5 7 11) ## arrays in bash use parenthesis and blank-space delimiters

displayArray "${prime[@]}"  ## not sure why the '@' symbol and brackets are required but it doesn't work without them...
