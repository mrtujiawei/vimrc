" map相关的配置
" 
" Maintainer:   tujiawei <15988803646@163.com>
" Last Change:  2021 Nov 08

if exists('g:load_mine_map')
  finish
endif

let g:load_mine_map = 1

" 限制别人瞎搞我代码
noremap <Up>    <Nop>
noremap <Down>  <Nop>
noremap <Left>  <Nop>
noremap <Right> <Nop>

" 可视模式搜索
vnoremap <silent> * :<C-u>call utils#visualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call utils#visualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" " react 快速生成模板
" iabbr rcc import { memo,} from 'react';<CR><CR>
"       \const Comp = () => {
"       \<CR>return (<CR>null);
"       \};<CR><CR>
"       \export default memo(Comp);<Esc>/Comp<C-R>

" 修改 <Leader> 为空格
let mapleader=" "

" 使用这个是习惯有关
" 以前用 subline text 的时候就是这个快捷键
" nmap <silent> <leader>kb :NERDTreeToggle<CR>


" 好像没必要恢复原样
" let mapleader="\\"

" fzf 搜索
nmap <Leader><Space> :Files<CR>

" 新建tab编辑当前文件
" nmap <silent> <Leader>te :tabedit %<CR>

nmap <silent> <Leader>te :call OpenNewTab()<CR>

function OpenNewTab() abort
  if 1 == tabpagewinnr(tabpagenr(), '$')
    " tab中只有一个文件在编辑，那开什么新tab
    return
  endif

  if '' == expand('%')
    :tabedit
  else
    :tabedit %
  endif

  :tabprevious

  if 1 == tabpagewinnr(tabpagenr(), '$')
    " 当前tab中只有一个pane
    :q
  else
    :q
    :tabnext
  endif
endfunction

" tab 切换
nmap <silent> <Leader>tn :tabnext<CR>
nmap <silent> <Leader>tp :tabprevious<CR>

" 新建tab
nmap <silent> <Leader>tN :tabnew<CR>

" 关闭当前tab
nmap <silent> <Leader>tc :tabclose<CR>

" 只保留当前tab
nmap <silent> <Leader>to :tabonly<CR>

" 标签之间来回切换
let g:lastTab = 1
nmap <silent> <Leader>tt :exec "tabn ".g:lastTab<CR>
autocmd TabLeave * let g:lastTab = tabpagenr()

" 取消高亮
map <silent> <Leader>n :noh<CR>

" 关闭当前buffer
" map <leader>bd :Bclose<cr>:tabclose<cr>gT

" 关闭所有buffer
" map <leader>ba :bufdo bd<cr>

" buffer 切换
" map <leader>l :bnext<cr>
" map <leader>h :bprevious<cr>

" 切换到当前buffer所在的目录
" map <leader>cd :cd %:p:h<cr>:pwd<cr>

" 移除所有 '^M'
" windows => unix 会有可能出现
noremap <silent> <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" 预览markdown文件: markdown prevsious
noremap <Leader>mp :call utils#MarkdownPreview()<CR>

" 快速编辑，找到下一个 // TODO 并删除，进入插入模式
noremap <silent> <leader>i /\/\/ TODO<cr>:noh<cr>dd:noh<cr>O

" 快速开始一个会话
" 还没想好快捷键
" noremap <silent> <F5> :!tmux -c /home/tujiawei/github/package/packages/bin/src/shell/tmux-sessionizer.sh<CR>
