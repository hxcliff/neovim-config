local treesitter = require('nvim-treesitter.configs')

treesitter.setup({
  ensure_installed = {
    'python', 'lua', 'java', 'rust', 'json', 'html', 'css', 'javascript', 'dart', 'yaml', 'toml', 'c_sharp', 'c', 'cpp',
    'markdown', 'markdown_inline', 'kotlin', 'zig'
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },
  indent = {
    enable = true
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = { query = '@class.inner', desc = 'Select inner part of a class region' },
        ['as'] = { query = '@scope', query_group = 'locals', desc = 'Select language scope' },
      },
      include_surrounding_whitespace = false
    },
    swap = {
      enable = true
    }
  }
})

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
