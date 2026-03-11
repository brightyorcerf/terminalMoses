#!/bin/bash
# install.sh - TerminalMoses Interactive Installer

echo "⚓ Welcome to TerminalMoses"
echo "Choose your staff color (green, magenta, cyan, yellow, white, or a number 0-255):"
read -p ">> " USER_COLOR

# 1. Download the core script
curl -sL https://raw.githubusercontent.com/brightyorcerf/terminalMoses/main/moses.zsh -o ~/moses.zsh

# 2. Inject the user's color choice
# The double quotes allow the variable to be swapped into the file
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac version
    sed -i '' "s/MOSES_STAFF=\"green\"/MOSES_STAFF=\"$USER_COLOR\"/" ~/moses.zsh
else
    # Linux version
    sed -i "s/MOSES_STAFF=\"green\"/MOSES_STAFF=\"$USER_COLOR\"/" ~/moses.zsh
fi

# 3. Add to .zshrc if not already there
if ! grep -q "source ~/moses.zsh" ~/.zshrc; then
    echo -e "\n# TerminalMoses\nsource ~/moses.zsh" >> ~/.zshrc
fi

echo "Parting the sea in $USER_COLOR! Restart your terminal or run 'source ~/.zshrc'"