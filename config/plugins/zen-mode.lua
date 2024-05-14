-- folke/zen-mode.lua
-- 
-- 专注模式
-- 
-- Maintainer: mrtujiawei <m15988803646@163.com>
-- Last Change: 2024-05-14

require('zen-mode').setup({
  window = {
    width = .8,
    options = {
      signcolumn = 'no',
      number = false,
      relativenumber = false
    }
  },
  plugins = {
    options = {
      showcmd = false,
      laststatus = 0,
    },
  }
})
