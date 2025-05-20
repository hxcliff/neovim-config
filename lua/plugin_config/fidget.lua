local fidget = require('fidget')

fidget.setup({
  notification = {
    window = {
      winblend = 0
    }
  }
})

local handler
vim.api.nvim_create_autocmd({ 'User' }, {
  pattern = 'CodeCompanionRequest*',
  group = vim.api.nvim_create_augroup('CodeCompanionHooks', {}),
  callback = function(request)
    if request.match == 'CodeCompanionRequestStarted' then
      if handler then
        handler.message = 'Abort.'
        handler:cancel()
        handler = nil
      end

      handler = fidget.progress.handle.create({
        title = '',
        message = 'Thinking...',
        lsp_client = { name = 'CodeCompanion' },
      })
    elseif request.match == 'CodeCompanionRequestFinished' then
      if handler then
        handler.message = 'Done.'
        handler:finish()
        handler = nil
      end
    end
  end
})
