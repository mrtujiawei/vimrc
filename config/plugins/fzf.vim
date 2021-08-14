" junegunn/fzf
"
" 模糊搜索插件
"
" Maintainer: mrtujiawei <m15988803646@163.com>
" Last Change: 2023-08-29

" <C-n> <C-p> 切换历史命令

let g:fzf_history_dir = '~/.vim/.fzf_history'
let fzf_files_filter_dirs = [
  \ 'node_modules','.git',
  \ 'dist', 'prod', 'dev', '.bundle',
  \ '.swp', '.undo', '.view', '.backup',
  \ '.pub-cache', '.mozilla', '.pnpm-store',
  \ '.java', '.dartServer', '.config',
  \ '.local', '.oh-my-zsh', '.pm2',
  \ '.node-gyp', '.gradle',
  \ '.neo-swp', '.neo-undo', '.neo-view', '.neo-backup'
\ ]
let fzf_files_filter_dirs = join(fzf_files_filter_dirs, '|')
let fzf_files_source = "find -regextype egrep -type f ! -regex \".*/(".fzf_files_filter_dirs.")/.*\""

let fzf_files_options = [
\ '--layout=reverse',
\ '--info=inline',
\ '--preview',
\ 'batcat --color=always --style=numbers --line-range=:50 {}',
\ ]

" mac 会报错
if !has('mac') 
  " 重写 :Files 的功能
  command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview({'source': fzf_files_source, 'options': fzf_files_options, }), <bang>0)
endif

