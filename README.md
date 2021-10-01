# vimrc #

我的 vim 配置文件

打算搞一个单独的配置文件和文档

## vim 安装 ##

`help usr_90`

[vim 安装脚本](https://raw.githubusercontent.com/Mr-Promise/shell/main/src/install-vim.sh)

## 插件查找 ##

[Vim Awesome](https://vimawesome.com/)

## 配置项 ##

查看所有配置项 `normal options`

## 代码跳转 ##

```vim
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

```vim

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


```vim
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

```vim
" 如果文件存在,加载全局配置文件

let path = '/etc/vim/vimrc.local'

if filereadable(path)
  source path
endif
```
### 颜色配置项 ###

`help hi`

设置终端选项

```vim
" 终端彩色支持
" setenv 不一定所有linux版本都支持
" setenv TERM xterm-color
```

```shell
TERM=xterm-color
export TERM
```

```vim
"	term		黑白终端的属性
"	cterm		彩色终端的属性
"	ctermfg		彩色终端的前景色
"	ctermbg		彩色终端的背景色
"	gui		GUI 版本属性
"	guifg		GUI 版本的前景色
"	guibg		GUI 版本的背景色
```

一堆颜色配置

```vim
hi Normal guifg=#e2e2e5 guibg=#202020 gui=none ctermfg=253 ctermbg=234
hi Normal ctermbg=DarkGrey ctermfg=White guifg=White guibg=grey20

" Groups used in the 'highlight' and 'guicursor' options default value.
hi ErrorMsg term=standout ctermbg=DarkRed ctermfg=White guibg=Red guifg=White
hi IncSearch term=reverse cterm=reverse gui=reverse
hi ModeMsg term=bold cterm=bold gui=bold
hi StatusLine term=reverse,bold cterm=reverse,bold gui=reverse,bold
hi StatusLineNC term=reverse cterm=reverse gui=reverse
hi VertSplit term=reverse cterm=reverse gui=reverse
hi Visual term=reverse cterm=reverse ctermbg=black guibg=grey60
hi VisualNOS term=underline,bold cterm=underline,bold gui=underline,bold
hi DiffText term=reverse cterm=bold ctermbg=Red gui=bold guibg=Red
hi Cursor guibg=Green guifg=Black
hi lCursor guibg=Cyan guifg=Black
hi Directory term=bold ctermfg=LightCyan guifg=Cyan
hi Directory term=bold ctermfg=lightblue guifg=Cyan
hi LineNr term=underline ctermfg=black ctermfg=darkgrey guifg=Yellow
hi MoreMsg term=bold ctermfg=LightGreen gui=bold guifg=SeaGreen
hi NonText term=bold ctermfg=LightBlue gui=bold guifg=LightBlue guibg=grey30
hi Question term=standout ctermfg=LightGreen gui=bold guifg=Green
hi Search term=reverse ctermbg=Yellow ctermfg=Black guibg=Yellow guifg=Black
hi SpecialKey term=bold ctermfg=LightBlue guifg=Cyan
hi Title term=bold ctermfg=LightMagenta gui=bold guifg=Magenta
hi WarningMsg term=standout ctermfg=LightRed guifg=Red
hi WildMenu term=standout ctermbg=Yellow ctermfg=Black guibg=Yellow guifg=Black
hi Folded term=standout ctermbg=LightGrey ctermfg=DarkBlue guibg=LightGrey guifg=DarkBlue
hi FoldColumn term=standout ctermbg=LightGrey ctermfg=DarkBlue guibg=Grey guifg=DarkBlue
hi DiffAdd term=bold ctermbg=DarkBlue guibg=DarkBlue
hi DiffChange term=bold ctermbg=DarkMagenta guibg=DarkMagenta
hi DiffDelete term=bold ctermfg=Blue ctermbg=DarkCyan gui=bold guifg=Blue guibg=DarkCyan
hi CursorColumn term=reverse ctermbg=white guibg=grey40
hi CursorColumn ctermbg=238 guibg=grey40
hi CursorLine term=underline cterm=underline guibg=grey40

" 类型颜色
hi Type     term=underline ctermfg=blue guifg=#ffa0a0 guibg=grey5
hi Statement term=underline ctermfg=darkgrey guifg=#ffa0a0 guibg=grey5

" 预处理关键字颜色
hi PreProc    guifg=#faf4c6 gui=none ctermfg=blue

" 数字颜色
hi Number     guifg=#ff9800 gui=none ctermfg=208

" 注释颜色
hi Comment    guifg=#808080 gui=italic ctermfg=lightgreen

" 匹配的内容的颜色
hi MatchParen guifg=#d0ffc0  guibg=#2f2f2f gui=bold ctermfg=157 ctermbg=237 cterm=reverse

" Groups for syntax highlighting
" 宏颜色
hi Constant term=underline ctermfg=130 guifg=#ffa0a0 guibg=grey5

" 字符串颜色
hi String    term=underline ctermfg=white guifg=#ffa0a0 guibg=grey5
hi Special term=bold ctermfg=LightRed guifg=Orange guibg=grey5
hi Define guifg=gold gui=bold ctermfg=yellow

" include 颜色
hi Include guifg=red ctermfg=red

" 运算符颜色
hi Operator guifg=gold gui=bold ctermfg=yellow

" 不知道这是配置什么颜色的
hi Identifier guifg=#b1d631 gui=none ctermfg=red
hi Keyword    guifg=#ff9800 gui=none ctermfg=red

if &t_Co > 8
  hi Statement term=bold ctermfg=darkblue guifg=#ffff60 gui=bold
endif
hi Ignore ctermfg=DarkGrey guifg=grey20

```
### 模板函数 ###

```vim
" 文档里的代码,开启预览窗口
au! CursorHold *.[ch] nested call PreviewWord()
func PreviewWord()
  if &previewwindow			" don't do this in the preview window
    return
  endif
  let w = expand("<cword>")		" get the word under cursor
  if w =~ '\a'			" if the word contains a letter

    " Delete any existing highlight before showing another tag
    silent! wincmd P			" jump to preview window
    if &previewwindow			" if we really get there...
      match none			" delete existing highlight
      wincmd p			" back to old window
    endif

    " Try displaying a matching tag for the word under the cursor
    try
       exe "ptag " . w
    catch
      return
    endtry

    silent! wincmd P			" jump to preview window
    if &previewwindow		" if we really get there...
	 if has("folding")
	   silent! .foldopen		" don't want a closed fold
	 endif
	 call search("$", "b")		" to end of previous line
	 let w = substitute(w, '\\', '\\\\', "")
	 call search('\<\V' . w . '\>')	" position cursor on match
	 " Add a match highlight to the word at this position
      hi previewWord term=bold ctermbg=green guibg=green
	 exe 'match previewWord "\%' . line(".") . 'l\%' . col(".") . 'c\k*"'
      wincmd p			" back to old window
    endif
  endif
endfun
```
