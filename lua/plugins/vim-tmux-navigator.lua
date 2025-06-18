return {
  'christoomey/vim-tmux-navigator',
  init = function()
    vim.g.tmux_navigator_no_mappings = 1 -- 禁用默认快捷键
  end,
  cmd = {
    'TmuxNavigateLeft',
    'TmuxNavigateDown',
    'TmuxNavigateUp',
    'TmuxNavigateRight',
    'TmuxNavigatePrevious',
    'TmuxNavigatorProcessList',
  },
  keys = {
    { '<A-h>', '<cmd>TmuxNavigateLeft<cr>' },
    { '<A-j>', '<cmd>TmuxNavigateDown<cr>' },
    { '<A-k>', '<cmd>TmuxNavigateUp<cr>' },
    { '<A-l>', '<cmd>TmuxNavigateRight<cr>' },
    { '<A-\\>', '<cmd>TmuxNavigatePrevious<cr>' },
  },
}
