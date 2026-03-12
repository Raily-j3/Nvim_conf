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
    { '<C-h>', '<cmd>TmuxNavigateLeft<cr>' },
    { '<C-j>', '<cmd>TmuxNavigateDown<cr>' },
    { '<C-k>', '<cmd>TmuxNavigateUp<cr>' },
    { '<C-l>', '<cmd>TmuxNavigateRight<cr>' },
    { '<C-\\>', '<cmd>TmuxNavigatePrevious<cr>' },
  },
}
