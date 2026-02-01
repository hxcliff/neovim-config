local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')

mason.setup({})

mason_lspconfig.setup({
  automatic_enable = false,
  -- ensure_installed = { 'jdtls', 'lemminx', 'lua_ls', 'jsonls', 'taplo', 'yamlls', 'html', 'cssls', 'ts_ls', 'clangd', 'rust_analyzer', 'pyright' }
  ensure_installed = { 'jdtls', 'lua_ls', 'jsonls', 'taplo', 'yamlls', 'html', 'cssls', 'ts_ls', 'rust_analyzer', 'pyright' }
})
