#!/bin/bash

# configのバックアップ
mkdir -p ./__tmp
if [ -e ./lib/FrameworkPackage/core/config.xml ]; then
  cp -f ./lib/FrameworkPackage/core/config.xml ./__tmp/config.xml.bak
fi
if [ -e ./lib/FrameworkPackage/core/package.xml ]; then
  cp -f ./lib/FrameworkPackage/core/package.xml ./__tmp/package.xml.bak
fi
if [ -e ./lib/FrameworkPackage/core/FrameworkManager.config.xml ]; then
  cp -f ./lib/FrameworkManager/core/FrameworkManager.config.xml ./__tmp/FrameworkManager.config.xml.bak
fi
if [ -e ./lib/FrameworkPackage/core/FrameworkManager.package.xml ]; then
  cp -f ./lib/FrameworkManager/core/FrameworkManager.package.xml ./__tmp/FrameworkManager.package.xml.bak
fi
if [ -e ./README.md ]; then
  cp -f ./README.md ./__tmp/README.md
fi

curl -sSL https://github.com/UNICORN-Project/UNICORN/archive/0.2.0.zip > ./UNICORN.zip && \
unzip -o ./UNICORN.zip
rm ./UNICORN.zip
mv -f ./UNICORN-0.2.0/* ./
rm -rf ./UNICORN-0.2.0
curl -sSL https://github.com/UNICORN-Project/lib/archive/0.2.0.zip > ./lib.zip && \
unzip -o ./lib.zip
rm ./lib.zip
mkdir ./lib
mv -Rf ./lib-0.2.0/* ./lib/
rm -rf ./lib-0.2.0
rm -rf ./lib/.gitignore
mkdir -p ./vendor/UNICORN
cp ./README.md ./vendor/UNICORN/
cp ./license.md ./vendor/UNICORN/
mv -f ./composer.json ./vendor/UNICORN/
mv -f ./composer.phar ./vendor/UNICORN/

# configバックアップの初期化
if [ ! -e ./__tmp/config.xml.bak ]; then
  cp -f ./lib/FrameworkPackage/core/config.xml ./__tmp/config.xml.bak
fi
if [ ! -e ./__tmp/package.xml.bak ]; then
  cp -f ./lib/FrameworkPackage/core/package.xml ./__tmp/package.xml.bak
fi
if [ ! -e ./__tmp/FrameworkManager.config.xml.bak ]; then
  cp -f ./lib/FrameworkManager/core/FrameworkManager.config.xml ./__tmp/FrameworkManager.config.xml.bak
fi
if [ ! -e ./__tmp/FrameworkManager.package.xml.bak ]; then
  cp -f ./lib/FrameworkManager/core/FrameworkManager.package.xml ./__tmp/FrameworkManager.package.xml.bak
fi
if [ -e ./__tmp/README.md ]; then
  mv -f ./__tmp/README.md ./__tmp/README.md
fi
mv -Rf ./__tmp ./_tmp

# UNICORNのインストーラを実行
php ./lib/UNICORN
