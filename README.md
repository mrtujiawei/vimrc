# vimrc

我的 vim 配置文件

打算搞一个单独的配置文件和文档

`z<CR>` 当前行滚动到顶部

## install

### vim install

> 安装最新的vim

```shell
./scripts/vim-install.sh
```

### config vimrc

> 配置vim

```shell
./scripts/install.sh
```

## vimrcs

我的 vim 配置

## vim 安装

`help usr_90`

[vim 安装脚本](https://raw.githubusercontent.com/Mr-Promise/shell/main/src/install-vim.sh)

## 插件查找

[Vim Awesome](https://vimawesome.com/)

## 插件安装

如果嫌下载话可以使用 `git clone ${url} ~/.vim/bundle/` 的方式手动放进目录中  
因为我自己的初始化脚本中有 `git clone ` 下载失败的重试

## 选择模式

`gh`
`gH`
`g<C-h>`

## Ex 模式

`h: ex-cmd-index` 查看 所有 ex 命令  
`<C-r>a` 读取 a 寄存器中的值
`<C-r><C-w>` 当前光标下的单词
`<C-r><C-A>` 当前光标下的词组
`<C-r><C-l>` 光标所在行
`<C-r><C-f>` 光标所在文件名

## 搜索

`\v` 不用处理特殊字符  
`\zs` 开始匹配(`^`)  
`\ze` 结束匹配(`$`)

## 替换

`c` 确认 `s/pattern/target/c`  
`e` 不显示错误消息  
`n` 不实际替换，给出可以替换的次数  
`p` 显示最后一次替代的行  
`#` 显示行号

不一定要用`/`来做分隔符

`\{-}` 非贪婪

## 配置项

查看所有配置项 `normal options`

## 外部命令范围选择

```vimscript
" 选择一个段落
!}
```

## 特殊关键字

```vimscript
" 不回显命令
<slient>

" <expr> 把后面的表达式当代码执行，
" 执行返回的结果才作为配置的依据
map <expr> <c-space> func()
```

## vim 内查找

```vimscript
" 查找所有.ts文件里面匹配 pattern的文件
:vim /pattern/ ./**/*.ts
```

## 多行递增

```html
<div id="app-1"></div>
<div id="app-1"></div>
<div id="app-1"></div>
<div id="app-1"></div>
<div id="app-1"></div>
```

从第二行的-1 开始选中,`g<C-a>` =>

```html
<div id="app-1"></div>
<div id="app-2"></div>
<div id="app-3"></div>
<div id="app-4"></div>
<div id="app-5"></div>
```

字母递增(set nrformats+=alpha)

## 断点插入

插入模式下: `<C-g>u`  
不会有任何提示，但是当你撤销时  
只会撤销 `<C-g>u` 之后的内容

## 撤销恢复

恢复上次撤销的内容: `<C-r>`
按修改顺序恢复内容: `g+`

## 窗口调整

```vimawesome
" :vsp
<C-w>v

" :sp
<C-w>s

" :close
<C-w>c

" :only
<C-w>o

```

## 代码跳转

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

" 返回之后位置
ctrl+i

" 返回之前编辑过的位置
ctrl+^
```

## diff 快速更改

```vim
" 把当前文件的内容合并到另一个文件中
dp

" 把另一个文件中的内容合并到当前文件中
do
```

## 使用 vim 解决 git 冲突

```shell
git config merge.tool vimdiff
git config merge.conflictstyle diff3
git config mergetool.prompt false

# 不生成备份文件
git config --global mergetool.keepBackup false

# 使用 git 来解决冲突
git mergetool
```

## 键映射

所有 map 都可以通过 `[mode]{nore}map` 取消二次映射

```vim

" 普通、可视、选择、以及操作符等待模式
map

" 可视&选择模式
vmap

" 选择模式
smap

" 可视模式
xmap

" 操作符等待模式
omap

" 插入和命令行模式
map!

" 插入&命令行&lang-arg模式
lmap

" 普通模式
nmap

" 插入模式
imap

" 命令行模式
cmap

" 终端任务
tmap

```

if 自动加()

```vim
func Eatchar(pat)
   let c = nr2char(getchar(0))
   return (c =~ a:pat) ? '' : c
endfunc
iabbr <silent> if if ()<Left><C-R>=Eatchar('\s')<CR>
```

## 自定义命令行命令

`usr_40`

`<args>`  
`<f-args>` 向 vimscript 传递参数  
`<q-args>` 将用户输入转换为字符串

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

## 寄存器

`help {register}`

|     |        寄存器         |         命令         |
| :-: | :-------------------: | :------------------: |
|  1  |      匿名寄存器       |         `""`         |
|  2  |      编号寄存器       |        `"0-9`        |
|  3  |     小删除寄存器      |         `"-`         |
|  4  |      命名寄存器       |  `"a-z` and `"A-Z`   |
|  5  |      只读寄存器       | `":,` `".,` and `"%` |
|  6  | Buffer 交替文件寄存器 |         `"#`         |
|  7  |     表达式寄存器      |         `"=`         |
|  8  |   选取和拖放寄存器    |    `"*` and `"+`     |
|  9  |      黑洞寄存器       |         `"_`         |
| 10  |    搜索模式寄存器     |         `"/`         |

## 多文件处理

```vimscript
" 选择编辑所有以ts结尾的文件
:args *.ts

" 编辑
:argdo %s/import/export/g

```

## 保存会话

`mksession` 保存会话  
`vim -S Session.vim` 加载会话
`:source Session.vim` 同上

## vimscript

### 目录

`help usr_41` 内置函数 , 这里包含了 vimrc 的大部分信息

`$VIMRUNTIME` 有一些自带的插件和配置，在这个目录下

`vsp $VIMRUNTIME/` + tab 可以显示具体路径

`eval` 一些内部常量，函数
`index` 常用操作,类似目录
`message` 错误类型在这里找
`options` 所有配置项
`quickref` 快速索引，目录
`popup` 弹出层，深入一下很重要，但内容太多

### 变量类型

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

### 函数

`range` 函数内部变量 `a:firstline` `a:lastline`
可变参数 ... `a:1` `a:2` ...

### 加载其他脚本

```vim
" 如果文件存在,加载全局配置文件

let path = '/etc/vim/vimrc.local'

if filereadable(path)
  source path
endif
```

### 颜色配置项

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

```vimscript
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

### 模板函数

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

## fzf

- `^` 前缀精确匹配
- `$` 后缀精确匹配
- `'` 精确匹配
- `|` "或者"匹配
- `!` 反向匹配

```vimscript
" 根据文件内容搜索
:Rg

" 类似Rg
:Ag

" 多选模式 <tab>选择
:Rg -m

" Git文件 git ls-files [opts]
:GFiles

" 操作历史 : ex命令 / 搜索命令
:History

" 根据提交信息搜索
:Commits

" 当前文件的提交记录
:BCommits

" 所有执行过的命令
:Commands

" 所有映射
:Maps

" 修改文件类型
:Filetypes

" 所有书签
:Marks

" 所有窗口
Window

" 帮助
:Helptags
```

## Vim-Fugitive

`:Git blame` 查找代码提交记录

- q 关闭问责窗口。
- A 调整作者列大小。
- C 调整提交列大小。
- D 调整日期/时间列大小。

`:Gdiffsplit [commit]` 查看修改内容  
`:Gwrite`  
`:Gread`  
`:Gclog`  
`g?` 查看帮助

## vim-visual-multi

`<C-down>` `<C-up>` `<S-left>` `<S-right>` 开始多选
`<C-n>` 选择光标下的单词
`q` 跳过当前单词(不选) `Q` 删除已选

`\\c` 可视模式进入
`\\a` 根据光标下的字符对齐
`\\<` 根据输入字符对齐
`n\\<=` 根绝多个字符对齐
`\\>` 根据正则对齐
`R` 替换
`_` 空格

## glob

扩展文件通配符

## new plugin

`https://github.com/amix/vimrc/tree/master/sources_non_forked`
`https://github.com/amix/vimrc/tree/master/sources_forked`
`https://github.com/amix/vimrc/blob/master/autoload/pathogen.vim`

## 局部化

| 全局        | 局部                  | 作用域       | 帮助文档              |
| ----------- | --------------------- | ------------ | --------------------- |
| `:set`      | `:setlocal`           | 缓冲区或窗口 | `:h local-options`    |
| `:map`      | `:map <buffer>`       | 缓冲区       | `:h :map-local`       |
| `:autocmd`  | `:autocmd * <buffer>` | 缓冲区       | `:h autocmd-buflocal` |
| `:cd`       | `:lcd`                | 窗口         | `:h :lcd`             |
| `:<leader>` | `:<localleader>`      | 缓冲区       | `:h maploacalleader`  |

## scripts

```vimscript
" 替换函数。参数说明：
" confirm：是否替换前逐一确认
" wholeword：是否整词匹配
" replace：被替换字符串
function! Replace(confirm, wholeword, replace)
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gec'
    else
        let flag .= 'ge'
    endif
    let search = ''
    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    else
        let search .= expand('<cword>')
    endif
    let replace = escape(a:replace, '/\&~')
    execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction
" 不确认、非整词
nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 不确认、整词
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、非整词
nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、整词
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
```

## 输入提示

```vimscript
" 用指定类型的颜色高亮后面的输入
echohl WarningMsg | echo 'Hello World' | echohl None
```

```vimscript
" ==========================
" ======== 颜色配置 ========
" ==========================

" %{n}* 使用
hi user1        cterm=none    ctermfg=black   ctermbg=cyan    gui=none  guifg=#ffffff   guibg=#840c0c
hi user2        cterm=none    ctermfg=white   ctermbg=yellow  gui=none  guifg=black     guibg=#ffff77
hi user3        cterm=none    ctermfg=white   ctermbg=blue    gui=none  guifg=black     guibg=#d59159
hi user4        cterm=none    ctermfg=white   ctermbg=green   gui=none  guifg=black     guibg=#8d6c47
hi user5        cterm=none    ctermfg=black   ctermbg=cyan    gui=none  guifg=#000000   guibg=#3a406e
hi user6        cterm=bold    ctermfg=black   ctermbg=white   gui=none  guifg=black     guibg=#acff84
hi user7        cterm=none    ctermfg=yellow  ctermbg=white   gui=none  guifg=black     guibg=#77cf77
hi user8        cterm=none    ctermfg=yellow  ctermbg=white   gui=none  guifg=black     guibg=#66b06f
hi user9        cterm=none    ctermfg=yellow  ctermbg=white   gui=none  guifg=black     guibg=#60af9f

" %#RightArror# 这样来使用
" set statusline+=%#RightArror#▶
hi RightArror   cterm=none    ctermfg=yellow  ctermbg=cyan    gui=none  guifg=#840c0c   guibg=#ffff77   gui=bold

" 系统高亮组
hi Pmenu                      ctermfg=black   ctermbg=gray                              guibg=#333333
hi PmenuSel                   ctermfg=7       ctermbg=4       gui=none  guifg=#ffffff   guibg=#444444
hi TabLineSel   cterm=none    ctermfg=yellow  ctermbg=cyan    gui=none  guifg=#840c0c   guibg=#ffff77   gui=bold
hi TabLine      cterm=none    ctermfg=yellow  ctermbg=white   gui=none  guifg=black     guibg=#60af9f
hi TabLineFill  cterm=none    ctermfg=yellow  ctermbg=white   gui=none  guifg=black     guibg=#77cf77
hi CursorLine   cterm=none    ctermbg=black   ctermbg=cyan    gui=none  guifg=#ffffff   guibg=#333333   gui=bold
hi CursorLine   cterm=none    ctermfg=white   ctermbg=cyan    gui=none  guifg=green     guibg=#202020   gui=bold
hi CursorColumn cterm=none    ctermfg=white   ctermbg=cyan    gui=none  guifg=green     guibg=#202020   gui=bold

```

## 快捷键

> 在自动补全的代码之间跳转

`<C-j>`: 跳转到下一个位置
`<C-k>`: 跳转到上一个位置

## vim-gitgutter 配置

```vimrc
" ========================================
" ======== airblade/vim-gitgutter ========
" ========================================

" 状态栏设置,依赖vim-gitgutter
" 设置git状态
function! GitStatus()
  let [a,m,r] = [0, 0, 0]
  if exists('*GitGutterGetHunkSummary')
    let [a,m,r] = GitGutterGetHunkSummary()
  endif
  return printf('+%d ~%d -%d ', a, m, r)
endfunction

set statusline=
set statusline+=%1*\[%n]                                  "buffernr
set statusline+=%2*\ %<%F\                                 "文件路径
set statusline+=%3*\ %y\                                   "文件类型
set statusline+=%4*\ %{''.(&fenc!=''?&fenc:&enc).''}       "编码1
set statusline+=%{(&bomb?\",BOM\":\"\")}\                 "编码2
set statusline+=%#TabLine#%{coc#status()}%{get(b:,'coc_current_function','')} " 代码提示服务
set statusline+=%5*\ %=\ %6*\ row:%l/%L\ (%03p%%)\        "光标所在行号/总行数 (百分比)
set statusline+=%7*\ col:%03c\                            "光标所在列
set statusline+=%8*\ %{GitStatus()}
set statusline+=%9*\ %m%r%w\                            "修改? 只读? 保存?

" 单个标签设置
function! MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)

  " Add '+' if one of the buffers in the tab page is modified
  let label = ''
  for bufnr in buflist
    if getbufvar(bufnr, "&modified")
      let label = '+'
      break
    endif
  endfor

  "添加tabpage序号,方便ngt切换
  return '  ['.a:n.label.']'.pathshorten(bufname(buflist[winnr - 1])).' '
endfunction


" 标签栏设置
function! MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " 高亮
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    " 添加序号
    let s .= '%' . (i + 1) . 'T'

    " 单个标签设置
    let s .= '%{MyTabLabel(' . (i + 1) . ')}'
  endfor

  " 最后一个标签后面填充
  let s .= '%#TabLineFill#%T'

  " 关闭标签右对齐
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999XX'
  endif

  return s
endfunction

set tabline=%!MyTabLine()
```

要学会管理 buffer, buffer多了以后非常影响性能
