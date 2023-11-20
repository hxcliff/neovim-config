local barbecue = require('barbecue')

barbecue.setup({
  theme = 'catppuccin-mocha',
  create_autocmd = true,
  exclude_filetypes = { 'netrw', 'toggleterm' }
})
