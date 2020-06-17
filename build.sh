#!/bin/sh

# $1 = version to download

BASE_URL=https://github.com/beyondcode/expose/archive

DOWNLOAD_FOLDER=expose-$1
DOWNLOAD_FILE=$1.zip

function downloadSource() {
    cd src    

    rm -rf $DOWNLOAD_FOLDER
    rm -f $DOWNLOAD_FILE

    echo Downloading from $BASE_URL/$DOWNLOAD_FILE
    wget $BASE_URL/$DOWNLOAD_FILE

    unzip $DOWNLOAD_FILE

    cd ..
}

downloadSource

echo Source code lives in `pwd`/src/$DOWNLOAD_FOLDER

docker build -t cangelis/expose -t cangelis/expose:$1 --build-arg SRC=src/$DOWNLOAD_FOLDER .
