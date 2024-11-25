#!/bin/bash

git clone -b v2 https://github.com/nozsh/home
cd home && git submodule update --init --recursive && cd ..

git clone https://github.com/nozsh/blog
cd blog && git submodule update --init --recursive && cd ..

git clone -b v2 https://github.com/nozsh/knowledge-base kb
cd kb && git submodule update --init --recursive && cd ..
