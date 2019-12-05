#!/usr/bin/env bash
set -x

GITHUB="git@github.com:netty/netty.git"
GITEE="git@gitee.com:gitsync/netty.git"

DIR=$(echo $GITHUB | cut -d '/' -f 2 | cut -d '.' -f 1)

if [ ! -d "$DIR" ]; then
  git clone $GITEE
fi

cd $DIR

git remote add gitee $GITEE
git remote add github $GITHUB

BRANCH=$(git rev-parse --abbrev-ref HEAD)

git pull github $BRANCH
git push -u gitee $BRANCH
