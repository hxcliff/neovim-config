local barbecue = require('barbecue')

barbecue.setup({
  create_autocmd = true,
  exclude_filetypes = { 'netrw', 'toggleterm' }
})
