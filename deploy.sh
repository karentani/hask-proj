git add . &&
git commit -m $1 &&



#git checkout master
#git merge origin/master --allow-unrelated-histories
#git push --force -u origin master&&

git push -u origin master&&
ssh root@localhost <<EOF
cd aulaadsn &&
git pull origin master &&
stack build &&
lsof -i:3000 -Fp | sed 's/^p//' | head -n -1 | xargs kill -9;
nohup stack exec aulahaskell > /dev/null
echo "deploy finished"
EOF