#!/bin/bash

curl -sS https://github.com/UNICORN-Project/UNICORN/archive/0.2.0.zip > UNICORN.zip && \
unzip UNICORN.zip
rm UNICORN.zip
curl -sS https://github.com/UNICORN-Project/lib/archive/0.2.0.zip > lib.zip && \
unzip lib.zip
rm lib.zip
