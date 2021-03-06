#!/bin/bash

set -e

mkdir -p ./static/docs/0/

rm -rf ./tmp
mkdir ./tmp
cd ./tmp

git clone https://github.com/bootique/bootique.git
git clone https://github.com/bootique/bootique-logback.git
git clone https://github.com/bootique/bootique-jetty.git

mkdir -p ../content/docs/
cp -R ./bootique/docs/* ../content/docs/

cd ./bootique-logback/bootique-logback-docs/
mvn clean package
cp -R ./target/site/* ../../../static/docs/0/

cd ../../bootique-jetty/bootique-jetty-docs
mvn clean package
cp -R ./target/site/* ../../../static/docs/0/
