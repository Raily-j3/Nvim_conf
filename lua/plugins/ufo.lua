return {
  'kevinhwang91/nvim-ufo',
  dependencies = 'kevinhwang91/promise-async',
  event = 'VeryLazy',
  -- lazy = "disable",
  opts = {
    open_fold_hl_timeout = 400,
    close_fold_kinds_for_ft = {
      default = { 'imports', 'comment' },
      json = { 'array' },
    },
    preview = {
      win_config = {
        border = { '', '─', '', '', '', '─', '', '' },
        -- winhighlight = "Normal:Folded",
        winblend = 0,
      },
    },
  },
  init = function()
    vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
  end,
  config = function(_, opts)
    require('ufo').setup(opts)
    vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
    vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
  end,
}
