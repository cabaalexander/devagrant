#!/bin/bash

while read DATA
do
  echo "${DATA}" >> /tmp/fclipboard
  echo "[Copied]"
done

