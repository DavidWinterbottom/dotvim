#!/bin/bash

function checkdiff {
  echo "$1 $2(<repo >~)"
  diff $1 ../$2  
}

checkdiff vimrc _vimrc

