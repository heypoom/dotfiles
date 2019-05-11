#!/usr/bin/env bash

# Export Public Key
keybase pgp export | gpg --import

# Export Private Key
keybase pgp export -s | gpg --allow-secret-key-import --import

