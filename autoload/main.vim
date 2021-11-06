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

function main#Test()
  echo 'main#Trint run'
endfunction
