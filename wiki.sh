#!/usr/bin/env bash
set -x

source ./gitsync.sh
sync "https://github.com/Requarks/wiki.git" "git@gitee.com:gitsync/wiki.git"
