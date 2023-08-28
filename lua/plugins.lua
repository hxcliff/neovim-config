return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }
  use 'nvim-lua/plenary.nvim'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true })() end
  }
  use({
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter'
  })
  use {
    'folke/flash.nvim'
  }
  use {
    'PHSix/faster.nvim',
    event = { 'VimEnter *' },
    config = function()
      vim.api.nvim_set_keymap('n', 'j', '<Plug>(faster_move_j)', { noremap = false, silent = true })
      vim.api.nvim_set_keymap('n', 'k', '<Plug>(faster_move_k)', { noremap = false, silent = true })
    end
  }
  use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x'
  }
  use {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup({}) end
  }
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'
  use 'onsails/lspkind-nvim'
  use {
    'zbirenbaum/neodim',
    after = 'nvim-lspconfig',
    branch = 'v2',
    config = function()
      require('neodim').setup({
        alpha = 0.5,
        hide = {
          virtual_text = true,
          signs = false,
          underline = false
        }
      })
    end
  }
  use {
    'j-hui/fidget.nvim',
    tag = "legacy",
    config = function()
      require('fidget').setup({
        window = {
          blend = 0
        }
      })
    end
  }
  use 'lukas-reineke/indent-blankline.nvim'
  use {
    'akinsho/bufferline.nvim',
    after = "catppuccin",
    tag = 'v3.*'
  }
  use {
    'akinsho/toggleterm.nvim',
    tag = '*',
    config = function()
      require('toggleterm').setup({})
    end
  }
  use {
    'saecki/crates.nvim',
    tag = 'v0.3.0',
    config = function()
      require('crates').setup()
    end,
  }
end)
