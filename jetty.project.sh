#!/usr/bin/env bash
if [ -d "jetty.project" ]; then
  cd jetty.project
  git pull
else
  git clone git@github.com:eclipse/jetty.project.git
  cd jetty.project
fi

git remote add gitee git@gitee.com:gitsync/jetty.project.git
git push -u gitee jetty-9.4.x
