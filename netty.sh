#!/usr/bin/env bash
set -x

source ./gitsync.sh
sync "git@github.com:netty/netty.git" "git@gitee.com:gitsync/netty.git"