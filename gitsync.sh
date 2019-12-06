function sync {

    GITHUB="$1"
    GITEE="$2"

    echo "Synchronizing from $GITHUB to $GITEE"

    DIR=$(echo $GITHUB | cut -d '/' -f 2 | sed s/.git//g)

    if [ ! -d "$DIR" ]; then
        git clone $GITEE
    fi

    cd $DIR

    BRANCH=$(git rev-parse --abbrev-ref HEAD)

    if [ $? -ne 0 ]; then
        echo "It looks like an empty project. It generally appears at first synchronization. Trying to pulling from $GITHUB"
        cd ..
        rm -rf $DIR
        git clone $GITHUB
        cd $DIR
        BRANCH=$(git rev-parse --abbrev-ref HEAD)
    fi

    echo "Current branch: $BRANCH"

    git remote add gitee $GITEE
    git remote add github $GITHUB

    git pull github $BRANCH
    git push -u gitee $BRANCH

    git --no-pager branch -a

}