local jdtls = require('jdtls')

local on_attach = function(client, bufnr)
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
      callback = vim.lsp.buf.document_highlight
    })
    vim.api.nvim_create_autocmd('CursorMoved', {
      group = 'DocumentHighlight',
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references
    })
  end
end

local handlers = {}
handlers['language/status'] = function(_, _) end

local launcher_jar = vim.fn.glob(vim.fn.stdpath('data') .. '/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar')

jdtls.start_or_attach({
  handlers = handlers,
  settings = {
    java = {
      home = '/usr/lib/jvm/java-8-openjdk',
      configuration = {
        runtimes = {
          {
            name = 'JavaSE-1.8',
            path = '/usr/lib/jvm/java-8-openjdk'
          },
          {
            name = 'JavaSE-17',
            path = '/usr/lib/jvm/java-17-openjdk'
          },
          {
            name = 'JavaSE-21',
            path = '/usr/lib/jvm/java-21-openjdk'
          }
        }
      }
    }
  },
  on_attach = on_attach,
  cmd = {
    '/usr/lib/jvm/java-21-openjdk/bin/java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1G',
    '-javaagent:' .. vim.fn.expand('~/.config/nvim/ftplugin/lombok.jar'),
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar', launcher_jar,
    '-configuration',
    vim.fn.stdpath('data') .. '/mason/packages/jdtls/config_linux',
    '-data',
    vim.fn.expand('~/.cache/jdtls-workspace/') .. vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
  },
  root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1])
})
