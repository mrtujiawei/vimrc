# vimrc #

我的 vim 配置文件

打算搞一个单独的配置文件和文档

## 插件查找 ##

[Vim Awesome](https://vimawesome.com/)

## 代码跳转 ##

```vimrc
"
" 通过gd（跳转到函数声明）, 
" gy（跳转到类型声明）, 
" gi（跳转到函数/类型实现）, 
" gr（查找所有函数/类型的引用并跳转）, 
" ctrl+o（返回之前位置）
" 键映射
"	:map		普通，可视模式及操作符等待模式
"	:vmap		可视模式
"	:nmap		普通模式
"	:omap		操作符等待模式
"	:map!		插入和命令行模式
"	:imap		插入模式
"	:cmap		命令行模式
"
" :noremap	普通，可视和操作符等待模式
" :vnoremap	可视模式
" :nnoremap	普通模式
" :onoremap	操作符等待模式
" :noremap!	插入和命令行模式
" :inoremap	插入模式
" :cnoremap	命令行模式
"
" map 自动补全行为
"
" usr_40
" 定义命令行命令
" :command
"	-nargs=0	无参数
"	-nargs=1	一个参数
"	-nargs=*	任意数目的参数
"	-nargs=?	没有或一个参数
"	-nargs=+	一个或更多参数
"
" 自动命令
" :autocmd [group] {events} {file_pattern} [nested] {command}
"
" 内置函数 usr_41, 这里包含了vimrc的大部分信息
" range 函数内部变量 a:firstline a:lastline 
" 可变参数 ... a:1 a:2...
"
" $VIMRUNTIME 有一些自带的插件和配置，在这个目录下
" vsp $VIMRUNTIME/ + tab 可以显示具体路径
"
" install 安装 usr_90
" 
" buffer-variable    b:	  局部于当前缓冲区。
" window-variable    w:	  局部于当前窗口。
" tabpage-variable   t:	  局部于当前标签页。
" global-variable    g:	  全局。
" local-variable     l:	  局部于函数。
" script-variable    s:	  局部于 |:source| 的 Vim 脚本。
" function-argument  a:	  函数参数 (只限于函数内使用)。
" vim-variable       v:	  Vim 预定义的全局变量。
"
"
" eval 一些内部常量，函数
" index 常用操作,类似目录
" message 错误类型在这里找
" options 所有配置项
" quickref 快速索引，目录
" popup 弹出层，深入一下很重要，但内容太多
"
" ======= 全局配置 =======
" 插件，临时文件路径
" let s:vimConfigPath = "/opt"


```
