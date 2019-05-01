#!/usr/bin/env bash

function setup_credentials {
    if [ ! $USER = phoomparin ]
    then
      return
    fi

    # Clone the private credentials repository.
    git clone git@github.com:phoomparin/credentials.git credentials

    source credentials/setup.sh
}