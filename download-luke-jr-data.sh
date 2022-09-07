#!/bin/bash

URL=https://luke.dashjr.org/programs/bitcoin/files/charts/data/

declare -a FILES=(
  # use in https://luke.dashjr.org/programs/bitcoin/files/charts/historical.html
  # format: timestamp, listening nodes, total nodes
  "history.txt"
)

for file in ${FILES[@]}; do
  wget -O $file $URL/$file
done
