local codecompanion = require('codecompanion')
local adapters = require('codecompanion.adapters')

codecompanion.setup({
  opts = {
    language = 'Chinese'
  },
  display = {
    chat = {
      window = {
        layout = 'float',
        width = 0.6
      }
    }
  },
  adapters = {
    http = {
      openrouter = function()
        return adapters.extend('openai_compatible', {
          env = {
            api_key = vim.env.OPENROUTER,
            url = 'https://openrouter.ai/api',
            chat_url = '/v1/chat/completions'
          },
          schema = {
            model = {
              default = 'anthropic/claude-4.5-sonnet'
            }
          }
        })
      end
    }
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
