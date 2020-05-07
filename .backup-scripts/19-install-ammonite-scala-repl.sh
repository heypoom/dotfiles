#!/usr/bin/env bash

BIN_PATH="/usr/local/bin/amm"
RELEASE_URL="https://github.com/lihaoyi/Ammonite/releases/download/1.6.6/2.12-1.6.6"

sudo wget -O $BIN_PATH $RELEASE_URL

sudo chmod +x $BIN_PATH

