"
"  __  __               _
" |  \/  |_   _  __   _(_)_ __ ___  _ __ ___
" | |\/| | | | | \ \ / / | '_ ` _ \| '__/ __|
" | |  | | |_| |  \ V /| | | | | | | | | (__
" |_|  |_|\__, |   \_/ |_|_| |_| |_|_|  \___|
"         |___/
"
" 我的vim基本配置
"
" Maintainer:   tujiawei <15988803646@163.com>
" Last Change:  2021 Nov 8
"
" Sections:
"   -> 兼容配置
"   -> 特殊配置
"   -> 页面配置
"   -> 搜索配置
"   -> 编辑配置
"   -> 脚本配置
"   -> 自动命令配置

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

" 一些终端上会出现白色背景
if &term=~'256color'
  set t_ut=
endif

" tmux 中颜色高亮
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum""]"

" ==========================
" ======== 特殊配置 ========
" ==========================

" 让Esc的生效更快捷
set ttimeout

" 等待时间
set ttimeoutlen=10

" 交换文件写入磁盘的时间
" 300ms 内没有输入,更快的响应时间
set updatetime=300

" 响铃
" set errorbells

" 屏幕会闪，还是不要了
" set visualbell

" 可视铃声
" set t_vb

" 文件类型检测
set fileformats=unix,dos,mac


" ==========================
" ======== 页面配置 ========
" ==========================

" gui 字体，用不上
" set guifont=YaHei\ Consolas\ Hybrid\ 14
" set guifont=*

" 显示行号 & 相对行号
set number
set relativenumber

" 显示标识列
" 主要用来显示git信息
" 放在这里貌似有点问题
" 总是不会起作用，奇怪
set signcolumn=auto

try
  set diffopt+=internal,algorithm:patience
catch /.*/

endtry

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

" 修改终端中显示的命令
set title

" 深色背景
set background=dark

" 状态栏 0 -> 不显示
" 1 -> 多窗口显示
" 2 -> 一直显示,每个窗口一个
" 3 -> 一直显示一个状态栏，而不是每个窗口一个
set laststatus=3

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

" <> 也可以匹配
set matchpairs+=<:>

try
  " 超过50行不显示更多差异
  set diffopt+=linematch:50
catch /.*/

endtry

try
  set inccommand=split

  " set completeopt
  set jumpoptions=stack

catch /.*/

endtry

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
set fileencoding=utf-8
" set fileencodings=utf-8
set fileencodings=utf-8,gbk,chinese,cp936,gb18030,utf-16le,utf-16,big5,euc-jp,euc-kr,latin-1

" 页面加速?
set ttyfast

" 搜索文件名的后缀
set suffixesadd=.js,.jsx,.ts,.tsx,.json,.vue,.css,.less,.scss

" 保存操作历史
set history=1000

" 设置undo的文件，关闭后重新打开还能够撤销
set undofile

" 检查临时文件是否存在
if has('nvim')
  call utils#checkDir(expand('~/.vim/.neo-backup'))
  call utils#checkDir(expand('~/.vim/.neo-swp'))
  call utils#checkDir(expand('~/.vim/.neo-undo'))
  set backupdir=~/.vim/.neo-backup//
  set directory=~/.vim/.neo-swp//
  set undodir=~/.vim/.neo-undo//

  " 页面相关的临时文件
  set viewdir=~/.vim/.neo-view

  if exists(':tnoremap')
    tnoremap <Esc> <C-\><C-n>
  endif
else
  call utils#checkDir(expand('~/.vim/.backup'))
  call utils#checkDir(expand('~/.vim/.swp'))
  call utils#checkDir(expand('~/.vim/.undo'))
  set backupdir=~/.vim/.backup//
  set directory=~/.vim/.swp//
  set undodir=~/.vim/.undo//

  " 页面相关的临时文件
  set viewdir=~/.vim/.view
endif



" 离开 Insert 模式时自动切换至英文输入法
" 现在是通过ssh连的，根本没法起作用
set noimdisable

" 设置为双字宽显示，否则无法完整显示如:☆
" 实际情况还是不要加这个比较合适
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

" 边界处左右光标可以移动到上下行
" set whichwrap=b,s,<,>,h

" 有类似游戏中的光标显示，但是感觉太骚了，不适合我
" 高亮当前行,下面有配置，插入模式不高亮
set cursorline
" 高亮当前列,下面有配置，插入模式不高亮
set nocursorcolumn

" 直接使用系统剪切板 需要安装vim-gtk
set clipboard=unnamedplus

" tab转space
set expandtab

" 合并多行时插入空格的行为
" set joinspaces

" 更智能
set smarttab

" 显示折叠的列宽度
" set foldcolumn=1

" 允许折叠
set foldenable

" 手动折叠
set foldmethod=indent

" 超过1000层自动折叠
set foldlevel=1000

" 智能缩进
set smartindent

" 支持鼠标操作
set mouse=

" tab宽度
set shiftwidth=2

" > < 调整缩进时 调整到 shiftwidth 的整数倍
" set shiftround

" 连续的space当成tab来看，可以同时删
set softtabstop=2

" \t的宽度
set tabstop=2

" 命令模式下,tab补全
set wildmenu

" 第一次显示列表，之后依次选下一个
" set wildmode=longest:list,full

" set list listchars=tab:\|\ ,trail:·,eol:¬,leadmultispace:---+,nbsp:⍽,extends:>,precedes:<

" 类似代码提示的形式显示
" 最多显示 10 条
set pumheight=10

" 忽略文件
set wildignore+=*.git/*,*.svn/*,*.DS_Store/*,*node_modules/*,*dist/*,*build/*,*target/*,*.dSYM/*

" 不限制单行最大列
set synmaxcol=0

" 换行之前加8个空格
" set showbreak=\ \ \ \ \ \ \ \

" 改变开始换行的方式
set linebreak

" 太长换行时锁进
" set breakindent
" set showbreak=\ \ \ \

" mksession 保存的状态
" 都保存，省的缺东西
set sessionoptions+=globals,blank,buffers,folds,help,localoptions,options,skiprtp,resize,tabpages,terminal,winpos,winsize

" view 状态只需要折叠和光标位置
" 一些选项和目录不需要记录
set viewoptions-=options
set viewoptions-=curdir
set viewoptions-=folds

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
" set lazyredraw
set nolazyredraw

" 不修改文件末空行的问题
set nofixendofline

" buffer 隐藏时直接删掉 buffer
" set bufhidden = 'delete'

" tab 切换时的行为
" set switchbuf = useopen,usetab,newtab,split
