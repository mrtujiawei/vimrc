" voldikss/vim-floaterm
"
" 悬浮终端
"
" Maintainer: mrtujiawei <m15988803646@163.com>
" Last Change: 2023-08-28

" 支持 <C-d> 关闭终端, 否则还要手动关一次
let g:floaterm_autoclose     = 2
let g:floaterm_keymap_new    = '<F9>'
let g:floaterm_keymap_prev   = '<F10>'
let g:floaterm_keymap_next   = '<F11>'
let g:floaterm_keymap_toggle = '<F12>'

let g:floaterm_width = 0.8
let g:floaterm_height = 0.8

hi FloatermBorder guibg=NONE guifg=Grey
