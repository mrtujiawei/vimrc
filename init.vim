" neovim 配置入口文件
"
" Maintainer: mrtujiawei <m15988803646@163.com>
" Last Change: 2024-05-24

let s:paths = utils#get_config_files('config')
let s:paths += utils#get_config_files('config/plugins')

for s:path in s:paths
  exec 'source ' . s:path
endfor

" 五分钟检测一次，关闭所有 hidden 的 buffer
call timer_start(5 * 60 * 1000, 'utils#close_hidden_buffers', { 'repeat': -1 })
