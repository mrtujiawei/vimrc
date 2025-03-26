#!/usr/bin/env bash

git config --global color.ui true
git config --global core.editor nvim
git config --global core.filemode true
git config --global core.ignorecase true
git config --global diff.algorithm patience
git config --global init.defaultBranch main
git config --global merge.tool nvimdiff
git config --global mergetool.keepBackup false
git config --global mergetool.nvimdiff.layout "LOCAL,BASE,REMOTE / MERGED"
git config --global mergetool.prompt false
git config --global user.email jiaweitu@marcothepolo.com
git config --global user.name tujiawei
git config --global push.autoSetupRemote true
git config --global pull.rebase false
git config --global commit.verbose true
git config --global help.autocorrect prompt
git config --global diff.colorMoved default

# 暂时不需要的功能
# 清理远程分支
# git config --global remote.origin.prune true
# 压缩启发 ？ 据说默认开启的
# git config --global diff.compactionHeuristic true
# 输出显示工具，默认就行
# git config --global core.pager delta
# 没有 delta 命令， 估计不能用
# git config --global interactive.diffFilter "delta --color-only"
# 没找到这个配置
# git config --global delta.navigate true
# 冲突的表现形式
# git config --global merge.conflictstyle zdiff3
# push 时 把所有 tag 推送到 github
# git config --global push.followTags true
