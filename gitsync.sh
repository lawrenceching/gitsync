function sync {

    GITHUB="$1"
    GITEE="$2"

    echo "Synchronizing from $GITHUB to $GITEE"

    DIR=$(echo $GITHUB | cut -d '/' -f 2 | cut -d '.' -f 1)

    if [ ! -d "$DIR" ]; then
    git clone $GITEE
    fi

    cd $DIR

    git remote add gitee $GITEE
    git remote add github $GITHUB

    BRANCH=$(git rev-parse --abbrev-ref HEAD)

    if [ $? -ne 0 ]; then
    echo "It looks like an empty project. It generally appears at first synchronization. Trying to pulling from $GITHUB"
    git pull github
    BRANCH=$(git rev-parse --abbrev-ref HEAD)
    fi

    echo ">>> $BRANCH"

    git pull github $BRANCH
    git push -u gitee $BRANCH

    git --no-pager branch -a

}