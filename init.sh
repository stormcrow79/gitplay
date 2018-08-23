#!/bin/bash

local_repo=import-test
remote_repo=stormcrow79/import-test

# reinit the repo
cd /c/github/gitplay
rm -rf $local_repo
git init $local_repo

# change into new repo
cd $local_repo

# init lfs
git lfs install
git lfs track *.dat
git add .gitattributes
git commit -m "init lfs"

# push empty repo to github
git remote add origin https://github.com/$remote_repo.git
git push -u origin master --force

# get out
#exit

# prime lfs cache
mkdir .git/lfs/objects
mkdir .git/lfs/objects/d6
mkdir .git/lfs/objects/d6/f3
mkdir .git/lfs/objects/14
mkdir .git/lfs/objects/14/c9
mkdir .git/lfs/objects/4b
mkdir .git/lfs/objects/4b/20

cp ../data1.dat .git/lfs/objects/d6/f3/d6f34137c06643d2e6af7c36f02b215c2a67ce218fb3be9fe887fd2906ab4e56
cp ../data2.dat .git/lfs/objects/14/c9/14c90dddf6d5971aff9b54677363a485b5dc4d2d3cd0b5b835827a2b49d2e5c4
cp ../data3.dat .git/lfs/objects/4b/20/4b2022fa0a54d83df1696d5351d28300f263dd776c14b608d14426e3081b07b7

# run the import
git fast-import < ../fast-lfs

# reset the lfs files
git reset HEAD .
git checkout -- .