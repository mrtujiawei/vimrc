#!/bin/bash
#Filename: ~/.vim/scripts/install.sh
#Author: Mr Prince
#Date: 2022-02-25 10:45:19

# 放在下面的原因是安装的时候会进入vim
# 后面的脚本就执行不下去了
# 安装vundle vim包管理工具
# git clone https://github.com/VundleVim/Vundle.vim.git --depth 1 ~/.vim/bundle/Vundle.vim
rm ../autoload/plug.vim -rf
git clone https://github.com/junegunn/vim-plug.git --depth 1 ~/.vim/bundle/vim-plug
cp ~/.vim/bundle/vim-plug/plug.vim ~/.vim/autoload/plug.vim

vim +PluginInstall +qall && vim -c ':call mkdp#util#install()' +qall

exit 0

# coc-nvim 需要手动更新一下
cd ~/.vim/bundle/coc.nvim/
yarn
cd -

# vim-jsdoc 需要手动安装一下
cd ~/.vim/bundle/vim-jsdoc/
make install
cd -
