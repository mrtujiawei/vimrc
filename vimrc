" 我的vim配置
" Last Change:  2021 Oct 6
" Maintainer:   tujiawei <15988803646@163.com>
" License:	    This file is placed in the public domain.

let s:utils = {}

" 检查目录是否存在
" 如果不存在则新建一个目录
function! s:utils.checkDir(dir) dict
  if !isdirectory(a:dir)
    silent call mkdir(a:dir, 'p')
  endif
endfunction

" ======= 兼容配置 =======
" let g:skip_defaults_vim = 1 " 取消加载defaults.vim
runtime! debian.vim           " 兼容性设置 尽量不要删除
runtime! ftplugin/man.vim     " 方便使用man
set nocompatible              " 不兼容vi

" 让Esc的生效更快捷
set ttimeout
set ttimeoutlen=100

" ======= 页面配置 =======
set number                    " 显示行号
set relativenumber            " 显示相对行号

set textwidth=1000000         " 超过后加换行符
set wrap                      " 多行显示 不加换行符
set scrolloff=5               " 上下间距
set sidescrolloff=15          " 横向滚动时空出的行数
set wrapmargin=2              " 折行处与窗口右边缘空出的字符

set t_Co=256                  " 256色
set termguicolors             " 更好看一点,会导致代码提示非常的亮眼 --。 眼睛会瞎
set background=dark           " 深色背景

set laststatus=2              " 状态栏 0 -> 不显示 1 -> 多窗口显示 2 -> 显示
set ruler                     " 显示光标当前位置
set showcmd                   " 显示操作命令
set showmode                  " 显示模式
set splitbelow                " 上下分割时显示在下边
set splitright                " 光标直接在右边

" ======= 搜索配置 =======
set hlsearch                  " 高亮匹配
set ignorecase	              " 搜索忽略大小写
set incsearch		              " 搜索时自动滚动屏幕到匹配的行
set showmatch		              " 显示匹配的字符
set smartcase		              " 没有大小写区别时忽略大小写，否则不忽略

" ======= 文件配置 =======
set autochdir                   " 自动切换到当前文件夹下
" set autowrite	  	            " 切换缓冲区时自动保存
set encoding=utf-8              " 文件编码 utf-8
set hidden		                  " 允许有未保存的修改时可以切换缓冲区
" 搜索文件名的后缀
set suffixesadd=.js,.jsx,.json,.ts,.tsx.vue,.css,.less,.scss
set history=1000                " 保存操作历史
set undofile                    " 设置undo的文件，关闭后重新打开还能够撤销

" 检查临时文件是否存在
call s:utils.checkDir(expand('~/.vim/.backup'))
call s:utils.checkDir(expand('~/.vim/.swp'))
call s:utils.checkDir(expand('~/.vim/.undo'))

set backupdir=~/.vim/.backup//  
set directory=~/.vim/.swp//
set undodir=~/.vim/.undo//

" ======= 编辑配置 =======
set autoindent                  " 自动缩进
set autoread                    " 文件监视，修改后提示

" 主配置文件中有效，不加载默认配置
" let skip_defaults_vim = 1 
" 可以删除行首空白字符，换行符，插入模式开始处之前的字符
" set backspace=indent,eol,start
set backspace=2                 " backspace可以删除到上一行
" set cursorline                  " 高亮当前行,下面有配置，插入模式不高亮
" set cursorcolumn              " 高亮当前列,下面有配置，插入模式不高亮
set clipboard=unnamedplus       " 直接使用系统剪切板 需要安装vim-gtk
set expandtab                   " tab转space
set foldenable                  " 允许折叠
set foldmethod=indent           " 手动折叠
set foldlevel=10                " 超过10层自动折叠
set smartindent                 " 智能缩进
set mouse=a		                  " 支持鼠标操作
set shiftwidth=2                " tab宽度
set softtabstop=2               " 连续的space当成tab来看，可以同时删
set tabstop=2                   " \t的宽度
set wildmenu                    " 命令模式下,tab补全
set wildmode=longest:list,full  " 第一次显示列表，之后依次选下一个
set synmaxcol=0                 " 不限制单行最大列
" set wildignore                  " 忽略文件
" set showbreak=\ \ \ \ \ \ \ \ " 换行之前加8个空格

" ======= 快捷键配置 =======
set magic                       " 改变搜索的行为

let mapleader=" "
nmap <Leader><Space> :Files<Cr>
let mapleader="\\"
nmap <C-K><C-B> :NERDTreeToggle<CR>
map tn :tabnext<CR>
map tp :tabprevious<CR>

" react 快速生成模板
iabbr rcc import { memo,} from 'react';<CR><CR>
      \const Comp = () => {
      \<CR>return (<CR>null);
      \};<CR><CR>
      \export default memo(Comp);<Esc>/Comp<C-R>

" ======= 脚本配置 =======
if has("syntax")
  syntax on " 开启语法高亮
endif

if has("autocmd")
  filetype plugin indent on " 加载插件自动缩进规则
  " 第二次打开回到上次编辑的位置
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif 
  " 进入插入模式取消高亮
  " au InsertEnter * se nocul " 用浅色高亮当前行
  " au InsertLeave * se cul   " 用浅色高亮当前行
  " au InsertEnter * se nocuc " 用浅色高亮当前列
  " au InsertLeave * se cuc   " 用浅色高亮当前列
  au BufNewFile * :call SetTemplate()
  au FileType * :call SetRunCommand()

  " 可以进vim 直接打开侧边栏
  " 如果是由一个用户窗口就直接关闭vim
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

  " 进文件自动打开文件目录, 除了提交commit
  " autocmd vimenter * if (-1 == match(expand('%'), 'COMMIT_EDITMSG')) | NERDTree | endif
  " 如果是空文件夹才打开
  " autocmd vimenter * if (1 == empty(expand('%'))) | NERDTree | endif
  " 目前我不想打开文件树
endif

" ======= 函数定义 =======

" 页面模板
func SetTemplate()
  " 搞笑
  " * 本人学识渊博、经验丰富，代码风骚、效率恐怖，
  " * c/c++ c#、java、php 安卓 ios  python node.js  无不精通玩转，
  " * 熟练掌握各种框架，并自写语言，创操作系统 写cpu处理器构架，做指令集成  。
  " * 深山苦练20余年，一天只睡3小时，千里之外定位问题，瞬息之间修复上线。
  " * 身体强壮、健步如飞，可连续工作100小时不休息，讨论技术方案9小时不喝水，
  " * 上至研发cpu芯片、带项目、出方案  弄计划，下至盗账号、黑网站、
  " * shell提权挂马、攻击同行、拍片摄影、泡妞把妹纸、开挖掘机 、威胁pm，啥都能干。
  " * 泡面矿泉水已备好，学校不支持已辍学，家人不支持已断绝关系，老婆不支持已离婚，
  " * 小孩不支持已送孤儿院，备用电源万兆光纤永不断电断网，门口已埋地雷无人打扰
  if &filetype == 'sh'

    " #!/bin/bash
    " #Filename: index.sh
    " #Author: Mr Prince
    " #Date: 2020-09-02 14:04:37

    call setline(1,"\#!/bin/bash") 
    call append(line("."), "\#Filename: ".expand("%")) 
    call append(line(".")+1, "\#Author: Mr Prince") 
    call append(line(".")+2, "\#Date: ".strftime("%Y-%m-%d %T")) 
    call append(line(".")+3, "")
    normal G
  elseif &filetype == 'javascript' || 'typescript' == &filetype || 'typescriptreact' == &filetype

    " /**
    "  * 
    "  * @filename: index.js
    "  * @author: Mr Prince
    "  * @date: 2020-09-02 14:05:08
    "  */

    call setline(1, "\/**")
    call append(line("."), "\ * ")
    call append(line(".")+1, "\ * @filename: ".expand("%"))
    call append(line(".")+2, "\ * @author: Mr Prince")
    call append(line(".")+3, "\ * @date: ".strftime("%Y-%m-%d %T"))
    call append(line(".")+4, "\ */")
    call append(line(".")+5, "")
    normal 2ggA
  elseif &filetype == 'vue'

    " <template>
    " 
    " </template>
    " 
    " <script>
    " 
    " </script>

    call setline(1, "\<template>")
    call append(line("."), "")
    call append(line(".")+1, "</template>")
    call append(line(".")+2, "")
    call append(line(".")+3, "<script>")
    call append(line(".")+4, "")
    call append(line(".")+5, "</script>")
    normal 2ggA
  endif
endfunc

" 设置运行快捷键的命令
func SetRunCommand()
  if &filetype == 'sh'
    nmap <C-B> :w<CR>:!sh % > /tmp/vim.run.log<CR>:vsp /tmp/vim.run.log<CR>
  elseif 'javascript' == &filetype
    nmap <C-B> :w<CR>:!node % <CR>
  elseif 'html' == &filetype
    nmap <C-B> :w<CR>:!google-chrome-stable %<CR>
  elseif 'java' == &filetype
    nmap <C-B> :w<CR>:!javac % && java %:r<CR>
  elseif 'go' == &filetype
    nmap <C-B> :w<CR>:!go run %<CR>
  endif
  imap <C-B> <ESC><C-B>
endfunc

" 文件自动保存到本地
func Commit(operate, message)
  :w
  exec ":!git add ".expand('%')." && git commit -m  ".'"'.a:operate.'('.expand('%:p').'):'.a:message.'"'
endfunc

" 提交到远程分支
func Push()
  :!git push
endfunc

" 本地打包测试
function BuildTest() 
  :!yarn build:test 
endfunc

" 本地打包线上
function Build()
  :!yarn build 
endfunc

" 运行测试代码
function Test()
  :!yarn test
endfunc

" 在右侧打开终端
function VerticalTerminal()
  :vertical terminal
endfunc

" 翻译当前光标下的单词
function FanYi()
  execute '!fanyi '.expand('<cword>')
endfunc

" ======= 自定义命令 =======

command! -n=+ -complete=dir -bar GitCommit :call Commit(<f-args>)
command! -n=0 -complete=dir -bar GitPush :call Push()
command! -n=0 -complete=dir -bar BuildTest :call BuildTest()
command! -n=0 -complete=dir -bar Build :call Build()
command! -n=0 -complete=dir -bar Test :call Test()
command! -n=0 -complete=dir -bar T :call VerticalTerminal()
command! -n=0 -complete=dir -bar SetTemplate :call SetTemplate()
command! -n=0 -complete=dir -bar FY :call FanYi()

" ======= 插件配置 =======

" 设置vundle 运行环境和路径
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin(expand('~/.vim/bundle'))
  Plugin 'VundleVim/Vundle.vim'           " 必须
  Plugin 'preservim/nerdtree'             " 文件树
  Plugin 'Xuyuanp/nerdtree-git-plugin'    " git状态显示
  Plugin 'mhinz/vim-signify'              " 差异显示(文件)
  Plugin 'rhysd/conflict-marker.vim'      " git冲突解决
  Plugin 'mattn/emmet-vim'                " emmet插件
  Plugin 'hail2u/vim-css3-syntax'         " css3
  Plugin 'posva/vim-vue'                  " vue 代码高亮
  Plugin 'jiangmiao/auto-pairs'           " 括号匹配
  Plugin 'neoclide/coc.nvim'              " 代码补全
  Plugin 'maxmellon/vim-jsx-pretty'       " jsx语法高亮
  Plugin 'vimcn/vimcdoc'                  " 中文文档
  Plugin 'airblade/vim-gitgutter'         " 状态栏 git 信息
  Plugin 'tpope/vim-fugitive'             " git操作简化
  Plugin 'leafgarland/typescript-vim'     " typescript语法高亮
  Plugin 'ludovicchabant/vim-gutentags'   " tag管理,异步更新tag
  " Plugin 'vim-airline/vim-airline'        " 状态栏美化
  " Plugin 'vim-airline/vim-airline-themes' " 状态栏美化
  Plugin 'mg979/vim-visual-multi'         " 多光标选中及编辑
  Plugin 'godlygeek/tabular'              " markdown 表格
  Plugin 'iamcco/markdown-preview.nvim'   " markdown 预览
  Plugin 'junegunn/fzf'                   " 搜索
  Plugin 'junegunn/fzf.vim'
call vundle#end()           

" vim-vue 过滤无效的预处理器，加快速度
let g:vue_pre_processors = ['less', 'sass', 'scss', 'typescript']

" vim-visual-multi
" 全选映射
nmap <C-a> \\A

" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
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

" gutentags 配置
" 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.svn', '.git', 'node_modules', 'package.json']
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = 'tags'
" 将自动生成的 tags 文件全部放入 /opt/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建 
call s:utils.checkDir(s:vim_tags)

" ctags支持多个语言,如下c,但是不支持typescript,typescriptreact,vue
" 配置 ctags 的参数 "
let g:gutentags_ctags_extra_args = [
      \ '--fields=+niazS', '--extra=+q', 
      \ '--javascript-kinds=+fcmpvgc', 
      \ '--typescript-kinds=+fcmpvgc', 
      \ '--typescriptreact-kinds=+fcmpvgc',
      \ '--vue-kinds=+fcmpvgc',
      \ ]

" 过滤文件及文件夹
" node_modules 太大了，还是手动跳进去吧
" public,test,prod 是因为dll,大概率不会碰到
let g:gutentags_ctags_extra_args += ['--exclude=node_modules', '--exclude=public', '--exclude=prod', '--exclude=test']

let g:airline_extensions = []
" 显示窗口tab和buffer
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#alt_sep = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 2
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#tabs_label = 'Tabs'
let g:airline#extensions#tabline#overflow_marker = '…'
let g:airline#extensions#tabline#formatter = 'default'

" coc 全局插件，没有安装会自动安装
let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-html', 'coc-css', 'coc-vetur']

" nerdtree-git-plugin 配置
" 如果只有一个NERDTree窗口，就直接关闭
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusShowIgnored = 0
let g:NERDTreeIgnore=['node_modules']

let g:NERDTreeGitStatusIndicatorMapCustom = {
   \ 'Modified'  :'✹',
   \ 'Staged'    :'✚',
   \ 'Untracked' :'✭',
   \ 'Renamed'   :'➜',
   \ 'Unmerged'  :'═',
   \ 'Deleted'   :'✖',
   \ 'Dirty'     :'✗',
   \ 'Ignored'   :'☒',
   \ 'Clean'     :'✔︎',
   \ 'Unknown'   :'?',
   \ }

" coc 配置 
set updatetime=300
set shortmess+=c

" 始终显示列
if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

" 使用tab切换选项
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 手动触发代码提示
" 需要在插入模式下
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" 使用回车选中
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" 高亮关键字及其对应的声明和使用的地方
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,typescriptreact,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" 其实这个挺好看的
set statusline=
set statusline+=%1*\[%n]                                  "buffernr
set statusline+=%2*\ %<%F\                                 "文件路径
set statusline+=%3*\ %y\                                   "文件类型
set statusline+=%4*\ %{''.(&fenc!=''?&fenc:&enc).''}       "编码1
set statusline+=%{(&bomb?\",BOM\":\"\")}\                 "编码2
set statusline+=%#TabLine#%{coc#status()}%{get(b:,'coc_current_function','')} " 代码提示服务
set statusline+=%5*\ %=\ %6*\ row:%l/%L\ (%03p%%)\        "光标所在行号/总行数 (百分比)
set statusline+=%7*\ col:%03c\                            "光标所在列

" 设置git状态
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d ', a, m, r)
endfunction
set statusline+=%8*\ %{GitStatus()}
set statusline+=%9*\ %m%r%w\                            "修改? 只读? 保存?

" 标签栏设置
function! MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'

    " the label is made by MyTabLabel()
    let s .= '%{MyTabLabel(' . (i + 1) . ')}'
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'

  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999XX'
  endif

  return s
endfunction

" 单个标签设置
function! MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)

  " Add '+' if one of the buffers in the tab page is modified
  let label = ''
  for bufnr in buflist
    if getbufvar(bufnr, "&modified")
      let label = '+'
      break
    endif
  endfor 

  "添加tabpage序号,方便ngt切换
  return '  ['.a:n.label.']'.pathshorten(bufname(buflist[winnr - 1])).' '
endfunction

set tabline=%!MyTabLine()

" %{n}* 使用
hi user1    cterm=none    ctermfg=black  ctermbg=cyan    gui=none guibg=#840c0c guifg=#ffffff
hi user2    cterm=none    ctermfg=white  ctermbg=yellow  gui=none guibg=#ffff77 guifg=black
hi user3    cterm=none    ctermfg=white  ctermbg=blue    gui=none guibg=#d59159 guifg=black
hi user4    cterm=none    ctermfg=white  ctermbg=green   gui=none guibg=#8d6c47 guifg=black
hi user5    cterm=none    ctermfg=black  ctermbg=cyan    gui=none guibg=#3a406e guifg=#000000
hi user6    cterm=bold    ctermbg=white  ctermfg=black   gui=none guibg=#acff84 guifg=black
hi user7    cterm=none    ctermbg=white  ctermfg=yellow  gui=none guibg=#77cf77 guifg=black
hi user8    cterm=none    ctermbg=white  ctermfg=yellow  gui=none guibg=#66b06f guifg=black
hi user9    cterm=none    ctermbg=white  ctermfg=yellow  gui=none guibg=#60af9f guifg=black

" %#RightArror# 这样来使用
" set statusline+=%#RightArror#▶
hi RightArror   cterm=none    ctermfg=yellow  ctermbg=cyan    gui=none guibg=#ffff77 guifg=#840c0c gui=bold

" 提示相关颜色
hi Pmenu    ctermfg=black ctermbg=gray                            guibg=#333333
hi PmenuSel ctermfg=7     ctermbg=4                      gui=none guibg=#444444 guifg=#ffffff

hi TabLineSel   cterm=none    ctermfg=yellow  ctermbg=cyan    gui=none guibg=#ffff77 guifg=#840c0c gui=bold
hi TabLine    cterm=none    ctermbg=white  ctermfg=yellow  gui=none guibg=#60af9f guifg=black
hi TabLineFill    cterm=none    ctermbg=white  ctermfg=yellow  gui=none guibg=#77cf77 guifg=black
