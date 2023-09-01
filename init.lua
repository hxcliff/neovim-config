local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('basic')
require('keybindings')

require('plugins')
require('plugin_config/flash')
require('plugin_config/telescope')
require('plugin_config/bufferline')
require('plugin_config/lualine')
require('plugin_config/treesitter')
require('plugin_config/blankline')
require('plugin_config/tree')
require('plugin_config/cmp')
require('plugin_config/lspconfig')
