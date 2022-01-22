" 未使用的脚本
"
" Maintainer: mrtujiawei <m15988803646@163.com>
" Last Change: 2022-01-03


" 输入法插件，省的切换输入法
" 可选, 用于提升词库加载性能
Plugin 'ZSaberLv0/ZFVimIM'
Plugin 'ZSaberLv0/ZFVimJob' 
function! s:myLocalDb()
  let db = ZFVimIM_dbInit({
        \   'name' : 'YourDb',
        \ })
  call ZFVimIM_cloudRegister({
        \   'mode' : 'local',
        \   'dbId' : db['dbId'],
        \   'repoPath' : '/path/to/repo', " 词库路径
        \   'dbFile' : '/YourDbFile', " 词库文件, 相对 repoPath 的路径
        \   'dbCountFile' : '/YourDbCountFile', " 非必须, 词频文件, 相对 repoPath 的路径
        \ })
endfunction

autocmd User ZFVimIM_event_OnDbInit call s:myLocalDb()

Plugin 'ZSaberLv0/ZFVimIM'
Plugin 'ZSaberLv0/ZFVimJob' " 可选, 用于提升词库加载性能
Plugin 'ZSaberLv0/ZFVimGitUtil' " 可选, 如果你希望定期自动清理词库 push 历史
Plugin 'YourUserName/ZFVimIM_pinyin_base' " 你的词库
Plugin 'ZSaberLv0/ZFVimIM_openapi' " 可选, 百度云输入法

" 国内辣鸡网络, 可以尝试用这个镜像, 与 github 互通
Plugin 'https://hub.fastgit.org/YourUserName/ZFVimIM_pinyin_base' " 你的词库

" 已经改成 :Format 了，比这个好用多了
Plugin 'godlygeek/tabular'              " markdown 表格 直接 :Format

" 悬浮终端，貌似 neovim 中才有用
Plugin 'voldikss/vim-floaterm'

" vim 执行sql
" https://github.com/cosminadrianpopescu/vim-sql-workbench
