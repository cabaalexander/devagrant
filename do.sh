#!/bin/bash

main(){
  case $1 in
    r)
      FLAG="reload"
      ;;
    d)
      FLAG="destroy up"
      ;;
    u)
      FLAG="up"
      ;;
    *)
      echo "Not supported"
      exit 1
      ;;
  esac

  IFS='\n'
  for F in $FLAG
  do
    while read G
    do
      yes | vagrant $G
    done <<<$(tr ' ' '\n' <<<$F)

    vagrant ssh
  done
}

[ "$1" == "s" ] \
  && vagrant status \
  || main $@

