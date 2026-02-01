local protocol = require('vim.lsp.protocol')
local cmp = require('blink.cmp')

local on_attach = function(client, bufnr)
  if client.name == 'rust-analyzer' then
    client.server_capabilities.semanticTokensProvider = nil
  end

  if client.name == 'yamlls' then
    client.server_capabilities.documentFormattingProvider = true
  end

  local opt = { noremap = true, silent = true }
  local function mapbuf(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  mapbuf('n', '<leader>ra', '<cmd>lua vim.lsp.buf.rename()<CR>', opt)
  mapbuf('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opt)
  mapbuf('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opt)
  mapbuf('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opt)
  mapbuf('n', 'gd', '<cmd>Glance definitions<CR>', opt)
  mapbuf('n', 'gi', '<cmd>Glance implementations<CR>', opt)
  mapbuf('n', 'gr', '<cmd>Glance references<CR>', opt)
  mapbuf('n', 'gt', '<cmd>Glance type_definitions<CR>', opt)
  mapbuf('n', 'go', '<cmd>lua vim.diagnostic.open_float()<CR>', opt)
  mapbuf('n', 'gk', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opt)
  mapbuf('n', 'gj', '<cmd>lua vim.diagnostic.goto_next()<CR>', opt)

  local cmd = '<cmd>lua require(\'conform\').format({ async = true, lsp_fallback = true })<CR>'
  mapbuf('n', '<leader>f', cmd, { noremap = true })

  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_augroup('DocumentHighlight', { clear = false })
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      group = 'DocumentHighlight',
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd('CursorMoved', {
      group = 'DocumentHighlight',
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end
end

local servers = { 'lua_ls', 'jsonls', 'taplo', 'lemminx', 'yamlls', 'clangd', 'html', 'cssls', 'pyright', 'ts_ls', 'dartls' }

for _, server in ipairs(servers) do
  vim.lsp.config(server, {
    on_attach = on_attach,
    capabilities = cmp.get_lsp_capabilities((function()
      local capabilities = protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      return capabilities
    end)())
  })

  vim.lsp.enable(server)
end

require('typescript-tools').setup({
  on_attach = on_attach
})

require('flutter-tools').setup({
  lsp = {
    on_attach = on_attach
  }
})

vim.g.rustaceanvim = {
  server = {
    on_attach = on_attach,
    default_settings = {
      ['rust-analyzer'] = {
        cargo = {
          -- target = 'x86_64-pc-windows-msvc'
        }
      }
    }
  }
}
