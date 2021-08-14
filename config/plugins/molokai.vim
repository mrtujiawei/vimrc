" tomasr/molokai
"
" 配色方案
"
" Maintainer: mrtujiawei <m15988803646@163.com>
" Last Change: 2023-08-28

" 匹配原始的 monokai 背景颜色
let g:molokai_original = 1

" 使 256 色版本尽可能接近默认（深色）GUI 版本
let g:rehash256 = 1

colorscheme molokai

" coc 自定义了补全的高亮组
hi CocMenuSel ctermfg=255 ctermbg=242 guibg=#404040
