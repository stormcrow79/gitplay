#!/bin/bash
cd /c/github/gitplay
rm -rf test
git init test
cd test
git lfs install
git lfs track *.dat
git add .gitattributes
git commit -m "init lfs"
