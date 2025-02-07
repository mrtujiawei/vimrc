-- github/copilot.vim
-- 
-- copilot
-- 
-- Maintainer: mrtujiawei <m15988803646@163.com>
-- Last Change: 2025-02-07

vim.g.copilot_no_tab_map = true
vim.keymap.set('i', '<C-\\>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})
