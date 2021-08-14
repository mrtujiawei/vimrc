" 我的vim配置
"
" Maintainer:   tujiawei <15988803646@163.com>
" Last Change:  2021 Nov 09


if exists('g:load_vimrc')
  finish
endif

let g:load_vimrc = 1

" source 目录
func! s:SourceDir(dir)
  let s:root_path = expand('$HOME/.vim/' . a:dir . '/')
  let s:file_paths = glob(s:root_path . '*.vim', 0, 1)

  for s:file_path in s:file_paths
    exec 'source ' . s:file_path
  endfor
endfunc

call s:SourceDir('config')
call s:SourceDir('config/plugins')
