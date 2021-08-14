" yardnsm/vim-import-cost
"
" 计算 js 倒入的大小
"
" Maintainer: mrtujiawei <m15988803646@163.com>
" Last Change: 2023-08-29


" 目前其实并不支持
" 不另外开新窗口显示
let g:import_cost_always_open_split = 0

" 使用 virtualtext
let g:import_cost_virtualtext = 1

" 不显示错误信息
let g:import_cost_slient = 1

" 进入文件自动显示引入大小
" augroup import_cost_auto_run
"   autocmd!
"   autocmd InsertLeave *.js,*.jsx,*.ts,*.tsx silent! ImportCost
"   autocmd BufEnter *.js,*.jsx,*.ts,*.tsx silent! ImportCost
"   autocmd CursorHold *.js,*.jsx,*.ts,*.tsx silent! ImportCost
" augroup END
