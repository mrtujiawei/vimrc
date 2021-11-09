" 自定义命令
"
" Maintainer: mrtujiawei <m15988803646@163.com>
" Last Change: 2021-11-08

if exists('g:load_mine_commands')
  finish
endif

let g:load_mine_commands = 1

" 运行测试代码
command! -n=0 -complete=dir -bar Test :call utils#test()

" 打包测试环境的代码
command! -n=0 -complete=dir -bar BuildTest :call utils#buildTest()

" 打包线上环境的代码
command! -n=0 -complete=dir -bar Build :call utils#build()

" 右侧打开终端 terminal
command! -n=0 -complete=dir -bar T :call utils#verticalTerminal()

" 设置页面模板(注释)
command! -n=0 -complete=dir -bar SetTemplate :call utils#setTemplate()

" 翻译光标下字符 fanyi
command! -n=0 -complete=dir -bar FY :call utils#fanYi()

" 强制保存当前文件 Force write
command! -n=0 -complete=dir -bar Fw execute 'w !sudo tee % > /dev/null' <bar> edit!
