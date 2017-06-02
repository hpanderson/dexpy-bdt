#!/bin/bash

export DEXPY_ENV_NAME=coffee_talk

source activate $DEXPY_ENV_NAME

# save off files we need for gh-pages
mkdir -p /tmp/workspace
mv index.html /tmp/workspace/index.html
cp -r reveal.js /tmp/workspace

mkdir -p /tmp/workspace/img
cp img/* /tmp/workspace/img

# create a folder for gh-pages branch
mkdir -p /tmp/gh-pages
cp -r .git /tmp/gh-pages

# switch to gh-pages and remove everything
cd /tmp/gh-pages
# could delete the gh-pages branch here, if we wanted to keep it at 1 commit
# not sure if there's an advantage to having a history for it
git checkout -fB gh-pages
git rm -rf .
git checkout master .gitignore
git reset HEAD

# add and commit
cp -r /tmp/workspace/* .
touch .nojekyll
git add -A
git rm .gitignore -f
git commit -m "Generated gh-pages for $(git log master -1 --pretty=short --abbrev-commit)"
git push --force --quiet origin gh-pages

# clean up
rm -rf /tmp/workspace
rm -rf /tmp/gh-pages
