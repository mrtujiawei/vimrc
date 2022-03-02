#!/bin/bash
#Filename: ~/.vim/scripts/install.sh
#Author: Mr Prince
#Date: 2022-02-25 10:45:19

# 目录清理
rm -rf ~/.vim/autoload/plug.vim ~/.vim/bundle/vim-plug
git clone https://github.com/junegunn/vim-plug.git --depth 1 ~/.vim/bundle/vim-plug
cp ~/.vim/bundle/vim-plug/plug.vim ~/.vim/autoload/plug.vim

vim +PlugInstall +qall
