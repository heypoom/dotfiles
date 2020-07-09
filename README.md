# Phoomparin's Dotfiles!

![Build docker image](https://github.com/phoomparin/dotfiles/workflows/Build%20docker%20image/badge.svg?branch=master)

This is my dotfiles, which includes everything I use on my macbook. It installs macOS apps and CLI tools via Homebrew, contains my configuration for CLI apps (e.g. Fish, Tmux, Neovim), and bootstraps the entire machine from scratch!

This configuration supports both macOS and Linux, and also contains a docker image for use everywhere as well. The docker image is automatically built by GitHub Actions on every push. 💯

## Installation for macOS/Linux

Just clone the repo, and run the `./install` shell script! That's it. This should work on both

```
# Clone and cd into the dotfiles repo
cd ~
git clone https://github.com/phoomparin/dotfiles
cd dotfiles

# One-line install!
./install
```

## Usage with Docker

Simply run `docker run -it phoomparin/dotfiles` on any machine with Docker installed. Easy as 🍰!
