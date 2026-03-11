#!/bin/bash
echo "⚓ Welcome to TerminalMoses"
echo "Choose your staff color (green, magenta, cyan, white):"
read -p ">> " USER_COLOR < /dev/tty

# download the clean template
curl -sL https://raw.githubusercontent.com/brightyorcerf/terminalMoses/main/moses.zsh -o ~/moses.zsh

# logic for Success/Error pairs
case $USER_COLOR in
  magenta)
    STAFF="magenta"; PLAGUE="red" ;;
  cyan)
    STAFF="cyan"; PLAGUE="30" ;;
  white)
    STAFF="white"; PLAGUE="242" ;;
  *) echo "⚠️  Unknown color '$USER_COLOR', defaulting to green"
    STAFF="green"; PLAGUE="red" ;;
esac

# set colors  
if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' "s/MOSES_STAFF=\"green\"/MOSES_STAFF=\"$STAFF\"/" ~/moses.zsh
    sed -i '' "s/MOSES_PLAGUE=\"red\"/MOSES_PLAGUE=\"$PLAGUE\"/" ~/moses.zsh
else
    sed -i "s/MOSES_STAFF=\"green\"/MOSES_STAFF=\"$STAFF\"/" ~/moses.zsh
    sed -i "s/MOSES_PLAGUE=\"red\"/MOSES_PLAGUE=\"$PLAGUE\"/" ~/moses.zsh
fi

# add to .zshrc
if ! grep -q "source ~/moses.zsh" ~/.zshrc; then
    echo -e "\n# TerminalMoses\nsource ~/moses.zsh" >> ~/.zshrc
fi

echo "✅ Parted! Now run: source ~/.zshrc"