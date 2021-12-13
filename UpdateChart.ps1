param ($releaseVersion, $token)
git checkout main
git pull
rm .\.deploy\*
helm package .\charts\profit-trailer\ --destination .deploy
cr upload -o connde -r profit-trailer -p .\.deploy\ --token $token
git checkout gh-pages
cr index -i .\index.yaml -p .deploy -o connde -r profit-trailer -c https://github.com/connde/profit-trailer/charts
git add .\index.yaml
git commit -m "release $releaseVersion"
git push origin gh-pages
git checkout main