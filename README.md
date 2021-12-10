# Poom's dotfiles configuration.

Hello! Here is my dotfiles, aka my personal configuration of tools I use daily.

I hope you like it!

## How to use this dotfiles locally?

I use [Chezmoi](https://www.chezmoi.io) to bootstrap this dotfiles on any machine.
You can fork this repo, and replace `heypoom` with your GitHub username.

`sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply heypoom`

## How to use this dotfiles with Docker?

Run `docker run -it phoomparin/dotfiles` on your machine.
Alternatively, you can use the `FROM phoomparin/dotfiles` directive in your Dockerfile to customize it.

This repo has a GitHub Actions that builds a brand new Docker image on every commit!

# My Tools

Here's a non-exhaustive list of everything I used in my personal dotfiles.

- [Chezmoi](https://www.chezmoi.io) as dotfiles manager.

**Editor**

- [Neovim](https://neovim.io) as the primary editor on the command line.

  - [LunarVim](https://www.lunarvim.org) as primary neovim distribution.
  - [NVChad](https://nvchad.github.io) as secondary neovim distribution.

**Shell**

- [Fish Shell](https://fishshell.com) as the primary shell.
- [Tmux](https://github.com/tmux/tmux) as the terminal multiplexer.

**Apps**

- [Obsidian](https://obsidian.md) as the primary knowledge base for writing notes and writings.

- More TBA
