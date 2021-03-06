#!/bin/bash

touch $(pwd)/zshrc.local
touch $(pwd)/zsh_aliases.local

ln -s $(pwd)/prompt $HOME/.prompt
ln -s $(pwd)/zsh_aliases $HOME/.zsh_aliases
ln -s $(pwd)/zsh_aliases.local $HOME/.zsh_aliases.local
ln -s $(pwd)/vimrc $HOME/.vimrc
ln -s $(pwd)/zshrc.local $HOME/.zshrc.local
ln -s $(pwd)/tmux.conf $HOME/.tmux.conf
