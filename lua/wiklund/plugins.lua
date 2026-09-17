return {
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'sindrets/diffview.nvim', -- optional - Diff integration

      -- Only one of these is needed.
      'nvim-telescope/telescope.nvim', -- optional
      'ibhagwan/fzf-lua', -- optional
      'echasnovski/mini.pick', -- optional
    },
    config = true,
  },
  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    'tpope/vim-sleuth',
  },
  {
    'stevearc/overseer.nvim',
    opts = {
      task_list = { direction = 'bottom', min_height = 15 },
    },
    keys = {
      { '<leader>ab', '<cmd>OverseerRun<cr>', desc = '[A]ndroid [B]uild menu' },
      { '<leader>at', '<cmd>OverseerToggle<cr>', desc = '[A]ndroid [T]ask list' },
      { '<leader>ao', '<cmd>OverseerQuickAction open output<cr>', desc = 'Task output' },
    },
  },
}
