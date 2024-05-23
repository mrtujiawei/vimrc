" 自动命令配置
"
" Maintainer:  tujiawei <jiaweitu@marchthepolo.com>
" Last Change: 2023-09-06
if exists('g:load_mine_autocmd') || !has('autocmd')
  finish
endif

let g:load_mine_autocmd = 1

" 文件在外部改变时，提示重新载入
autocmd FocusGained,BufEnter *[a-zA-Z] silent! if (utils#current_file_readable()) | checktime | endif

" 再次打开时回到上次编辑的位置
autocmd BufReadPost * silent! call utils#toLastEditPosition()

" 非插入模式高亮当前行列
" autocmd! InsertEnter * set nocursorcolumn
" autocmd! InsertLeave * set cursorcolumn
autocmd InsertEnter * set nocursorline
autocmd InsertLeave * set cursorline

" 创建新文件时设置模板
autocmd BufNewFile * CommentCreate

" 如果只有一个用户窗口就直接关闭vim
autocmd BufEnter * silent! call utils#close_on_no_user_window()
autocmd BufEnter * silent! if (utils#is_file_empty()) | CommentCreate | endif

" 如果是空文件夹就打开目录树
" autocmd! vimenter * if (1 == empty(expand('%'))) | NERDTree | endif

" 保存前移除所有行尾的空格
" autocmd! BufWritePre *.js,*.json,*.jsx,*.ts,*.tsx,*.vue,*.css,*.less,*.scss,*.sh silent! :call utils#cleanExtraSpaces()

" 保存折叠 只匹配结尾是英文单词的文件
" 注意定时清除一下
autocmd BufWinLeave *[a-zA-Z] silent! if (utils#current_file_readable()) | mkview | endif

" 加 try catch 是为了防止 loadview 报错影响coc
autocmd BufReadPost *[a-zA-z] silent! if (utils#current_file_readable()) | try | loadview | catch | endtry | endif

" 这东西全局设置不生效，只能出此下策
autocmd BufReadPost * silent! set signcolumn=auto

autocmd BufWritePost ; silent! call utils#write_file_semi()

autocmd BufEnter * silent! call utils#large_file_check(expand('<afile>'))
