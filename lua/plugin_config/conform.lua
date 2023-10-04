local conform = require('conform')

conform.setup({
  format_on_save = {
    timeout_ms = 100,
    lsp_fallback = true
  }
})
