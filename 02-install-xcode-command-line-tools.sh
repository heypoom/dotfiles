#!/usr/bin/env bash

# Install XCode
xcode-select --install

# Agree to XCode Build License
sudo xcodebuild -license

# Install C/C++ Headers for macOS
open "/Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg"