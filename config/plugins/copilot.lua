-- github/copilot.vim
-- 
-- copilot
-- 
-- Maintainer: mrtujiawei <m15988803646@163.com>
-- Last Change: 2025-02-07

-- 关闭
-- vim.g.copilot_filetypes = {
--   ['*'] = false,
-- }

vim.g.copilot_no_tab_map = true
vim.keymap.set('i', '<C-\\>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})

vim.keymap.set('i', '<S-UP>', '<Plug>(copilot-previous)', {
  -- expr = true,
  replace_keycodes = false
})

vim.keymap.set('i', '<S-DOWN>', '<Plug>(copilot-next)', {
  -- expr = true,
  replace_keycodes = false
})
