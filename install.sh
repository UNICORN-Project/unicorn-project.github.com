#!/bin/bash

# configのバックアップ
mkdir -p ./_tmp
mkdir -p ./__tmp
cp -rf ./_tmp/* ./__tmp/
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

wget https://github.com/UNICORN-Project/UNICORN/archive/0.4.5.zip -O UNICORN.zip && unzip -o ./UNICORN.zip
rm ./UNICORN.zip
cp -rf ./UNICORN-0.4.5/* ./
cp -rf ./UNICORN-0.4.5/.gitignore ./
rm -rf ./UNICORN-0.4.5
git clone -b 0.4.5 https://github.com/UNICORN-Project/lib.git
#wget https://github.com/UNICORN-Project/lib/archive/0.4.5.zip -O lib.zip && unzip -o ./lib.zip
#rm ./lib.zip
#mkdir ./lib
#cp -rf ./lib-0.4.5/* ./lib/
#mv ./lib-0.4.5 ./_tmp
rm -rf ./lib/.git
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
cp -rf ./__tmp/* ./_tmp/
rm -rf ./__tmp

# UNICORNのインストーラを実行
php ./lib/UNICORN
