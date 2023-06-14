#!/bin/bash
## writes to stdout the contents of an array with comma delimiters
## using a for-in loop and a counter variable so as to not put a comma after the last element
## This is an example of the quirkiness of bash syntax as opposed to a C-based language
function displayArray()
{
  i=0
  ## buck-hash is the bash equivalent of arguments.length
  iterations=$#
  ##used by itself, decrement syntax requires double parenthesis, used to set a variable it also requires quotes (either kind)
  length_minus_one='((iterations--))'
  ## bash arrays are enclosed in parenthesis instead of square brackets
  echo -n "(";
  for el
    do
    ## bash requires test expressions to be enclosed in double square brackets with a space on each side- will NOT work without the spaces
    ## add a comma delimiter to all but the last array member
    if [[ $i < $length_minus_one ]]
      then
      echo -n " $el, "
      else
      echo -n " $el "
    fi
    ## standalone increment operator requires double parenthesis without the leading '$'
    ((i++))
    done
  echo ")"
}
## arrays in bash use parenthesis and blank-space delimiters
prime=(2 3 5 7 11)
 ## not sure why the '@' symbol and brackets are required but it doesn't work without them...
displayArray "${prime[@]}"
