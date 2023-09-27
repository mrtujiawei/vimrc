#!/bin/bash
#ohmyzsh 配置
#Filename: scripts/ohmyzsh.sh
#Author: Mr Prince
#Date: 2022-10-17 10:00:21
#ohmyzsh 安装、配置脚本

# 下载仓库
git clone git@github.com:ohmyzsh/ohmyzsh.git --depth 1

# 安装
bash ohmyzsh/tools/install.sh

# 修改配置
# vim ~/.zshrc

# 修改
# plugins=(git tmux)
# ZSH_THEME="robbyrussell"
# plugins=(git tmux)
# source $ZSH/oh-my-zsh.sh

# 添加
# export TERM="xterm-256color"
# alias vim="nvim"
# alias vi="nvim"

# fzf 样式错乱修复 0 或 1
# export RUNEWIDTH_EASTASIAN=0



# 添加子命令补全 bash 有效
# _git_merge_to_comp() {
#     local -a git_branches
#     git_branches=("${(@f)$(git branch --format='%(refname:short)')}")
#     _describe 'command' git_branches
# }
#
# compdef _git_merge_to_comp git_merge_to

# ssh 登录后自动进入 tmux
# if [ -z "$TMUX" ]
# then
#   tmux
# fi
