local barbecue = require('barbecue')
local barbecue_ui = require('barbecue.ui')

barbecue.setup({
  create_autocmd = false
})

vim.opt.updatetime = 150

vim.api.nvim_create_autocmd({
  'WinScrolled',
  'BufWinEnter',
  'CursorHold',
  'InsertLeave',
  'BufModifiedSet',
}, {
  group = vim.api.nvim_create_augroup('barbecue.updater', {}),
  callback = function()
    barbecue_ui.update()
  end,
})
