" vim-script/LargeFile
"
" 大文件查看
"
" Maintainer: mrtujiawei <m15988803646@163.com>
" Last Change: 2023-08-29

" 单位: M
" 超过 0.5M 的文件 就当做大文件处理
" 禁用一些插件
" 效果不大，但至少让卡顿的时间减少了
let g:LargeFile = 0.5
