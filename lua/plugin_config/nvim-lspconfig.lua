local lspconfig = require('lspconfig')

local on_attach = function(_, bufnr)
  local opt = { noremap = true, silent = true }
  local function mapbuf(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  -- mapbuf('n', ',r', '<cmd>lua vim.lsp.buf.rename()<CR>', opt)
  mapbuf('n', ',r', '<cmd>Lspsaga rename<CR>', opt)
  -- mapbuf('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opt)
  mapbuf('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opt)
  -- mapbuf('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
  mapbuf('n', 'gd', '<cmd>Lspsaga goto_definition<CR>', opt)
  -- mapbuf('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opt)
  mapbuf('n', 'gh', '<cmd>Lspsaga hover_doc<CR>', opt)
  -- mapbuf('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opt)
  mapbuf('n', 'gt', '<cmd>Lspsaga term_toggle<CR>', opt)
  -- mapbuf('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
  mapbuf('n', 'gi', '<cmd>Lspsaga finder imp<CR>', opt)
  mapbuf('n', 'gl', '<cmd>Lspsaga outline<CR>', opt)
  -- mapbuf('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opt)
  mapbuf('n', 'gr', '<cmd>Lspsaga finder ref<CR>', opt)
  -- mapbuf('n', 'go', '<cmd>lua vim.diagnostic.open_float()<CR>', opt)
  mapbuf('n', 'go', '<cmd>Lspsaga show_line_diagnostics<CR>', opt)
  -- mapbuf('n', 'gk', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opt)
  mapbuf('n', 'gk', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opt)
  -- mapbuf('n', 'gj', '<cmd>lua vim.diagnostic.goto_next()<CR>', opt)
  mapbuf('n', 'gj', '<cmd>Lspsaga diagnostic_jump_next<CR>', opt)
  mapbuf('n', '<leader>f', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', { noremap = true })
end

lspconfig.lua_ls.setup({
  on_attach = on_attach,
})

lspconfig.jsonls.setup({
  on_attach = on_attach,
})

lspconfig.tsserver.setup({
  on_attach = on_attach,
})

lspconfig.yamlls.setup({
  on_attach = on_attach,
})

lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
})
