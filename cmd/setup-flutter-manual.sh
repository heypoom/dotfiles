#!/usr/bin/env bash

WORKSPACE=~/lib

mkdir -p $WORKSPACE
pushd $WORKSPACE

wget -o "flutter.zip" "https://storage.googleapis.com/flutter_infra/releases/stable/macos/flutter_macos_v1.2.1-stable.zip"

unzip flutter.zip

rm flutter.zip

flutter precache

flutter doctor

popd
