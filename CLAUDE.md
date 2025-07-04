# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal dotfiles repository managed by [Chezmoi](https://www.chezmoi.io). It contains configuration files for various development tools, editors, and system preferences across macOS and Linux environments.

## Key Architecture

### Directory Structure
- `config/` - Main configuration directory containing dotfiles
  - `dot_config/` - XDG config directory (~/.config)
  - `dot_claude/` - Claude-specific configurations and commands
  - `dot_hammerspoon/` - Hammerspoon window manager config
  - `vscode/` - VS Code settings and keybindings
- `setup/` - Bootstrap and installation scripts
  - `macos/` - macOS-specific setup scripts
  - `linux/` - Linux-specific setup scripts
  - `shared/` - Cross-platform setup scripts
- `raycast/` - Raycast scripts and extensions
- `widgets/` - Custom widgets and utilities

### Main Components

**Editor Configurations:**
- Multiple Neovim distributions: LunarVim, NVChad, LazyVim, AstroNvim, and Kickstart
- VS Code with custom settings and keybindings
- Vim configurations for different contexts

**Shell and Terminal:**
- Fish shell as primary shell with custom functions and abbreviations
- Tmux configuration with custom key bindings
- Starship prompt configuration
- Various terminal emulators: Alacritty, Kitty, Ghostty

**Window Management:**
- Hammerspoon for macOS window management
- Phoenix WM configuration (TypeScript-based)
- Aerospace for tiling window management

**Development Tools:**
- Git configuration with templates
- Various language-specific configurations (Python, Ruby, Elixir, etc.)
- Database CLI tools (pgcli, litecli, mycli)

## Common Commands

### Docker Operations
- `make build-image` - Build the dotfiles Docker image
- `make run-image` - Run the Docker container interactively
- `make release-image` - Build and push the Docker image
- `make clean` - Clean git ignored files

### Phoenix WM (TypeScript project in config/dot_config/phoenix/)
- `yarn build` - Build the Phoenix configuration
- `yarn watch` - Build and watch for changes
- `yarn lint` - Run TSLint on TypeScript files
- `yarn format` - Format TypeScript files with Prettier

### Setup and Bootstrap
- Scripts in `setup/` directory handle installation and configuration
- `setup/macos/` contains macOS-specific setup including Homebrew installation
- `setup/linux/` contains Linux-specific setup
- `setup/shared/` contains cross-platform setup scripts

## Chezmoi Integration

This repository is designed to be used with Chezmoi:
- Template files use `.tmpl` extension for dynamic configuration
- Private files are prefixed with `private_`
- Executable files are prefixed with `executable_`
- Symlinks are prefixed with `symlink_`
- Dot files are prefixed with `dot_` (represents files starting with `.`)

## Development Workflow

When working with this repository:
1. Configuration changes should be made to the source files in this repository
2. Use `chezmoi apply` to apply changes to the actual dotfiles
3. Test changes in the appropriate environment before committing
4. Docker image can be used to test the full configuration in isolation

## Important Notes

- This is a personal configuration repository - modifications should respect the owner's preferences
- The configuration supports both macOS and Linux environments
- Multiple editor configurations are maintained simultaneously
- Phoenix WM configuration is written in TypeScript and requires compilation