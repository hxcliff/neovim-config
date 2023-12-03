local llm = require('llm')
local openai = require('llm.providers.openai')
local util = require('llm.util')

openai.initialize({
  model = 'gpt-3.5-turbo-1106',
  max_tokens = 1024,
  temperature = 0.2,
})

require('llm').setup({
  hl_group = 'Substitute',
  prompts = util.module.autoload('prompt_library'),
  default_prompt = {
    provider = openai,
    builder = function(input)
      return {
        temperature = 0.2,
        max_tokens = 1024,
        messages = {
          {
            role = 'system',
            content =
            'You are a 10x super elite programmer. Continue only with code. Do not write tests, examples, or output of code unless explicitly asked for.',
          },
          {
            role = 'user',
            content = input,
          }
        }
      }
    end
  }
})
