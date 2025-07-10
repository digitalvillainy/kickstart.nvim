return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      config = {
        shortcut = {
          {
            desc = 'Files',
            group = 'DashboardShortCut',
            key = 'f',
            action = 'Telescope find_files',
          },
          {
            desc = 'Quit',
            group = 'DashboardShortCut',
            key = 'q',
            action = 'qa',
          },
        },
        packages = { enable = true },
        project = {
          enable = true,
          limit = 8,
          icon = '📁',
          label = 'Recent Projects:',
          action = function(path)
            return 'Telescope find_files cwd=' .. path
          end,
        },
        mru = {
          enable = true,
          limit = 10,
          icon = '🕘',
          label = 'Recent Files:',
          cwd_only = false,
        },
        footer = { 'Welcome to Neovim!' },
      },
    }
  end,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}

