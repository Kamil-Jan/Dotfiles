#!/usr/bin/env zsh

export PATH="$PATH:${$(find ~/.local/bin -type d -printf %p:)%%:}"
export EDITOR="nvim"
export VIEWER="nvim"
export VISUAL="nvim"
export TERMINAL="alacritty"
export READER="mupdf"

# Config files
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/.pythonrc"
