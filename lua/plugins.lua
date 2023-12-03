require('lazy').setup({
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
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
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  'nvim-telescope/telescope-ui-select.nvim',
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({})
    end
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
    event = 'LspAttach',
    branch = 'v2'
  },
  {
    'j-hui/fidget.nvim'
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl'
  },
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons'
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
    tag = 'v0.4.0',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('crates').setup({})
    end
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim'
    }
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({})
    end
  },
  {
    'utilyre/barbecue.nvim',
    name = 'barbecue',
    version = '*',
    dependencies = {
      'SmiteshP/nvim-navic'
    }
  },
  'stevearc/conform.nvim',
  'mfussenegger/nvim-jdtls',
  {
    'zbirenbaum/copilot.lua',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },
  {
    'zbirenbaum/copilot-cmp',
    config = function()
      require('copilot_cmp').setup()
    end
  },
  {
    'DNLHC/glance.nvim',
    cmd = 'Glance',
    config = function()
      require('glance').setup({
        height = 20,
        detached = false,
        preview_win_opts = {
          number = false
        }
      })
    end
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' }
  },
  'gsuuon/llm.nvim'
})
