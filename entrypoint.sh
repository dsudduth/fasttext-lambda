#!/bin/bash
#
# Creates an AWS Lambda Layer for the latest version of fastText.

LAYER_DIR='python/lib/python3.8/site-packages'
TEMP_DIR="tmp/$LAYER_DIR"
FASTTEXT_ZIP='fasttext-layer.zip'

# Fail on errors.
set -e

echo 'Creating temp dir for fasttext package and its dependencies'
mkdir -p $TEMP_DIR

echo 'Cloning the fastText repository'
git clone https://github.com/facebookresearch/fastText.git

echo 'Building fastText'
pip3.8 install ./fastText -t $TEMP_DIR

echo 'Packaging fastText'
(cd ./tmp && zip -r $FASTTEXT_ZIP ./python)

echo 'Finalizing build'
mkdir -p ./src/dist/layers
cp ./tmp/$FASTTEXT_ZIP ./src/dist/layers/fasttext.zip

echo 'All set!'
