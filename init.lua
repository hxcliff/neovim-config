if vim.g.neovide then
  vim.o.guifont = "JetBrains Mono:h16"
endif

require('basic')
require('keybindings')

require('plugins')
require('hop').setup()
require('plugin_config/lualine')
require('plugin_config/nvim-treesitter')
require('plugin_config/rust-tools')
require('plugin_config/flutter-tools')
require('plugin_config/nvim-cmp')
