" 自定义命令
"
" Maintainer: mrtujiawei <m15988803646@163.com>
" Last Change: 2021-11-08

if exists('g:load_mine_commands')
  finish
endif

let g:load_mine_commands = 1

" 设置页面模板(注释)
command! -n=0 -bar SetTemplate :call utils#setTemplate()

" 翻译光标下字符 fanyi
command! -n=0 -bar FY :call utils#fanYi()

" 强制保存当前文件 Force write
command! -n=0 -bar Fw execute 'w !sudo tee % > /dev/null' <bar> edit!

" 保存会话
command! -n=1 -complete=customlist,utils#getSessions -bar MkSession :call utils#mkSession(<f-args>)

" 加载会话列表
command! -n=1 -complete=customlist,utils#getSessions -bar LoadSession :call utils#loadSession(<f-args>)

" 当前 buffer 的项目根目录切换到当前文件目录
command! -n=0 Cd :lcd %:p:h
