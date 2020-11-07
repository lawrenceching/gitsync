#!/usr/bin/env bash
set -x

source ./gitsync.sh
sync "https://github.com/kubernetes/kubernetes.git" "git@gitee.com:gitsync/kubernetes.git"
