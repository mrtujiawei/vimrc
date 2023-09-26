#!/bin/bash
#Filename: ~/.vim/scripts/install.sh
#Author: Mr Prince
#Date: 2022-02-25 10:45:19
#配置安装脚本

vim +PlugInstall +qall

# 建立 neovim 配置 的软连接
mkdir -p ~/.config/
cp -s ~/.vim ~/.config/nvim

# tmux 配置
ln -s ~/.vim/.tmux.conf .tmux.conf

# neovim 配置 mundo 支持
# pip install pynvim
