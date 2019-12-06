#!/usr/bin/env bash
set -x

source ./gitsync.sh
sync "git@github.com:eclipse/jetty.project.git" "git@gitee.com:gitsync/jetty.project.git"
