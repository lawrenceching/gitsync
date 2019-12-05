#!/usr/bin/env bash
set -x

if [ ! -d "jetty.project" ]; then
  git clone git@gitee.com:gitsync/wiki.git
fi

cd wiki

git remote add gitee git@gitee.com:gitsync/wiki.git
git remote add github git@github.com:Requarks/wiki.git

BRANCH=$(git rev-parse --abbrev-ref HEAD)

git pull github $BRANCH
git push -u gitee $BRANCH
