#!/bin/bash

touch $(pwd)/zshrc.local
touch $(pwd)/zsh_aliases.local

ln -s $(pwd)/prompt $HOME/.prompt
ln -s $(pwd)/zsh_aliases $HOME/.zsh_aliases
ln -s $(pwd)/zsh_aliases.local $HOME/.zsh_aliases.local
ln -s $(pwd)/vimrc $HOME/.vimrc
ln -s $(pwd)/zshrc.local $HOME/.zshrc.local
ln -s $(pwd)/tmux.conf $HOME/.tmux.conf

echo "source ~/.zsh_aliases" >> ~/.zshrc
echo "source ~/.zshrc.local" >> ~/.zshrc
echo "source ~/.prompt" >> ~/.zshrc

git config --global core.editor "vim"
git config --global push.autoSetupRemote true

