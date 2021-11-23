" 我的vim基本配置
"
" Maintainer:   tujiawei <15988803646@163.com>
" Last Change:  2021 Nov 8

if exists('g:load_mine_basic')
  finish
endif

let g:load_mine_basic = 1

" ==========================
" ======== 兼容配置 ========
" ==========================

" 取消加载defaults.vim
" 主配置文件中有效，不加载默认配置
" let g:skip_defaults_vim = 1

" 兼容性设置 尽量不要删除
runtime! debian.vim

" 方便使用man
runtime! ftplugin/man.vim

" 不兼容vi
set nocompatible

" 让Esc的生效更快捷
set ttimeout
set ttimeoutlen=100

" 响铃
" set errorbells

" 屏幕会闪，还是不要了
" set visualbell

" 可视铃声
" set t_vb

" 等待时间
" set ttimeoutlen=

" 显示折叠的列宽度
" set foldcolumn=1

" 文件类型检测
" set fileformats=unix,dos,mac


" ==========================
" ======== 页面配置 ========
" ==========================

" 显示行号 & 相对行号
set number
set relativenumber

" 默认不换行
set textwidth=0

" 多行显示 不加换行符
set wrap

" 上下间距
set scrolloff=5

" 横向滚动时空出的行数
set sidescrolloff=15

" 折行处与窗口右边缘空出的字符
set wrapmargin=2

" 终端256色
set t_Co=256

" 终端显示更好看一点
set termguicolors

" 深色背景
set background=dark

" 状态栏 0 -> 不显示 1 -> 多窗口显示 2 -> 显示
set laststatus=2

" 显示光标当前位置
set ruler

" 显示操作命令
set showcmd

" 显示模式
set showmode

" 上下分割时显示在下边
set splitbelow

" 光标直接在右边
set splitright

" 切换标签行为切换
set switchbuf=useopen,usetab,newtab,split

" 一直显示标签栏
set showtabline=2


" ==========================
" ======== 搜索配置 ========
" ==========================

" 改变搜索的行为
set magic

" 高亮匹配
set hlsearch

" 搜索忽略大小写
set ignorecase

" 搜索时自动滚动屏幕到匹配的行
set incsearch

" 显示匹配的字符
set showmatch

" 没有大小写区别时忽略大小写，否则不忽略
set smartcase

" 括号匹配高亮的十分之 match 秒
" set match=2

" 搜索到底后继续往下会回到开头
" set wrapscan

" 到底之后不回头
" set nowrapscan

" ==========================
" ======== 编辑配置 ========
" ==========================

" 自动切换到当前文件夹下
" fzf 其实更方便
" set autochdir

" 切换缓冲区时自动保存
" set autowrite

" 允许有未保存的修改时可以切换缓冲区
set hidden

" 文件编码 utf-8
set encoding=utf-8

" 搜索文件名的后缀
set suffixesadd=.js,.jsx,.json,.ts,.tsx.vue,.css,.less,.scss

" 保存操作历史
set history=1000

" 设置undo的文件，关闭后重新打开还能够撤销
set undofile

" 检查临时文件是否存在
call utils#checkDir(expand('~/.vim/.backup'))
call utils#checkDir(expand('~/.vim/.swp'))
call utils#checkDir(expand('~/.vim/.undo'))

set backupdir=~/.vim/.backup//  
set directory=~/.vim/.swp//
set undodir=~/.vim/.undo//

" 离开 Insert 模式时自动切换至英文输入法
" 现在是通过ssh连的，根本没法起作用
set noimdisable

" 设置为双字宽显示，否则无法完整显示如:☆
" set ambiwidth=double

" 自动缩进
set autoindent                  

" 文件监视，修改后提示
" 类似重新加载
set autoread

" 可以删除行首空白字符，换行符，插入模式开始处之前的字符
" set backspace=indent,eol,start
" backspace可以删除到上一行
set backspace=2 

" 有类似游戏中的光标显示，但是感觉太骚了，不适合我
" 高亮当前行,下面有配置，插入模式不高亮
set cursorline
" 高亮当前列,下面有配置，插入模式不高亮
set cursorcolumn

" 直接使用系统剪切板 需要安装vim-gtk
set clipboard=unnamedplus

" tab转space
set expandtab

" 更智能
set smarttab

" 允许折叠
set foldenable

" 手动折叠
set foldmethod=indent

" 超过1000层自动折叠
set foldlevel=1000

" 智能缩进
set smartindent

" 支持鼠标操作
set mouse=a

" tab宽度
set shiftwidth=2

" 连续的space当成tab来看，可以同时删
set softtabstop=2

" \t的宽度
set tabstop=2

" 命令模式下,tab补全
set wildmenu

" 第一次显示列表，之后依次选下一个
set wildmode=longest:list,full

" 不限制单行最大列
set synmaxcol=0

" 忽略文件
set wildignore+=*/.git/*,*/.svn/*,*/.DS_Store

" 换行之前加8个空格
" set showbreak=\ \ \ \ \ \ \ \ 

" 改变开始换行的方式
set linebreak

" mksession 保存的状态
set sessionoptions+=globals

" ==========================
" ======== 脚本配置 ========
" ==========================

if has("syntax")
  " 开启语法高亮
  syntax on
endif

" 文件类型检测
" 加载插件自动缩进规则
filetype plugin indent on

" 执行宏命令时不要重绘
set lazyredraw


" ==============================
" ======== 自动命令配置 ========
" ==============================

if has("autocmd") 
  " 文件在外部改变时，提示重新载入
  autocmd FocusGained,BufEnter *[a-zA-Z] silent checktime

  " 再次打开时回到上次编辑的位置
  autocmd BufReadPost * call utils#toLastEditPosition()

  " 非插入模式高亮当前行列
  autocmd InsertEnter * se nocursorcolumn
  autocmd InsertLeave * se cursorcolumn
  autocmd InsertEnter * se nocursorline
  autocmd InsertLeave * se cursorline

  " 创建新文件时设置模板
  au BufNewFile * :call utils#setTemplate()
  au bufEnter * :call utils#setRunCommand()

  " 如果只有一个用户窗口就直接关闭vim
  autocmd bufenter * call utils#closeOnNoUserWindow()

  " 如果是空文件夹就打开目录树
  " autocmd vimenter * if (1 == empty(expand('%'))) | NERDTree | endif

  " 保存前移除所有行尾的空格
  autocmd BufWritePre *.js,*.json,*.jsx,*.ts,*.tsx,*.vue,*.css,*.less,*.scss,*.sh :call utils#cleanExtraSpaces()

  " 保存折叠 只匹配结尾是英文单词的文件
  " 注意定时清除一下
  autocmd BufWinLeave *[a-zA-Z] silent mkview
  autocmd BufReadPost *[a-zA-z] silent loadview
endif


" ============================================
" ======== 自定义的一些颜色和系统配置 ========
" ============================================

" %{n}* 使用
hi user1        cterm=none    ctermfg=black   ctermbg=cyan    gui=none  guifg=#ffffff   guibg=#840c0c   
hi user2        cterm=none    ctermfg=white   ctermbg=yellow  gui=none  guifg=black     guibg=#ffff77   
hi user3        cterm=none    ctermfg=white   ctermbg=blue    gui=none  guifg=black     guibg=#d59159   
hi user4        cterm=none    ctermfg=white   ctermbg=green   gui=none  guifg=black     guibg=#8d6c47   
hi user5        cterm=none    ctermfg=black   ctermbg=cyan    gui=none  guifg=#000000   guibg=#3a406e   
hi user6        cterm=bold    ctermfg=black   ctermbg=white   gui=none  guifg=black     guibg=#acff84   
hi user7        cterm=none    ctermfg=yellow  ctermbg=white   gui=none  guifg=black     guibg=#77cf77   
hi user8        cterm=none    ctermfg=yellow  ctermbg=white   gui=none  guifg=black     guibg=#66b06f   
hi user9        cterm=none    ctermfg=yellow  ctermbg=white   gui=none  guifg=black     guibg=#60af9f   

" %#RightArror# 这样来使用
" set statusline+=%#RightArror#▶
hi RightArror   cterm=none    ctermfg=yellow  ctermbg=cyan    gui=none  guifg=#840c0c   guibg=#ffff77   gui=bold

" 系统高亮组
hi Pmenu                      ctermfg=black   ctermbg=gray                              guibg=#333333
hi PmenuSel                   ctermfg=7       ctermbg=4       gui=none  guifg=#ffffff   guibg=#444444   
hi TabLineSel   cterm=none    ctermfg=yellow  ctermbg=cyan    gui=none  guifg=#840c0c   guibg=#ffff77   gui=bold
hi TabLine      cterm=none    ctermfg=yellow  ctermbg=white   gui=none  guifg=black     guibg=#60af9f   
hi TabLineFill  cterm=none    ctermfg=yellow  ctermbg=white   gui=none  guifg=black     guibg=#77cf77   
hi CursorLine   cterm=none    ctermbg=black   ctermbg=cyan    gui=none  guifg=#ffffff   guibg=#333333   gui=bold
hi CursorLine   cterm=none    ctermfg=white   ctermbg=cyan    gui=none  guifg=green     guibg=#202020   gui=bold
hi CursorColumn cterm=none    ctermfg=white   ctermbg=cyan    gui=none  guifg=green     guibg=#202020   gui=bold
