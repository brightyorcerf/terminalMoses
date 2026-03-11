#!/bin/bash
echo "⚓ Welcome to TerminalMoses"
# The < /dev/tty is the secret sauce that makes curl work
echo "Choose your staff color (green, magenta, cyan, white):"
read -p ">> " USER_COLOR < /dev/tty

# 1. Download
curl -sL https://raw.githubusercontent.com/brightyorcerf/terminalMoses/main/moses.zsh -o ~/moses.zsh

# 2. Set Color (Mac/Linux compatible)
if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' "s/MOSES_STAFF=\"green\"/MOSES_STAFF=\"$USER_COLOR\"/" ~/moses.zsh
else
    sed -i "s/MOSES_STAFF=\"green\"/MOSES_STAFF=\"$USER_COLOR\"/" ~/moses.zsh
fi

# 3. Add to .zshrc
if ! grep -q "source ~/moses.zsh" ~/.zshrc; then
    echo -e "\n# TerminalMoses\nsource ~/moses.zsh" >> ~/.zshrc
fi

echo "✅ Parted! Now run: source ~/.zshrc"