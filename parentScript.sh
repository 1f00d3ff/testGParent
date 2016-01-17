#!/bin/bash

if ! [[ -r .gitmodules ]]; then
  git submodule add git@github.com:1f00d3ff/testChild.git
else
  if [[ $(grep -c testChild .gitmodules) -ge 3 ]]; then
    if ! [[ -r ./testChild/childScript.sh ]]; then
      git clone git@github.com:1f00d3ff/testChild.git
    fi
  fi
fi
git submodule foreach git pull origin master

