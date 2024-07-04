#!/bin/bash

echo "cd to nozsh/blog"
cd nozsh/blog/
echo

echo "Git Pull!"
git pull
echo

echo "hugo gen"
hugo
echo

echo "Done!"
