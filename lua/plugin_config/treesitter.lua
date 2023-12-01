local treesitter = require('nvim-treesitter.configs')

local parser = require('nvim-treesitter.parsers').get_parser_configs()
parser.dart = {
  install_info = {
    url = 'https://github.com/UserNobody14/tree-sitter-dart',
    files = { 'src/parser.c', 'src/scanner.c' },
    revision = '8aa8ab977647da2d4dcfb8c4726341bee26fbce4'
  }
}

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
