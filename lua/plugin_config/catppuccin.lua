local catppuccin = require('catppuccin');

catppuccin.setup({
  integrations = {
    cmp = true,
    treesitter = true,
    treesitter_context = true,
    fidget = true,
    flash = true,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },
    telescope = {
      enabled = true,
    }
  }
})
