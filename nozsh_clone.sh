#!/bin/bash

git clone https://github.com/nozsh/home
cd home && git submodule update --init --recursive && cd ..

git clone https://github.com/nozsh/blog
cd blog && git submodule update --init --recursive && cd ..

git clone https://github.com/nozsh/knowledge-base kb
cd kb && git submodule update --init --recursive && cd ..

git clone https://github.com/nozsh/xcom
