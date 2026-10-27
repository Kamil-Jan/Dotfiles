#!/usr/bin/env zsh

export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$(go env GOPATH)/bin"
export PATH="$PATH:/opt/homebrew/opt/openjdk/bin"
export PATH="$PATH:/opt/homebrew/opt/postgresql@18/bin"

export EDITOR="nvim"
export VIEWER="nvim"
export TERMINAL="st"
export READER="zathura"

# Config files
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/.pythonrc"

