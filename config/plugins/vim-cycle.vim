" zef/vim-cycle
"
" 对 <C-a> <C-x> 的扩展
"
" Maintainer:  tujiawei <jiaweitu@marchthepolo.com>
" Last Change: 2023-11-23

func s:Init()
  call AddCycleGroup(['let', 'var', 'const'])
  call AddCycleGroup(['log', 'warn', 'error'])
endfunc

" 调用会报错？
autocmd VimEnter * call s:Init()
