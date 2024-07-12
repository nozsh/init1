#!/bin/bash

echo "cd to nozsh/kb"
cd nozsh/kb/
echo

echo "Git Pull!"
git pull
echo

echo "hugo gen"
hugo
echo

echo "Done!"
