" 我的vim插件配置
"
" Maintainer:   tujiawei <15988803646@163.com>
" Last Change:  2021 Nov 8

" 设置vundle 运行环境和路径
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin(expand('~/.vim/bundle'))
  Plugin 'VundleVim/Vundle.vim'             " 必须
  Plugin 'preservim/nerdtree'               " 文件树
  Plugin 'Xuyuanp/nerdtree-git-plugin'      " git状态显示
  Plugin 'mhinz/vim-signify'                " 差异显示(文件)
  Plugin 'rhysd/conflict-marker.vim'        " git冲突解决
  Plugin 'mattn/emmet-vim'                  " emmet插件
  Plugin 'hail2u/vim-css3-syntax'           " css3
  Plugin 'posva/vim-vue'                    " vue 代码高亮
  Plugin 'jiangmiao/auto-pairs'             " 括号匹配
  Plugin 'neoclide/coc.nvim'                " 代码补全
  Plugin 'maxmellon/vim-jsx-pretty'         " jsx语法高亮
  Plugin 'vimcn/vimcdoc'                    " 中文文档
  Plugin 'airblade/vim-gitgutter'           " 状态栏 git 信息
  Plugin 'tpope/vim-fugitive'               " git操作包
  Plugin 'leafgarland/typescript-vim'       " typescript语法高亮
  Plugin 'ludovicchabant/vim-gutentags'     " tag管理,异步更新tag
  Plugin 'vim-airline/vim-airline'        " 状态栏美化
  Plugin 'vim-airline/vim-airline-themes' " 状态栏美化
  Plugin 'mg979/vim-visual-multi'           " 多光标选中及编辑
  Plugin 'iamcco/markdown-preview.nvim'     " markdown 预览
  Plugin 'junegunn/fzf'                     " 搜索
  Plugin 'junegunn/fzf.vim'
  Plugin 'simnalamburt/vim-mundo'           " undo tree 每一步动作都可视化
  Plugin 'nathanaelkane/vim-indent-guides'  " 缩进更明显
  Plugin 'kshenoy/vim-signature'            " 书签显示
  Plugin 'itchyny/vim-cursorword'           " 单词下划线
  Plugin 'lfv89/vim-interestingwords'       " 高亮
  Plugin 'zivyangll/git-blame.vim'          " 显示blame 信息
  Plugin 'voldikss/vim-floaterm'            " 悬浮终端
  Plugin 'tomasr/molokai'                   " 修改配色方案
  Plugin 'preservim/nerdcommenter'          " 快速注释插件
  " Plugin 'sickill/vim-monokai'            " 配色方案,没上面那个好看
  " 内容查找插件
  " grep.vim      https://github.com/yegappan/grep
  " ack.vim       https://github.com/mileszs/ack.vim
  " ctrlsf.vim    https://github.com/dyng/ctrlsf.vim
  " 代码片段
  " https://github.com/SirVer/ultisnips
call vundle#end()

" =======================================
" ======== voldikss/vim-floaterm ========
" =======================================

" 支持 <C-d> 关闭终端, 否则还要手动关一次
let g:floaterm_autoclose     = 2
let g:floaterm_keymap_new    = '<F9>'
let g:floaterm_keymap_prev   = '<F10>'
let g:floaterm_keymap_next   = '<F11>'
let g:floaterm_keymap_toggle = '<F12>'

" 我的电脑上有点问题
let g:floaterm_borderchars = '-|-|'

" ================================
" ======== tomasr/molokai ========
" ================================

" 匹配原始的 monokai 背景颜色
let g:molokai_original = 1

" 使 256 色版本尽可能接近默认（深色）GUI 版本
let g:rehash256 = 1

colorscheme molokai

" =====================================
" ======== sickill/vim-monokai ========
" =====================================

" 已注释，没上面那个好看
" colorscheme monokai

" ==========================
" ======== nerdtree ========
" =========================+

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
let g:NERDTreeIgnore = ['node_modules']

" 删除文件时自动删除对应的buffer
let g:NERDTreeAutoDeleteBuffer = 1

" 显示位置
let g:NERDTreeWinPos = 'right'

" 显示相同的目录树
" autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" 默认的显示图标
" let g:NERDTreeGitStatusIndicatorMapCustom = {
"    \ 'Modified'  :'✹',
"    \ 'Staged'    :'✚',
"    \ 'Untracked' :'✭',
"    \ 'Renamed'   :'➜',
"    \ 'Unmerged'  :'═',
"    \ 'Deleted'   :'✖',
"    \ 'Dirty'     :'✗',
"    \ 'Ignored'   :'☒',
"    \ 'Clean'     :'✔︎',
"    \ 'Unknown'   :'?',
"    \ }


" =========================
" ======== vim-vue ========
" =========================

" vim-vue 过滤无效的预处理器，加快速度
" 目前我用的只有这些
let g:vue_pre_processors = ['less', 'sass', 'scss', 'typescript']


" ==========================
" ======== coc.nvim ========
" ==========================

let g:coc_borderchars = ['-', '|', '-', '|', ' ', ' ', ' ', ' ']

" 交换文件写入磁盘的时间
" 300ms 内没有输入,更快的响应时间
set updatetime=300

" 高亮关键字及其对应的声明和使用的地方
autocmd CursorHold * silent! call CocActionAsync('highlight')

" 不传递消息给 ins-completion-menu
set shortmess+=c

" coc 全局插件
" 没有安装会自动安装
" coc-cssmodules: react 中 css module 跳转
" coc-vetur: vue 代码提示
" coc-emmet: emmet是不是可以直接用这个了
" coc-html-css-support: 类和id提示
" @yaegassy/coc-nginx: nginx配置 代码提示
" coc-yaml: @see {https://github.com/neoclide/coc-yaml}
" coc-sh: shell脚本提示
" coc-prettier: 代码格式化的，基本不用
" coc-lightbulb: 显示个小灯泡，玩玩
" coc-git: 没啥用,需要neovio才能显示blame
" coc-vimlsp: vim 语法支持
let g:coc_global_extensions = [
  \ 'coc-json', 'coc-tsserver', 'coc-html', 
  \ 'coc-css', 'coc-cssmodules', 
  \ 'coc-html-css-support',
  \ 'coc-vetur', 'coc-eslint',
  \ '@yaegassy/coc-nginx',
  \ 'coc-sh',
  \ 'coc-prettier',
  \ 'coc-lightbulb',
  \ 'coc-vimlsp',
  \ ]

" 设置@为关键词
autocmd FileType scss setl iskeyword+=@-@

" 始终显示标识
if has("nvim-0.5.0") || has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

" 检查最后光标前面是不是空格
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 使用tab切换选项
" pumvisible() 弹出菜单是否可见
" 补全之间跳转: https://github.com/neoclide/coc-snippets
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" 使用回车选中
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" 跳转到上一个错误
nmap <silent> [g <Plug>(coc-diagnostic-prev)

" 跳转到下一个错误
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" 代码跳转: 定义
nmap <silent> gd <Plug>(coc-definition)

" 代码跳转: 类型声明
nmap <silent> gy <Plug>(coc-type-definition)

" 代码跳转: 具体实现
nmap <silent> gi <Plug>(coc-implementation)

" 代码跳转: 使用
nmap <silent> gr <Plug>(coc-references)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" 显示文档
nnoremap <silent> K :call <SID>show_documentation()<CR>

" 重命名标识符
nmap <leader>rn <Plug>(coc-rename)

" 代码格式化
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

" 格式化整个文件
map <leader>F :Format<cr>

augroup mygroup
  autocmd!

  " 设置formatexpr指定的文件类型
  autocmd FileType typescript,typescriptreact,json setl formatexpr=CocAction('formatSelected')

  " 跳转占位符时更新签名
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" 选择应用范围
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" 触发代码相关动作
nmap <leader>ac <Plug>(coc-codeaction)

" 触发快速修复，不是每个错误都能修复的
nmap <leader>qf <Plug>(coc-fix-current)

" 显示变更信息
" 貌似不太行，直接报错了
" nmap <leader>xx <Plug>(coc-codelens-action)

" 函数和类映射
" 需要 lsp 'textDocument.documentSymbol' 支持
" 目前不支持
" xmap if <Plug>(coc-funcobj-i)
" omap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap af <Plug>(coc-funcobj-a)
" xmap ic <Plug>(coc-classobj-i)
" omap ic <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)

" 用 <C-s> 选择分为
" 需要 lsp 'textDocument/selectionRange' 支持
" 目前不支持
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)

" 添加命令 `:Format` 格式化当前缓冲区
command! -nargs=0 Format :call CocAction('format')

" 添加命令 `:Fold` 折叠当前缓冲区
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" 添加命令 `:OR` 管理当前缓冲区的 引入语句
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" 状态栏相关的配置，不需要，我用自己的
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" 按键映射
" 显示所有有问题的模块
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>

" 插件管理
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>

" 显示所有命令
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>

" 显示当前文件的所有标识符
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>

" 显示工作区的所有标识符
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>

" 对后一个项目做一次默认行为，没搞懂这个默认行为到底是什么
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>

" 对前一个项目做一次默认行为，没搞懂这个默认行为到底是什么
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>

" 恢复最新的CocList 比如 <space>a 打开了错误诊断，然后关掉了
" 再 <space>p 可以重新打开 错误诊断
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" 窗口或弹出提示重新映射滚动快捷键
" 实际好像并没有什么用
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif


" ========================================
" ======== airblade/vim-gitgutter ========
" ========================================

" 状态栏设置,依赖vim-gitgutter
" 设置git状态
" function! GitStatus()
"   let [a,m,r] = [0, 0, 0]
"   if exists('*GitGutterGetHunkSummary')
"     let [a,m,r] = GitGutterGetHunkSummary()
"   endif
"   return printf('+%d ~%d -%d ', a, m, r)
" endfunction
" 
" set statusline=
" set statusline+=%1*\[%n]                                  "buffernr
" set statusline+=%2*\ %<%F\                                 "文件路径
" set statusline+=%3*\ %y\                                   "文件类型
" set statusline+=%4*\ %{''.(&fenc!=''?&fenc:&enc).''}       "编码1
" set statusline+=%{(&bomb?\",BOM\":\"\")}\                 "编码2
" set statusline+=%#TabLine#%{coc#status()}%{get(b:,'coc_current_function','')} " 代码提示服务
" set statusline+=%5*\ %=\ %6*\ row:%l/%L\ (%03p%%)\        "光标所在行号/总行数 (百分比)
" set statusline+=%7*\ col:%03c\                            "光标所在列
" set statusline+=%8*\ %{GitStatus()}
" set statusline+=%9*\ %m%r%w\                            "修改? 只读? 保存?
" 
" " 单个标签设置
" function! MyTabLabel(n)
"   let buflist = tabpagebuflist(a:n)
"   let winnr = tabpagewinnr(a:n)
" 
"   " Add '+' if one of the buffers in the tab page is modified
"   let label = ''
"   for bufnr in buflist
"     if getbufvar(bufnr, "&modified")
"       let label = '+'
"       break
"     endif
"   endfor 
" 
"   "添加tabpage序号,方便ngt切换
"   return '  ['.a:n.label.']'.pathshorten(bufname(buflist[winnr - 1])).' '
" endfunction
" 
" 
" " 标签栏设置
" function! MyTabLine()
"   let s = ''
"   for i in range(tabpagenr('$'))
"     " 高亮
"     if i + 1 == tabpagenr()
"       let s .= '%#TabLineSel#'
"     else
"       let s .= '%#TabLine#'
"     endif
" 
"     " 添加序号
"     let s .= '%' . (i + 1) . 'T'
" 
"     " 单个标签设置
"     let s .= '%{MyTabLabel(' . (i + 1) . ')}'
"   endfor
" 
"   " 最后一个标签后面填充
"   let s .= '%#TabLineFill#%T'
" 
"   " 关闭标签右对齐
"   if tabpagenr('$') > 1
"     let s .= '%=%#TabLine#%999XX'
"   endif
" 
"   return s
" endfunction
" 
" set tabline=%!MyTabLine()


" ===============================
" ======== vim-gutentags ========
" ===============================

" gutentags 配置
" 搜索工程目录的标志
" 碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.svn', '.git', 'node_modules', 'package.json']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = 'tags'

let s:vim_tags = expand('~/.cache/tags')

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中
" 避免污染工程目录
let g:gutentags_cache_dir = s:vim_tags

" 检测 ~/.cache/tags 不存在就新建 
call utils#checkDir(s:vim_tags)

" ctags支持多个语言,如c
" 但是不支持typescript,typescriptreact,vue
" 配置 ctags 的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q', '--javascript-kinds=+fcmpvgc']

" 过滤文件及文件夹
" node_modules 太大了，还是手动跳进去吧
" public,test,prod 是因为dll,大概率不会碰到
let g:gutentags_ctags_extra_args += ['--exclude=node_modules', '--exclude=public', '--exclude=prod', '--exclude=test']


" =============================
" ======== vim-airline ========
" =============================

" 检测是否修改
let g:airline_detect_modified = 1

" 启用粘贴检测
let g:airline_detect_paste = 1

" 启用加密检测
let g:airline_detect_crypt = 1

" 需要支持 GUI 才行， 目前我用的不支持
" 需要本地和远程都装才会正常显示
" 不装字体显示会很奇怪
let g:airline_powerline_fonts = 0
let g:Powerline_symbols = 'fancy'

" 缓存高亮组
let g:airline_highlighting_cache = 1

" 只加载指定的插件
" 'coc', 'searchcount',
" 'wordcount', 'whitespace', 'mundo',
let g:airline_extensions = [
  \ 'branch', 'fugitiveline',
  \ 'gutentags', 'hunks',
  \ 'keymap', 'netrw',
  \ 'quickfix', 'tabline',
  \ 'fzf', 'term',
  \ ]

" 显示窗口tab
let g:airline#extensions#tabline#enabled = 1

" 不显示buffer
let g:airline#extensions#tabline#show_buffers = 0

" 标签栏的分隔符
let g:airline#extensions#tabline#alt_sep = 0
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

" 同上
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = '|'

" 不太清楚干什么的，也不知道哪里复制来的
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 2
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#tabs_label = 'Tabs'
let g:airline#extensions#tabline#overflow_marker = '…'

" 标签栏总体样式
" default | jsformatter | unique_tail |  unique_tail_improved
let g:airline#extensions#tabline#formatter = 'unique_tail'


" ==================================
" ======== vim-visual-multi ========
" ==================================

" 全选映射
" 选中所有和光标下的单词一样的单词
nmap <Leader><C-a> \\A

" ================================
" ======== vim-jsx-pretty ========
" ================================

" js 语法高亮
let g:vim_jsx_pretty_disable_js = 0

" jsx 语法高亮
let g:vim_jsx_pretty_disable_tsx = 0

" 这些标签下的标签不高亮
let g:vim_jsx_pretty_template_tags = ['html', 'jsx']

" 关闭标签高亮
let g:vim_jsx_pretty_highlight_close_tag = 1

" =========================================
" ======== markdown-preservim.nvim ========
" =========================================

" 进入 markdown 文件不自动打开预览
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 0

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 1

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 1

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

" 插件带来的增强
" " normal/insert
" <Plug>MarkdownPreview
" <Plug>MarkdownPreviewStop
" <Plug>MarkdownPreviewToggle
" 
" " example
" nmap <C-s> <Plug>MarkdownPreview
" nmap <M-s> <Plug>MarkdownPreviewStop
" nmap <C-p> <Plug>MarkdownPreviewToggle
"
" " Start the preview
" :MarkdownPreview
" 
" " Stop the preview
" :MarkdownPreviewStop


" ========================================
" ======== simnalamburt/vim-mundo ========
" ========================================

" 是否禁用
let g:mundo_disable = 0

" 宽度
let g:mundo_width = 45

" 预览高度
let g:mundo_preview_height = 15

" 在右侧打开
let g:mundo_right = 1

" 强制预览窗口在下方显示
let g:mundo_preview_bottom = 0

" 默认不显示帮助
let g:mundo_help = 0

" 按键映射
" let mundo_map_move_older = 'j'
" let mundo_map_move_newer = 'k'

" 还原后是否自动关闭
let g:mundo_close_on_revert = 0

" 默认渲染差异，未0可以更快渲染
" let g:mundo_preview_statusline
" let g:mundo_tree_statusline

" 自动显示预览
let g:mundo_auto_preview = 1

" 更新延迟 大一点更不容易卡
let g:mundo_playback_delay = 60

" tu: toggle undo
" tu: tree undo
noremap <silent> <space>tu :MundoToggle<cr>
 
" =================================================
" ======== nathanaelkane/vim-indent-guides ========
" =================================================

" 是否自动启动
let g:indent_guides_enable_on_vim_startup = 1

" 从第二层开始可视化显示缩进
let g:indent_guides_start_level = 2

" 色块宽度
let g:indent_guides_guide_size = 1

" 定义缩进的颜色
" let g:indent_guides_auto_colors = 0

" 快捷键 i 开/关缩进可视化
" nmap <silent> <Leader>i <Plug>IndentGuidesToggle

" hi IndentGuidesOdd  cterm=none    ctermfg=white   ctermbg=black
" hi IndentGuidesEven cterm=none    ctermfg=white   ctermbg=darkgrey

" =========================================
" ======== zivyangll/git-blame.vim ========
" =========================================

" 设置显示的快捷建
nnoremap <leader>b :<C-u>call gitblame#echo()<CR>

" =========================================
" ======== preservim/nerdcommenter ========
" =========================================

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
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

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

" ==============================
" ======== junegunn/fzf ========
" ==============================

" <C-n> <C-p> 切换历史命令
let g:fzf_history_dir = '~/.vim/.fzf_history'
let fzf_files_filter_dirs = [
  \ 'node_modules','.git',
  \ 'dist', 'prod', 'dev', 'bundle',
  \ '.swp', '.undo', '.view', '.backup',
\ ]
let fzf_files_filter_dirs = join(fzf_files_filter_dirs, '|')
let fzf_files_source = "find -regextype egrep -type f ! -regex \".*/(".fzf_files_filter_dirs.")/.*\""

let fzf_files_options = [
\ '--layout=reverse',
\ '--info=inline',
\ '--preview',
\ 'batcat --color=always --style=numbers --line-range=:50 {}',
\ ]

" 重写 :Files 的功能
command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview({'source': fzf_files_source, 'options': fzf_files_options, }), <bang>0)
