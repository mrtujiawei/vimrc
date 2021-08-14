" simnalamburt/vim-mundo
"
" undo tree
"
" Maintainer: mrtujiawei <m15988803646@163.com>
" Last Change: 2023-08-29

" 是否禁用
let g:mundo_disable = 0

" 宽度
let g:mundo_width = 45

" 预览高度
let g:mundo_preview_height = 15

" 在右侧打开
let g:mundo_right = 1

" 强制预览窗口在下方显示
let g:mundo_preview_bottom = 0

" 默认不显示帮助
let g:mundo_help = 0

" 按键映射
" let mundo_map_move_older = 'j'
" let mundo_map_move_newer = 'k'

" 还原后是否自动关闭
let g:mundo_close_on_revert = 0

" 默认渲染差异，未0可以更快渲染
" let g:mundo_preview_statusline
" let g:mundo_tree_statusline

" 自动显示预览
let g:mundo_auto_preview = 1

" 更新延迟 大一点更不容易卡
let g:mundo_playback_delay = 60

" tu: toggle undo
" tu: tree undo
noremap <silent> <space>tu :MundoToggle<cr>
