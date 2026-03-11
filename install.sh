#!/bin/bash
# install.sh - TerminalMoses Installer

# 1. Download the script from your actual repo
curl -sL https://raw.githubusercontent.com/brightyorcerf/terminalMoses/main/moses.zsh -o ~/moses.zsh

# 2. Append to .zshrc
if ! grep -q "source ~/moses.zsh" ~/.zshrc; then
    echo -e "\n# TerminalMoses: Parting the sea of logs\nsource ~/moses.zsh" >> ~/.zshrc
    echo "✅ TerminalMoses installed! Restart your terminal or run: source ~/.zshrc"
else
    echo "⚓ TerminalMoses is already in your .zshrc."
fi