local notify = require('notify')

notify.setup({
  timeout = 100,
  render = "wrapped-compact",
  max_width = 30,
  fps = 60,
  on_open = function(win)
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_set_config(win, { border = 'single' })
    end
  end
})
