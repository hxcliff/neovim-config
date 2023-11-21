local catppuccin = require('catppuccin')

catppuccin.setup({
  integrations = {
    fidget = true,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = true,
    },
    neotree = true,
    treesitter_context = true,
    telescope = {
      enabled = true,
      style = 'nvchad'
    }
  }
})

vim.cmd([[colorscheme catppuccin-mocha]])
