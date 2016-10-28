#!/bin/bash

curl -sSL https://github.com/UNICORN-Project/UNICORN/archive/0.2.0.zip > ./UNICORN.zip && \
unzip -o ./UNICORN.zip
rm ./UNICORN.zip
mv -f ./UNICORN-0.2.0/* ./
rm -rf ./UNICORN-0.2.0
curl -sSL https://github.com/UNICORN-Project/lib/archive/0.2.0.zip > ./lib.zip && \
unzip -o ./lib.zip -d lib
rm ./lib.zip
mv -f ./lib-0.2.0 ./lib
rm -rf ./lib-0.2.0
