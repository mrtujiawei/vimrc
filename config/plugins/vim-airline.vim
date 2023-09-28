" vim-airline/vim-airline
"
" 状态栏美化
"
" Maintainer: mrtujiawei <m15988803646@163.com>
" Last Change: 2023-08-29

" 检测是否修改
let g:airline_detect_modified = 1

" 启用粘贴检测
let g:airline_detect_paste = 1

" 启用加密检测
let g:airline_detect_crypt = 1

" 需要支持 GUI 才行， 目前我用的不支持
" 需要本地和远程都装才会正常显示
" 不装字体显示会很奇怪
" let g:airline_powerline_fonts = 1
" let g:Powerline_symbols = 'fancy'

" 缓存高亮组
let g:airline_highlighting_cache = 1

" 只加载指定的插件
" 'coc', 'searchcount',
" 'wordcount', 'whitespace', 'mundo',
"
" 能提升性能，但不打开vim 直接 git commit 会报错
" 现在电脑性能过得去，没必要省这么点开销
" let g:airline_extensions = [
"   \ 'branch', 'fugitiveline',
"   \ 'hunks', 'term',
"   \ 'keymap', 'netrw',
"   \ 'quickfix', 'tabline',
"   \ 'fzf',
"   \ ]

" 不显示窗口tab, 实在太卡了
let g:airline#extensions#tabline#enabled = 0

" 不显示buffer
let g:airline#extensions#tabline#show_buffers = 0

" 标签栏的分隔符
let g:airline#extensions#tabline#alt_sep = 0
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

" 同上
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = '|'

" 不太清楚干什么的，也不知道哪里复制来的
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 2
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#tabs_label = 'Tabs'
let g:airline#extensions#tabline#overflow_marker = '…'

" 标签栏总体样式
" default | jsformatter | unique_tail |  unique_tail_improved
let g:airline#extensions#tabline#formatter = 'unique_tail'

" 显示 buffer id
" let g:airline#extensions#tabline#buffer_nr_show = 1
