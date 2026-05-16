#!/bin/bash
echo "⚓ Uninstalling TerminalMoses..."

# Remove source line from .zshrc
if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' '/# TerminalMoses/d' ~/.zshrc
    sed -i '' '/source ~\/moses.zsh/d' ~/.zshrc
else
    sed -i '/# TerminalMoses/d' ~/.zshrc
    sed -i '/source ~\/moses.zsh/d' ~/.zshrc
fi

# Remove moses.zsh
rm -f ~/moses.zsh

unset MOSES_LOADED

echo "TerminalMoses uninstalled successfully! (Restart your terminal or run 'source ~/.zshrc')"