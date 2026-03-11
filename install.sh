#!/bin/bash
echo "⚓ Welcome to TerminalMoses"
echo "Choose your staff color (green, magenta, cyan, white):"
read -p ">> " USER_COLOR < /dev/tty

# download the clean template 
curl -sL https://raw.githubusercontent.com/brightyorcerf/terminalMoses/main/moses.zsh -o ~/moses.zsh

# map color choice to staff/plague pairs
case $USER_COLOR in
  magenta)
    STAFF="magenta"; PLAGUE="5" ;;
  cyan)
    STAFF="cyan"; PLAGUE="30" ;;
  white)
    STAFF="white"; PLAGUE="242" ;;
  *)  # Default to Hacker Green
    STAFF="green"; PLAGUE="2" ;;
esac

# apply colors
if grep -q "MOSES_STAFF=" ~/moses.zsh; then
  if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' 's/MOSES_STAFF="[^"]*"/MOSES_STAFF="'"$STAFF"'"/' ~/moses.zsh
    sed -i '' 's/MOSES_PLAGUE="[^"]*"/MOSES_PLAGUE="'"$PLAGUE"'"/' ~/moses.zsh
  else
    sed -i 's/MOSES_STAFF="[^"]*"/MOSES_STAFF="'"$STAFF"'"/' ~/moses.zsh
    sed -i 's/MOSES_PLAGUE="[^"]*"/MOSES_PLAGUE="'"$PLAGUE"'"/' ~/moses.zsh
  fi
else
  echo "⚠️  Could not find color settings in ~/moses.zsh — the template may be corrupted."
  exit 1
fi

# add source line to .zshrc if not already present
if ! grep -q "source ~/moses.zsh" ~/.zshrc; then
  echo -e "\n# TerminalMoses\nsource ~/moses.zsh" >> ~/.zshrc
fi

echo "✅ Parted! Now run: source ~/.zshrc"