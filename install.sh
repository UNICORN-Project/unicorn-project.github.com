#!/bin/bash

# configのバックアップ
if [ -e ./lib/FrameworkPackage/core/config.xml ]; then
  cp -f ./lib/FrameworkPackage/core/config.xml ./_tmp/config.xml.bak
fi
if [ -e ./lib/FrameworkPackage/core/config.xml ]; then
  cp -f ./lib/FrameworkPackage/core/package.xml ./_tmp/package.xml.bak
fi
if [ -e ./lib/FrameworkPackage/core/FrameworkManager.config.xml ]; then
  cp -f ./lib/FrameworkManager/core/FrameworkManager.config.xml ./_tmp/FrameworkManager.config.xml.bak
fi
if [ -e ./lib/FrameworkPackage/core/FrameworkManager.package.xml ]; then
  cp -f ./lib/FrameworkManager/core/FrameworkManager.package.xml ./_tmp/FrameworkManager.package.xml.bak
fi
if [ -e ./README.md ]; then
  cp -f ./README.md ./_tmp/README.md
fi

curl -sSL https://github.com/UNICORN-Project/UNICORN/archive/0.2.0.zip > ./UNICORN.zip && \
unzip -o ./UNICORN.zip
rm ./UNICORN.zip
mv -f ./UNICORN-0.2.0/* ./
rm -rf ./UNICORN-0.2.0
curl -sSL https://github.com/UNICORN-Project/lib/archive/0.2.0.zip > ./lib.zip && \
unzip -o ./lib.zip
rm ./lib.zip
mv -f ./lib-0.2.0 ./lib
rm -rf ./lib-0.2.0
rm -rf ./lib/.gitignore
mkdir -p ./vendor/UNICORN
cp ./README.md ./vendor/UNICORN/
cp ./license.md ./vendor/UNICORN/
mv -f ./composer.json ./vendor/UNICORN/
mv -f ./composer.phar ./vendor/UNICORN/

# configバックアップの初期化
if [ ! -e ./_tmp/config.xml.bak ]; then
  cp -f ./lib/FrameworkPackage/core/config.xml ./_tmp/config.xml.bak
fi
if [ ! -e ./_tmp/package.xml.bak ]; then
  cp -f ./lib/FrameworkPackage/core/package.xml ./_tmp/package.xml.bak
fi
if [ ! -e ./_tmp/FrameworkManager.config.xml.bak ]; then
  cp -f ./lib/FrameworkManager/core/FrameworkManager.config.xml ./_tmp/FrameworkManager.config.xml.bak
fi
if [ ! -e ./_tmp/FrameworkManager.package.xml.bak ]; then
  cp -f ./lib/FrameworkManager/core/FrameworkManager.package.xml ./_tmp/FrameworkManager.package.xml.bak
fi
if [ -e ./_tmp/README.md ]; then
  mv -f ./_tmp/README.md ./_tmp/README.md
fi

# UNICORNのインストーラを実行
php ./lib/UNICORN
