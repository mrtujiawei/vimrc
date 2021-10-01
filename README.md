# vimrc #

我的 vim 配置文件

打算搞一个单独的配置文件和文档

## vim 安装 ##

`help usr_90`

[vim 安装脚本](https://raw.githubusercontent.com/Mr-Promise/shell/main/src/install-vim.sh)

## 插件查找 ##

[Vim Awesome](https://vimawesome.com/)

## 配置项 ##

查看所以配置项 `options`

## 代码跳转 ##

```vimrc
" 跳转到光标下变量的局部声明位置
normal gd

" 跳转到类型声明 
normal gy

" 跳转到函数/类型实现 
normal gi

" 查找所有函数/类型的引用并跳转 
normal gr

" 返回之前位置
ctrl+o

```

## 键映射 ##

所有map都可以通过 `[mode]{nore}map` 取消二次映射

```vimrc

" 普通，可视模式及操作符等待模式
map		

" 可视模式
vmap		

" 普通模式
nmap		

" 操作符等待模式
omap		

" 插入和命令行模式
map!		

" 插入模式
imap		

" 命令行模式
cmap		

```

if 自动加()
```
func Eatchar(pat)
   let c = nr2char(getchar(0))
   return (c =~ a:pat) ? '' : c
endfunc
iabbr <silent> if if ()<Left><C-R>=Eatchar('\s')<CR>
```
## 自定义命令行命令 ##

`usr_40`


```vimrc
:command
-nargs=0	" 无参数
-nargs=1	" 一个参数
-nargs=*	" 任意数目的参数
-nargs=?	" 没有或一个参数
-nargs=+	" 一个或更多参数

自动命令
:autocmd [group] {events} {file_pattern} [nested] {command}

```

## vimscript ##

### 目录 ###

`help usr_41` 内置函数 , 这里包含了vimrc的大部分信息

`$VIMRUNTIME` 有一些自带的插件和配置，在这个目录下

`vsp $VIMRUNTIME/` + tab 可以显示具体路径

`eval` 一些内部常量，函数
`index` 常用操作,类似目录
`message` 错误类型在这里找
`options` 所有配置项
`quickref` 快速索引，目录
`popup` 弹出层，深入一下很重要，但内容太多

### 变量类型 ###

| 变量类型          | 变量修饰 | 变量范围              |
| ----------------- | -------- | --------------------- |
| buffer-variable   | b:       | 局部于当前缓冲区      |
| window-variable   | w:       | 局部于当前窗口        |
| tabpage-variable  | t:       | 局部于当前标签页      |
| global-variable   | g:       | 全局                  |
| local-variable    | l:       | 局部于函数            |
| script-variable   | s:       | 局部于脚本            |
| function-argument | a:       | 函数参数,局部于函数内 |
| vim-variable      | v:       | Vim 预定义的全局变量  |

### 函数 ###

`range` 函数内部变量 `a:firstline` `a:lastline`
可变参数 ... `a:1` `a:2` ...


### 加载其他脚本 ###

```vimrc
" 如果文件存在,加载全局配置文件

let path = '/etc/vim/vimrc.local'

if filereadable(path)
  source path
endif
```
