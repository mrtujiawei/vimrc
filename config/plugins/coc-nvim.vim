" neoclide/coc.nvim
"
" 代码补全系列插件
"
" Maintainer: mrtujiawei <m15988803646@163.com>
" Last Change: 2023-08-28

" let g:coc_borderchars = ['-', '|', '-', '|', ' ', ' ', ' ', ' ']

" 高亮关键字及其对应的声明和使用的地方
autocmd CursorHold * silent! call CocActionAsync('highlight')

" 不传递消息给 ins-completion-menu
set shortmess+=c

" coc 全局插件
" 没有安装会自动安装
" coc-cssmodules: react 中 css module 跳转
" coc-emmet: emmet是不是可以直接用这个了
" coc-html-css-support: 类和id提示
" @yaegassy/coc-nginx: nginx配置 代码提示
" coc-yaml: @see {https://github.com/neoclide/coc-yaml}
" coc-sh: shell脚本提示
" coc-prettier: 代码格式化的，基本不用
" coc-git: 写commit 信息的时候有点用，没啥用,需要neovim才能显示blame
" coc-vimlsp: vim 语法支持
" coc-yank: 粘贴列表
"
" coc-clangd: C/C++
" coc-cmake: C/C++
"
" coc-docker
" coc-python: python
"
" coc-vetur: vue2 代码提示 老版本
" @yaegassy/coc-volar: vue3 代码提示 新版本
" coc-tailwindcss: tailwindcss
" coc-rls: rust 已经不支持了
" coc-rust-analyzer: rust 最新的插件, 需要手动安装依赖 `brew install rust-analyzer`
" coc-htmldjango: django 模板补全用
let g:coc_global_extensions = [
  \ 'coc-git',
  \ 'coc-json',
  \ 'coc-tsserver',
  \ 'coc-html',
  \ 'coc-css', 'coc-cssmodules',
  \ 'coc-html-css-support',
  \ 'coc-eslint',
  \ '@yaegassy/coc-nginx',
  \ '@yaegassy/coc-volar',
  \ 'coc-sh',
  \ 'coc-prettier',
  \ 'coc-vimlsp',
  \ 'coc-yank',
  \ 'coc-docker',
  \ 'coc-python',
  \ 'coc-htmldjango',
  \ '@yaegassy/coc-tailwindcss3',
  \ 'coc-rust-analyzer',
  \ 'coc-clangd',
  \ 'coc-cmake',
  \ 'coc-java',
  \ 'coc-xml',
  \ 'coc-lua',
  \ 'coc-sumneko-lua',
  \ 'coc-svg'
  \ ]

" coc-sumneko-lua 修复 undefine-global 警告

nnoremap <silent> <leader>y  :<C-u>CocList -A --normal yank<cr>

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
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1) : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" 使用回车选中
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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
xmap <silent> <leader>f <Plug>(coc-format-selected)
nmap <silent> <leader>f <Plug>(coc-format-selected)

" 格式化整个文件
map <silent> <leader>F :call MyFormat()<Enter>

func MyFormat()
  let l:ft = &ft
  if l:ft == 'lua'
    normal gg=G``
  else
    exec ':Format'
  endif
endfunc

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
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

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
