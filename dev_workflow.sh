#!/bin/bash

git checkout -b BrancheDeTest 2>/dev/null || git checkout BrancheDeTest

echo "body {background: pink;}" > ./static/style.css

git add .
git commit -m "Design: Fond rose (pink1)"

git push -u origin BrancheDeTest

bash ./sample-app.sh

sleep 10

if curl http://localhost:5050/ | grep "You are calling me from"; then
  git checkout main
  git merge BrancheDeTest
  git push origin main
  exit 0
else
  exit 1
fi
