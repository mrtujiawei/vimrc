" preservim/nerdcommenter
"
" 注释插件
"
" Maintainer: mrtujiawei <m15988803646@163.com>
" Last Change: 2023-08-29

" 取消默认映射
let g:NERDCreateDefaultMappings = 0

" 注释后加空格
let g:NERDSpaceDelims = 1

" 多行注释紧凑
let g:NERDCompactSexyComs = 1

" 代码注释尽量左对齐，不跟随代码缩进
let g:NERDDefaultAlign = 'left'

" 修改自定义的代码注释
" let g:NERDAltDelims_java = 1

" 自定义代码注释
let g:NERDCustomDelimiters = { 'vue': { 'left': '/**','right': '*/' } }

" 空行允许注释和取消
let g:NERDCommentEmptyLines = 1

" 取消注释时移除空格
let g:NERDTrimTrailingWhitespace = 1

" 开启检测是否已加注释
let g:NERDToggleCheckAllLines = 1

let g:NERDCommenterComment = '<leader>/'

nnoremap <silent> <C-/> :call nerdcommenter#Comment('n', 'toggle')<CR>
xnoremap <silent> <C-/> :call nerdcommenter#Comment('x', 'toggle')<CR>
imap <silent> <C-/> <Esc><C-/>

if has('mac')
  " mac 上需要这么搞
  " 终端不支持，需要再加一次映射
  nnoremap <silent> <C-_> :call nerdcommenter#Comment('n', 'toggle')<CR>
  xnoremap <silent> <C-_> :call nerdcommenter#Comment('x', 'toggle')<CR>
  imap <silent> <C-_> <Esc><C-_>
endif
