## SSH KEY
mkdir ${HOME}/.ssh
chmod 700 ~/.ssh
cp saulogit ~/.ssh/
cp saulogit.pub ~/.ssh
chmod 600 ~/.ssh/saulogit
chmod 600 ~/.ssh/saulogit.pub
eval $(ssh-agent -s)
ssh-add ~/.ssh/saulogit

#GIT TESTE
ssh -T git@github.com
ssh -vT git@gitlab.com