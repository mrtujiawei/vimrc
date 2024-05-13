-- echasnovski/mini.move
-- 
-- 代码移动
-- 
-- Maintainer: mrtujiawei <m15988803646@163.com>
-- Last Change: 2024-05-13

require('mini.move').setup({
  mappings = {
    left = '<C-h>',
    right = '<C-l>',
    down = '<C-j>',
    up = '<C-k>',

    line_left = '<C-h>',
    line_right = '<C-l>',
    line_down = '<C-j>',
    line_up = '<C-k>',
  },
  options = {
    reindent_linewise = false,
  },
})
