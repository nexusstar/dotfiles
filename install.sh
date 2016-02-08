#!/bin/bash
DOTFILES=$HOME/tools/dotfiles

echo "Installing dotfiles"

echo "Initializing submodule(s)"
git submodule update --init --recursive

if [ "$(uname)" == "Linux" ]; then
  echo "Running on Linux"

  echo "Installing/Updating nvm"
  if hash curl 2>/dev/null; then
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.2/install.sh | bash
  else
    sudo apt-get update && sudo apt-get install curl
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.2/install.sh | bash
  fi

  echo "Installing node with nvm"
  exec bash
  nvm install stable
  nvm alias default stable

fi

echo "Installing vim:plug"
echo -e "\n\nInstalling to ~/tools/dotfiles/vim/.vim"
echo "=============================="
if [ ! -d $DOTFILES/vim/.vim/autoload ]; then
  curl -fLo $DOTFILES/vim/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
