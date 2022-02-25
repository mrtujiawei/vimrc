#!/bin/bash
#Filename: ~/.vim/scripts/install.sh
#Author: Mr Prince
#Date: 2022-02-24 17:51:24
# vim安装脚本
# 需要有root权限
# 最好是什么多没做的时候下载
# 等切换完镜像再下载就会出现部分依赖安装失败
# 安装教程: https://github.com/vim/vim/blob/master/src/INSTALL

# 更新源
apt update

# 下载依赖，如果有了再安装一遍也没问题
# libxt-dev: 支持剪切板，并且这是gui的依赖项
# libgtk-3-dev: 支持gui,需要支持一下字体
# libpython3-dev: 支持 python
# vim-gtk: 为了剪切板,安装时选择中国，上海 如果没有界面，没必要用这个了
apt install -y git make clang libtool-bin libxt-dev libgtk-3-dev libpython3-dev vim-gtk

git clone https://github.com/vim/vim.git --depth 1 ~/vim
cd ~/vim/src

# 生成随机数
FILENAME=`cat /proc/sys/kernel/random/uuid`

# 支持 python
# 在Makefil里 把下面这行的注释去掉
# #CONF_OPT_PYTHON3 = --enable-python3interp
sed -e 's/^#\(CONF_OPT_PYTHON3 = --enable-python3interp\)$/\1/' Makefile > "$FILENAME"
mv "$FILENAME" Makefile
make reconfig
make
make install
cd -
rm -rf ~/vim
