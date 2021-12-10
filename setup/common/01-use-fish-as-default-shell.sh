#!/usr/bin/env bash

FISH_PATH="$(which fish)"

get-login-shell() {
  if [ `uname` == Darwin ]
  then
    dscl . -read ~/ UserShell | sed 's/UserShell: //'
  else
    grep "^$USER" /etc/passwd
  fi
}

LOGIN_SHELL="$(get-login-shell)"

if grep -qi $FISH_PATH /etc/shells
then
  echo "🟡 fish is in /etc/shells."
else
  echo $FISH_PATH | sudo tee -a /etc/shells
  echo "✅ added fish to /etc/shells!"
fi

if [[ ! $LOGIN_SHELL =~ "fish" ]]
then
  chsh -s $FISH_PATH
  echo "✅ used $FISH_PATH as the login shell!"
else
  echo "🟡 $FISH_PATH is the login shell."
fi

