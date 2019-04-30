#!/usr/bin/env bash

function link_config {
   echo "Linking config/$1 -> ~/.config/$1"

   ln -s $(pwd)/config/$1 ~/.config
}

function link_file {
   echo "Linking config/$1 -> $2"

   ln -s $(pwd)/config/$1/ $2
}