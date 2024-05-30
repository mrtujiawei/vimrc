" preservim/nerdtree
"
" 目录/文件侧边栏
"
" Maintainer: mrtujiawei <m15988803646@163.com>
" Last Change: 2023-08-28

" 自动切换目录
let g:NERDTreeChDirMode = 2

" 打开文件后自动关闭 侧边栏
" let g:NERDTreeQuitOnOpen = 3

" 如果只有一个子节点，不要折叠
let g:NERDTreeCascadeSingleChildDir = 0

" 自动删除无效的buffer
let g:NERDTreeAutoDeleteBuffer = 1

" 显示书签
" let g:NERDTreeShowBookmarks = 1

" 标签聚焦
" 并没有找到这个配置
let g:nerdtree_tabs_focus_on_files = 1

" 宽度
" let g:NERDTreeWinSize = 40

" 显示行号
let g:NERDTreeShowLineNumbers = 1

" nerdtree 显示git状态使用默认的字体
let g:NERDTreeGitStatusUseNerdFonts = 0

" 不显示忽略的状态
let g:NERDTreeGitStatusShowIgnored = 0

" 未提交的文件是否显示 'all' => 全部显示
let g:NERDTreeGitStatusUntrackedFilesMode = 'normal'

" 是否隐藏 [  ]
let g:NERDTreeGitStatusConcealBrackets = 0

" 忽略文件夹，太慢
let g:NERDTreeIgnore = ['node_modules', '\.dSYM$', '\.class$']

" 显示位置
let g:NERDTreeWinPos = 'right'

" 显示相同的目录树
" autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
