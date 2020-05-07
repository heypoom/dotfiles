#!/usr/bin/env bash

function clone_credentials_repo {
    if test -e ./credentials
    then
      echo "Credentials directory is already cloned."

      return
    fi

    # Clone the private credentials repository.
    git clone git@github.com:phoomparin/credentials.git credentials
}

function setup_credentials {
    if [ ! $USER = phoomparin ]
    then
      echo "User $USER is not phoomparin. Not setting up private tasks."

      return
    fi

    clone_credentials_repo

    pushd credentials
    source setup.sh
    popd
}

setup_credentials