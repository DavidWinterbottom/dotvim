#!/bin/bash

git submodule update

git submodule foreach git checkout master
git submodule foreach git pull master

