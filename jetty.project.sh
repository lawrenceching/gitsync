#!/usr/bin/env bash
set -x

if [ ! -d "jetty.project" ]; then
  git clone git@gitee.com:gitsync/jetty.project.git
fi

cd jetty.project

git remote add gitee git@gitee.com:gitsync/jetty.project.git
git remote add github git@github.com:eclipse/jetty.project.git

BRANCH=$(git rev-parse --abbrev-ref HEAD)

git pull github $BRANCH
git push -u gitee $BRANCH
