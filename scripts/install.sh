#!/bin/bash
# vim zsh 配置
#Filename: scripts/ohmyzsh-install.sh
#Author: Mr Prince
#Date: 2022-10-17 10:00:21
#ohmyzsh 安装、配置脚本

function neovim_install() {
  git clone https://github.com/neovim/neovim
  cd neovim 
  git checkout stable
  make CMAKE_BUILD_TYPE=RelWithDebInfo
  sudo make install
}

function zsh_install() {
  # 下载仓库
  git clone git@github.com:ohmyzsh/ohmyzsh.git --depth 1

  # 安装
  bash ohmyzsh/tools/install.sh
}


function nvim_install() {
  # 建立 neovim 配置 的软连接
  mkdir -p ~/.config/
  cp -s ~/.vim ~/.config/nvim
  vim +PlugInstall +qall

  # tmux 配置
  ln -s ~/.vim/.tmux.conf ~/.tmux.conf

  # zsh 配置
  ln -s ~/.vim/.zshrc ~/.zshrc

  # neovim 配置 mundo 支持
  # pip install pynvim
}

# neovim_install
zsh_install
nvim_install
