local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')

mason.setup({})

mason_lspconfig.setup({
  automatic_enable = false,
  ensure_installed = { 'lua_ls', 'jsonls', 'taplo', 'yamlls', 'html', 'cssls', 'ts_ls', 'clangd', 'rust_analyzer' }
})
