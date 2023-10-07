#!/usr/bin/env sh

set -e

# npm run build
npm run build --env.VERSION=1.1.0

cd dist

git init
git add -A
git commit -m 'deploy'

git push -f git@github.com:jerry914/fire-dog-app.git master:gh-pages

cd -