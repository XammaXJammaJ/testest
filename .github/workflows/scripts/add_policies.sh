#!/bin/bash
# Add policies to the current branch

BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)

git config --global user.email "jamelabdelhafidh@hotmail.com"
git config --global user.name "XammaXJammaJ"

echo "TOKEN:"
echo $GH_TOKEN

echo "Showing policies"
curl -X GET https://api.github.com/repos/XammaXJammaJ/testest/branches/${BRANCH_NAME}/protection/required_pull_request_reviews \
  "Authorization: Bearer $GH_TOKEN" \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \

echo "Setting policy"

# Add policy 1: Require pull request before merging
# ...
curl -X PUT https://api.github.com/repos/XammaXJammaJ/testest/branches/${BRANCH_NAME}/protection/required_pull_request_reviews \
-H "Authorization: Bearer $GH_TOKEN" \
-H "Content-Type: application/json" \
-d '{"required_pull_request_reviews":{"require_code_owner_reviews":false}}'

# Add policy 2
# ...

# Commit and push changes
git commit -am "Added policies to $BRANCH_NAME"
git push origin $BRANCH_NAME
