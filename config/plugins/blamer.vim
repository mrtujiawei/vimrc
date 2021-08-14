" APZelos/blamer.nvim
"
" git 提交信息显示
"
" Maintainer: mrtujiawei <m15988803646@163.com>
" Last Change: 2023-08-29

nnoremap <silent> <leader>b :BlamerToggle<CR>

" 默认显示blame信息
let g:blamer_enabled = 0

" 延迟显示
let g:blamer_delay = 500

" 可视模式下不显示
let g:blamer_show_in_visual_modes = 0

" 插入模式下不显示
let g:blamer_show_in_insert_modes = 0

" 显示前缀
let g:blamer_prefix = ' '

" 显示格式
" 支持的选项
" <author>, <author-mail>, <author-time>, <committer>,
" <committer-mail>, <committer-time>, <summary>,
" <commit-short>, <commit-long>
let g:blamer_template = '<committer>: <committer-time> -> <summary>'

" 显示时间格式
let g:blamer_date_format = '%Y-%m-%d %H:%M:%S'
let g:blamer_date_format = '%Y-%m-%d'

" 以相对时间显示
let g:blamer_relative_time = 1

" 修改颜色
" highlight Blamer guifg=lightgrey

