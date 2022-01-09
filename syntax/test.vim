" 测试 语法脚本
"
" Maintainer:	mrtujiawei <m15988803646@163.com>
" Last Change:	2022 Jan  09

if exists('g:load_mine_syntax')
  finish
endif

let g:load_mine_syntax = 1

" 脚本内容从下面开始
syn keyword slTodo contained TODO
syn match slComment "#.*$" contains=slTodo

syn keyword slPrint print

syn region slString start='"' end='"'

syn region logBlock matchgroup=logParen start=/(/ end=/)/ fold contains=slString

hi def link slPrint Function
hi def link slTodo Todo
hi def link slComment MoreMsg
hi def link slBlockCmd Keyword
hi def link slString Keyword

let b:current_syntax = 'test'
