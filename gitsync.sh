function sync {

    GITHUB="$1"
    GITEE="$2"

    echo "Synchronizing from $GITHUB to $GITEE"

    if [[ $GITHUB == https* ]] ;
    then
        DIR=$(echo $GITHUB | cut -d '/' -f 5 | sed s/.git//g)
    else
        DIR=$(echo $GITHUB | cut -d '/' -f 2 | sed s/.git//g)
    fi

    if [ ! -d "$DIR" ]; then
        echo "$DIR is not found, trying to clone the repository from ${GITEE}"
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

    git pull github
    git branch -a

    git --no-pager branch -a | grep github | sed 's/*//g' | sed 's/ //g' | sed 's/remotes\/github\///g'
    readarray -t BRANCHES < <(git --no-pager branch -a | grep github | sed 's/*//g' | sed 's/ //g' | sed 's/remotes\/github\///g')
    for BRANCH in "${BRANCHES[@]}"
    do
        echo "Synchronizing github/$BRANCH"
        git checkout -t github/$BRANCH || git checkout $BRANCH
        git status
        git pull github $BRANCH
        git push -u gitee $BRANCH
    done


}
