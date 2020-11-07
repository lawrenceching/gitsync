#!/usr/bin/env bash
set -x

source ./gitsync.sh
sync "https://github.com/microsoft/vscode.git" "git@gitee.com:gitsync/vscode.git"
