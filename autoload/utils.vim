" 自动加载脚本,
" 通过 filename#funcname 调用后才会加载
" 如果调用不存在的函数会重复加载
"
" Maintainer:	mrtujiawei <m15988803646@163.com>
" Last Change:	2021 Nov 05

if exists('g:load_mine_autoload')
  finish
endif

let g:load_mine_autoload = 1

" 脚本内容从下面开始

" 检查目录是否存在
" 如果不存在则新建一个目录
function! utils#checkDir(dir)
  if !isdirectory(a:dir)
    silent call mkdir(a:dir, 'p')
  endif
endfunction

" 再次打开时回到上次编辑的位置
function! utils#toLastEditPosition()
  if 1 < line("'\"") && line("'\"") <= line("$")
    exec "normal! g'\""
  endif 
endfunction

" 设置页面模板
function! utils#setTemplate()
  " 搞笑
  " * 本人学识渊博、经验丰富，代码风骚、效率恐怖，
  " * c/c++ c#、java、php 安卓 ios  python node.js  无不精通玩转，
  " * 熟练掌握各种框架，并自写语言，创操作系统 写cpu处理器构架，做指令集成  。
  " * 深山苦练20余年，一天只睡3小时，千里之外定位问题，瞬息之间修复上线。
  " * 身体强壮、健步如飞，可连续工作100小时不休息，讨论技术方案9小时不喝水，
  " * 上至研发cpu芯片、带项目、出方案  弄计划，下至盗账号、黑网站、
  " * shell提权挂马、攻击同行、拍片摄影、泡妞把妹纸、开挖掘机 、威胁pm，啥都能干。
  " * 泡面矿泉水已备好，学校不支持已辍学，家人不支持已断绝关系，老婆不支持已离婚，
  " * 小孩不支持已送孤儿院，备用电源万兆光纤永不断电断网，门口已埋地雷无人打扰
  
  " shell 脚本
  if &filetype == 'sh'

    " #!/bin/bash
    " #Filename: index.sh
    " #Author: Mr Prince
    " #Date: 2020-09-02 14:04:37

    call setline(1,"\#!/bin/bash") 
    call append(line("."), "\#Filename: ".expand("%:p")) 
    call append(line(".") + 1, "\#Author: Mr Prince") 
    call append(line(".") + 2, "\#Date: ".strftime("%Y-%m-%d %T")) 
    call append(line(".") + 3, "")
    normal G

  " js ts tsx
  elseif &filetype == 'javascript' || 'typescript' == &filetype || 'typescriptreact' == &filetype

    " /**
    "  * 
    "  * @filename: index.js
    "  * @author: Mr Prince
    "  * @date: 2020-09-02 14:05:08
    "  */

    call setline(1, "\/**")
    call append(line("."), "\ * ")
    call append(line(".") + 1, "\ * @filename: ".expand("%"))
    call append(line(".") + 2, "\ * @author: Mr Prince")
    call append(line(".") + 3, "\ * @date: ".strftime("%Y-%m-%d %T"))
    call append(line(".") + 4, "\ */")
    call append(line(".") + 5, "")
    normal 2gg$

  " vue 模板
  elseif &filetype == 'vue'

    " <template>
    " 
    " </template>
    " 
    " <script>
    " 
    " </script>

    call setline(1, "\<template>")
    call append(line("."), "")
    call append(line(".") + 1, "</template>")
    call append(line(".") + 2, "")
    call append(line(".") + 3, "<script>")
    call append(line(".") + 4, "")
    call append(line(".") + 5, "</script>")
    normal 2gg$

  " vim 脚本
  elseif 'vim' == &filetype

    " 
    "
    " Maintainer:	mrtujiawei <m15988803646@163.com>
    " Last Change:	2021 Nov 05

    call setline(1, '" ')
    call append(line('.'), '"')
    call append(line('.') + 1, '" Maintainer: mrtujiawei <m15988803646@163.com>')
    call append(line(".") + 2, '" Last Change: '.strftime("%Y-%m-%d")) 
    normal gg$

  endif
endfunc

" 在右侧打开终端
function! utils#verticalTerminal()
  :vertical terminal
endfunc

" 翻译当前光标下的单词
function! utils#fanYi()
  execute '!fanyi '.expand('<cword>')
endfunc

" 本地打包测试
function! utils#buildTest() 
  :!yarn build:test 
endfunc

" 本地打包线上
function! utils#build()
  :!yarn build 
endfunc

" 运行测试代码
function! utils#test()
  :!yarn test
endfunc

" 设置运行快捷键的命令
function! utils#setRunCommand()
  if &filetype == 'sh'
    nmap <C-B> :w<CR>:!sh % > /tmp/vim.run.log<CR>:vsp /tmp/vim.run.log<CR>
  elseif 'typescript' == &filetype 
    nmap <C-B> :call utils#runTs()<CR>
  elseif 'javascript' == &filetype
    nmap <C-B> :w<CR>:!node % <CR>
  elseif 'html' == &filetype
    nmap <C-B> :w<CR>:!google-chrome-stable %<CR>
  elseif 'java' == &filetype
    nmap <C-B> :w<CR>:!javac % && java %:r<CR>
  elseif 'go' == &filetype
    nmap <C-B> :w<CR>:!go run %<CR>
  endif
  imap <C-B> <ESC><C-B>
endfunc

" 没有用户窗口的时候退出vim
function! utils#closeOnNoUserWindow()
  if (1 == winnr("$") && exists("b:NERDTree") && b:NERDTree.isTabTree())
    q
  endif
endfunction

" 辅助函数，下面要用到
function! <SID>CmdLine(str)
  call feedkeys(":" . a:str)
endfunction

" 可视模式选择
function! utils#visualSelection(direction, extra_filter) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", "\\/.*'$^~[]")
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'gv'
    call <SID>CmdLine("Ack '" . l:pattern . "' " )
  elseif a:direction == 'replace'
    call <SID>CmdLine("%s" . '/'. l:pattern . '/')
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

" 删除所有的行尾空格
function! utils#cleanExtraSpaces()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  silent! %s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfun

" markdown 预览
function! utils#MarkdownPreview()
  if 'markdown' == &filetype
    :MarkdownPreview
  endif
endfunction

" 光标下是否有字符
" 返回字符的宽度，中文占三位 utf-8
" 英文占1位
function! utils#hasWordUnderCursor() 
  let col = '\%' . col('.') . 'c.'
  let cword = matchstr(getline('.'), col)
  return strlen(cword)
endfunction

" 保存 session
function! utils#mkSession(filename)
  let sessionDir = expand('$HOME/.vim/session/')
  call utils#checkDir(sessionDir)

  " 判断一下目录是否打开
  " 关闭目录，加载 session 会报错
  if exists(':NERDTreeClose')
    :NERDTreeClose
  endif

  exec "mksession! ".sessionDir.a:filename
endfunction

" 删除session
function! utils#deleteSession(filename)
  let sessionDir = expand('$HOME/.vim/session/')
  call utils#checkDir(sessionDir)

  call delete(sessionDir.a:filename)
endfunction

" 获取 session 文件名
function! utils#getSessions(A, L, P)
  let sessionDir = expand('$HOME/.vim/session/')
  call utils#checkDir(sessionDir)

  let sessions = split(glob(sessionDir.'*'), '\n')

  let index = 0
  for session in sessions 
    let paths = split(session, '/')
    let sessions[index] = paths[len(paths) - 1]
    let index = index + 1
  endfor

  return sessions
endfunction

" 加载 session
function! utils#loadSession(filename)
  let sessionDir = expand('$HOME/.vim/session/')
  call utils#checkDir(sessionDir)
  if filereadable(sessionDir.a:filename)
    exec 'source '.sessionDir.a:filename

    call utils#deleteSession(a:filename)
  else
    echo '文件不存在'
  endif
endfunction

" 我先做一个和 tpope/vim-fugitive 类似的工具，管理session
" 类似 :G 打开一个临时文件, 按下回车直接就可以开始一个会话
" 创建临时文件
function! utils#mkTempfile()
  let sessionDir = expand('$HOME/.vim/session/')
  let sessions = split(glob(sessionDir.'*'), '\n')

  let index = 0
  for session in sessions 
    let paths = split(session, '/')
    let sessions[index] = paths[len(paths) - 1]
    let index = index + 1
  endfor

  let filename = tempname()

  exec ':sp '.filename

  call append(0, sessions)

  normal dd
  normal gg
  exec 'w'
  set filetype=vim-session
endfunction

" 删除 buffer 不关闭窗口
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
  let l:currentBufNum = bufnr("%")
  let l:alternateBufNum = bufnr("#")

  if buflisted(l:alternateBufNum)
    buffer #
  else
    bnext
  endif

  if bufnr("%") == l:currentBufNum
    new
  endif

  if buflisted(l:currentBufNum)
    execute("bdelete! ".l:currentBufNum)
  endif
endfunction

" 运行ts
function! utils#runTs()
  exec ':w'
  exec '! node ~/.vim/scripts/runner.js '.expand('%')
endfunction

