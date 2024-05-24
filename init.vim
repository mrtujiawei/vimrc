" neovim 配置入口文件
"
" Maintainer: mrtujiawei <m15988803646@163.com>
" Last Change: 2024-05-24

let s:paths = utils#get_config_files('config')
let s:paths += utils#get_config_files('config/plugins')

for s:path in s:paths
  exec 'source ' . s:path
endfor
