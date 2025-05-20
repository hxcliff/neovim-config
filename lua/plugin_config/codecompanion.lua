local codecompanion = require('codecompanion')
local adapters = require('codecompanion.adapters')

codecompanion.setup({
  adapters = {
    openrouter = function()
      return adapters.extend('openai_compatible', {
        env = {
          api_key = vim.env.OPENROUTER,
          url = 'https://openrouter.ai/api',
          chat_url = '/v1/chat/completions'
        },
        schema = {
          model = {
            default = 'openai/gpt-4.1'
          }
        }
      })
    end
  },
  strategies = {
    chat = {
      adapter = 'openrouter'
    },
    inline = {
      adapter = 'openrouter'
    },
    cmd = {
      adapter = 'openrouter'
    }
  }
})
