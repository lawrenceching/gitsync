#!/usr/bin/env bash
set -x

source ./gitsync.sh
sync "git@github.com:Requarks/wiki.git" "git@gitee.com:gitsync/wiki.git"