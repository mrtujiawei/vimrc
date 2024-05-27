" 自动加载脚本,
" 通过 filename#funcname 调用后才会加载
" 如果调用不存在的函数会重复加载
"
" Maintainer:	mrtujiawei <m15988803646@163.com>
" Last Change:	2021 Nov 05

if exists('g:load_mine_autoload')
  finish
endif

let g:load_mine_autoload = 1

" 脚本内容从下面开始

" 检查目录是否存在
" 如果不存在则新建一个目录
function! utils#checkDir(dir)
  if !isdirectory(a:dir)
    silent call mkdir(a:dir, 'p')
  endif
endfunction

" 再次打开时回到上次编辑的位置
function! utils#toLastEditPosition()
  if 1 < line("'\"") && line("'\"") <= line("$")
    exec "normal! g'\""
  endif
endfunction

" 翻译当前光标下的单词
function! utils#fanYi()
  execute '!fanyi '.expand('<cword>')
endfunc

" 没有用户窗口的时候退出vim
function! utils#close_on_no_user_window()
  if (1 == winnr("$") && exists("b:NERDTree") && b:NERDTree.isTabTree())
    q
  endif
endfunction

" 辅助函数，下面要用到
function! <SID>CmdLine(str)
  call feedkeys(":" . a:str)
endfunction

" 可视模式选择
function! utils#visualSelection(direction, extra_filter) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", "\\/.*'$^~[]")
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'gv'
    call <SID>CmdLine("Ack '" . l:pattern . "' " )
  elseif a:direction == 'replace'
    call <SID>CmdLine("%s" . '/'. l:pattern . '/')
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

" 删除所有的行尾空格
function! utils#cleanExtraSpaces()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  silent! %s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfun

" markdown 预览
function! utils#MarkdownPreview()
  if 'markdown' == &filetype
    :MarkdownPreview
  endif
endfunction

" 光标下是否有字符
" 返回字符的宽度，中文占三位 utf-8
" 英文占1位
function! utils#hasWordUnderCursor()
  let col = '\%' . col('.') . 'c.'
  let cword = matchstr(getline('.'), col)
  return strlen(cword)
endfunction

" 我先做一个和 tpope/vim-fugitive 类似的工具，管理session
" 类似 :G 打开一个临时文件, 按下回车直接就可以开始一个会话
" 创建临时文件
function! utils#mkTempfile()
  let sessionDir = expand('$HOME/.vim/.session/')
  let sessions = split(glob(sessionDir.'*'), '\n')

  let index = 0
  for session in sessions
    let paths = split(session, '/')
    let sessions[index] = paths[len(paths) - 1]
    let index = index + 1
  endfor

  let filename = tempname()

  exec ':sp '.filename

  call append(0, sessions)

  normal dd
  normal gg
  exec 'w'
  set filetype=vim-session
endfunction

" 判断当前文件是否存在
function! utils#current_file_readable()
  let l:filename = expand('%')
  return filereadable(l:filename)
endfunction

" 运行命令
function! utils#run()
  let l:filetype = &filetype

  " vim 内部能直接执行
  " 下面的都是外部执行
  if l:filetype == 'vim'
    exec 'source ' . expand('%')
    return
  endif

  let l:command = ''

  if l:filetype == 'lua'
    let l:command = 'luajit'
  elseif l:filetype == 'javascript'
    let l:command = 'node'
  elseif l:filetype == 'typescript'
    let l:command = 'ts-node'
  elseif l:filetype == 'python'
    let l:command = 'python3'
  elseif l:filetype == 'rust'
    let l:command = 'cargo run'
  elseif l:filetype == 'java'
    let l:command = 't run-java'
  endif

  if l:command != ''
    write
    exec '!' . l:command . ' '. expand('%')
  endif
endfunction

" 在新的tab中编辑
func! utils#edit_width_new_tab() abort
  if 1 == tabpagewinnr(tabpagenr(), '$')
    " tab中只有一个文件在编辑，不做任何操作
    return
  endif

  let l:pos = getpos('.')
  exec 'tabedit ' . expand('%')
  tabprevious
  " 保留原来的窗口结构
  " enew

  " 关闭原来的 pane
  close
  tabnext
  call setpos('.', l:pos)
endfun

" 新开tab
func! utils#new_tab(...)
  if a:0 == 0
    exec 'tabedit | NERDTree'
  else
    let l:path = expand(a:1)
    exec 'tabedit | NERDTree '.l:path
  endif
endfun

" 经常会出现另存为 ; 这个文件的情况
" 所以在写入之前判读文件名是不是 ;
" 如果是的话，保存buffer对应的名字
"
" 没办法阻止写入，选择写入后删除
func! utils#write_file_semi()
  let l:filename = expand('<afile>')
  let l:unexpect_filename = ';'

  if l:filename == l:unexpect_filename
    let l:filename = expand('%')
  endif

  " 防止死循环
  if l:filename != l:unexpect_filename
    " 同步保存不生效
    " 改为异步保存
    call timer_start(1, function('utils#save_current_buffer'))
    exec '!rm -rf ";"'
  endif
endfunc

" 保存 buffer 到文件
func! utils#save_current_buffer(...)
  write
endfunc

" 大文件检查
func! utils#large_file_check(file_name)
  let l:file_size = getfsize(a:file_name)
  let l:max_file_size = 2 * 1024 * 1024

  if l:file_size <= l:max_file_size
    return
  endif

  set filetype=largefile
endfunc

" 判断文件是不是空的
func! utils#is_file_empty()
  return line('$') < 2
endfunc

" 获取配置文件数组
func! utils#get_config_files(dir)
  let l:root_path = expand('$HOME/.vim/' . a:dir . '/')
  let l:file_paths = glob(l:root_path . '*.vim', 0, 1) + glob(l:root_path . '*.lua', 0, 1)

  return l:file_paths
endfunc

