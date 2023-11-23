" 我的vim插件配置
"
" Maintainer:   tujiawei <15988803646@163.com>
" Last Change:  2021 Nov 8

" 改为用 ssh 而不是 https
let g:plug_url_format = 'git@github.com:%s.git'

" 自动下载插件
if !filereadable(expand('~/.vim/autoload/plug.vim'))
  echo 'Installing vim-plug ...'
  call system('curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
endif

" 替换插件管理器
call plug#begin(expand('~/.vim/.bundle'))
  " 文件树
  Plug 'preservim/nerdtree'

  " git状态显示
  Plug 'Xuyuanp/nerdtree-git-plugin'

  " git冲突解决
  Plug 'rhysd/conflict-marker.vim'

  " emmet插件
  Plug 'mattn/emmet-vim'

  " css3
  Plug 'hail2u/vim-css3-syntax'

  " 颜色显示
  Plug 'ap/vim-css-color'

  " 括号匹配
  Plug 'jiangmiao/auto-pairs'

  " 代码补全框架
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }

  " jsx语法高亮
  Plug 'maxmellon/vim-jsx-pretty'

  " 状态栏 git 信息
  Plug 'airblade/vim-gitgutter'

  " git操作包
  Plug 'tpope/vim-fugitive'

  " a git commit browser
  Plug 'junegunn/gv.vim'

  " typescript语法高亮
  Plug 'leafgarland/typescript-vim'

  " 状态栏美化
  Plug 'vim-airline/vim-airline'

  " 状态栏美化
  Plug 'vim-airline/vim-airline-themes'

  " 多光标选中及编辑
  Plug 'mg979/vim-visual-multi'

  " markdown 预览
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

  " 搜索
  Plug 'junegunn/fzf'

  " fzf vim
  Plug 'junegunn/fzf.vim'

  " undo tree 每一步动作都可视化
  Plug 'simnalamburt/vim-mundo'

  " 缩进更明显
  Plug 'nathanaelkane/vim-indent-guides'

  " 书签显示
  Plug 'kshenoy/vim-signature'

  " 高亮
  Plug 'lfv89/vim-interestingwords'

  " 悬浮终端
  Plug 'voldikss/vim-floaterm'

  " 修改配色方案
  Plug 'tomasr/molokai'

  " 快速注释插件
  Plug 'preservim/nerdcommenter'

  " 快速生成jsdoc
  Plug 'heavenshell/vim-jsdoc', { 'do': 'make install', 'for': ['javascript', 'javascript.jsx','typescript'] }

  " 支持json注释
  Plug 'neoclide/jsonc.vim'

  " 包围匹配
  Plug 'tpope/vim-surround'

  " 计算导出的大小
  Plug 'yardnsm/vim-import-cost', { 'do': 'yarn install --production' }

  " 支持不存在的目录写入文件
  Plug 'pbrisbin/vim-mkdir'

  " liquid 语法高亮
  Plug 'tpope/vim-liquid'

  " ruby 语法
  Plug 'vim-ruby/vim-ruby',

  " <C-a> <C-x> 扩展
  Plug 'zef/vim-cycle'

  " 查找TODO
  Plug 'mrtujiawei/searchtasks.vim'

  " 头部注释
  Plug 'mrtujiawei/comment.vim'

  " session 管理
  Plug 'mrtujiawei/session.vim'

  " buffer 管理
  Plug 'mrtujiawei/buffer.vim'

  " 其他模块的行内编辑 挺好用的
  Plug 'AndrewRadev/inline_edit.vim'

  " 日历显示
  Plug 'mattn/calendar-vim'

  " 更好的 quickfix
  " Plug 'kevinhwang91/nvim-bqf'

  " copilot 包月太贵，我选择不用
  " Plug 'github/copilot.vim',

  " 代码大纲 ctags 来做的， 不支持 typescript
  " Plug 'preservim/tagbar',

  " 快速定位插件
  " Plug 'ctrlpvim/ctrlp.vim'

  " 对齐插件
  " Plug 'junegunn/vim-easy-align'

  " 开屏插件
  " Plug 'mhinz/vim-startify'

  " 搜索并替换
  " Plug 'brooth/far.vim'

  " 通用的代码补全
  " 顶上会显示文档，挺酷的，但是我其实用不到
  " Plug 'shougo/deoplete.nvim'

  " 代码格式化
  " Plug 'vim-autoformat/vim-autoformat'

  " 代码格式化
  " Plug 'sbdchd/neoformat'

  " 翻译
  " Plug 'voldikss/vim-translator',

  " 内容查找插件
  " grep.vim      https://github.com/yegappan/grep
  " ack.vim       https://github.com/mileszs/ack.vim
  " ctrlsf.vim    https://github.com/dyng/ctrlsf.vim
  " 代码片段
  " https://github.com/SirVer/ultisnips
  "
  " 画图
  " https://github.com/jbyuki/venn.nvim
  "
  " 命令行菜单渲染优化
  " https://github.com/gelguy/wilder.nvim
  "
  " vim 内部调试
  " https://github.com/puremourning/vimspector
  "
  " 单词加下划线
  " https://github.com/itchyny/vim-cursorword
call plug#end()
