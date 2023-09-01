local bufferline = require('bufferline')

bufferline.setup({
  options = {
    mode = "tabs",
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
