if [ -d "wiki" ]; then
  cd wiki
  git pull
else
  git clone git@github.com:Requarks/wiki.git
  cd wiki
fi

git remote add gitee git@gitee.com:gitsync/wiki.git
git push gitee master