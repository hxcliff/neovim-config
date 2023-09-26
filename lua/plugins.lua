require('lazy').setup({
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end
  },
  'nvim-lua/plenary.nvim',
  'nvim-tree/nvim-web-devicons',
  'MunifTanjim/nui.nvim',
  'nvim-lualine/lualine.nvim',
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },
  'nvim-treesitter/nvim-treesitter-textobjects',
  {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require('treesitter-context').setup({})
    end
  },
  'folke/flash.nvim',
  {
    'PHSix/faster.nvim',
    event = { 'VimEnter *' },
    config = function()
      vim.api.nvim_set_keymap('n', 'j', '<Plug>(faster_move_j)', { noremap = false, silent = true })
      vim.api.nvim_set_keymap('n', 'k', '<Plug>(faster_move_k)', { noremap = false, silent = true })
    end
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x'
  },
  {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup({}) end
  },
  'neovim/nvim-lspconfig',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'saadparwaiz1/cmp_luasnip',
  'L3MON4D3/LuaSnip',
  'rafamadriz/friendly-snippets',
  'onsails/lspkind-nvim',
  {
    'zbirenbaum/neodim',
    branch = 'v2',
    config = function()
      require('neodim').setup({
        alpha = 0.5,
        hide = {
          virtual_text = true,
          signs = false,
          underline = false,
        }
      })
    end
  },
  {
    'j-hui/fidget.nvim',
    tag = 'legacy',
    config = function()
      require('fidget').setup({})
    end
  },
  'lukas-reineke/indent-blankline.nvim',
  {
    'akinsho/bufferline.nvim',
    version = '*'
  },
  'famiu/bufdelete.nvim',
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup({})
    end
  },
  {
    'saecki/crates.nvim',
    tag = 'v0.3.0',
    config = function()
      require('crates').setup({})
    end
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x'
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({})
    end
  },
  'rcarriga/nvim-notify',
  {
    'folke/noice.nvim',
    event = 'VeryLazy'
  },
  'stevearc/dressing.nvim',
  {
    'utilyre/barbecue.nvim',
    name = 'barbecue',
    version = '*',
    dependencies = {
      'SmiteshP/nvim-navic'
    }
  }
})
