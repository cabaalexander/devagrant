#!/bin/bash

extractCaseOption(){
  FILE=$1
  echo $(grep "^[ ]\+\"[_a-z]\+\")$" ${FILE} | sed 's:[") ]::g')
}

# `basename` throws an error if I try to use here ¯\_(ツ)_/¯

