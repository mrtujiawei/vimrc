-- echasnovski/mini.move
-- 
-- 代码移动
-- 
-- Maintainer: mrtujiawei <m15988803646@163.com>
-- Last Change: 2024-05-13

require('mini.move').setup({
  mappings = {
    left = '<S-Tab>',
    right = '<Tab>',
    down = '<C-j>',
    up = '<C-k>',

    line_left = '<S-Tab>',
    -- 终端会把 <C-i> 映射成 <Tab>
    -- line_right = '<Tab>',
    line_down = '<C-j>',
    line_up = '<C-k>',
  },
  options = {
    reindent_linewise = false,
  },
})
