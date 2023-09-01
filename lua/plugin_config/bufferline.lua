local bufferline = require('bufferline')

bufferline.setup({
  options = {
    offsets = {
      {
        filetype = 'neo-tree',
        text = 'File Explorer',
        highlight = 'Directory',
        separator = true
      }
    }
  }
})
