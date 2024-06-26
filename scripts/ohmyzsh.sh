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
#
# 快速切换路径
# setopt auto_cd
# cdpath=($HOME/work $HOME/.vim $HOME/.vim $HOME/github)

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
#

# fzf 配置
# export FZF_COMPLETION_TRIGGER='**'
#
# # Options to fzf command
# export FZF_COMPLETION_OPTS='--border --info=inline'
#
# # Use fd (https://github.com/sharkdp/fd) instead of the default find
# # command for listing path candidates.
# # - The first argument to the function ($1) is the base path to start traversal
# # - See the source code (completion.{bash,zsh}) for the details.
# _fzf_compgen_path() {
#   fd --hidden --follow --exclude ".git" . "$1"
# }
#
# # Use fd to generate the list for directory completion
# _fzf_compgen_dir() {
#   fd --type d --hidden --follow --exclude ".git" . "$1"
# }
#
# # Advanced customization of fzf options via _fzf_comprun function
# # - The first argument to the function is the name of the command.
# # - You should make sure to pass the rest of the arguments to fzf.
# _fzf_comprun() {
#   local command=$1
#   shift
#
#   case "$command" in
#     cd)           fzf --preview 'tree -C {} | head -200'   "$@" ;;
#     export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
#     ssh)          fzf --preview 'dig {}'                   "$@" ;;
#     *)            fzf --preview 'bat -n --color=always {}' "$@" ;;
#   esac
# }
#

# # pnpm
# export PNPM_HOME="/Users/tujiawei/Library/pnpm"
# case ":$PATH:" in
#   *":$PNPM_HOME:"*) ;;
#   *) export PATH="$PNPM_HOME:$PATH" ;;
# esac
# # pnpm end
#
# # android 配置
# export ANDROID_HOME=$HOME/Library/Android/sdk
# export PATH=$PATH:$ANDROID_HOME/emulator
# export PATH=$PATH:$ANDROID_HOME/platform-tools
# eval "$(rbenv init - zsh)"
#
# # 快速切换路径
# setopt auto_cd
# cdpath=($HOME/work $HOME/.vim $HOME/.vim $HOME/github)
#
# # maven
# export PATH=$PATH:$HOME/.maven/bin
#
#
# 合并工具改为 neovim
# ~/.gitconfig
# [merge]
#   tool = nvimdiff
# [mergetool]
#   prompt = false
#   keepBackup = false
# [mergetool "nvimdiff"]
#   layout = "LOCAL,BASE,REMOTE / MERGED"

