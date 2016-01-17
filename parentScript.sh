#!/bin/bash

echo 'bread'
if ! [[ -r .gitmodules ]]; then
  git submodule add git@github.com:1f00d3ff/testChild.git
else
  if ! [[ $(grep -c testChild .gitmodules) -ge 3 ]]; then
    echo 'gitmodule is missing testChild'
  else
    if ! [[ -r ./testChild/childScript.sh ]]; then
      echo 'something is broken'
      git submodule add git@github.com:1f00d3ff/testChild.git
    fi
  fi
fi

. ./testChild/childScript.sh

