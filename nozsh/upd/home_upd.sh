#!/bin/bash

echo "cd to nozsh/home"
cd nozsh/home/
echo

echo "Del old"
rm -rf public/ resources/
echo

echo "Git Pull!"
git pull
echo

echo "hugo gen"
hugo
echo

echo "Done!"
