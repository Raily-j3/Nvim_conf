return {
  'mg979/vim-visual-multi',

  config = function()
    vim.keymap.set('v', '<C-d>', '<Plug>(VM-Find-Subword-Under)')
    vim.keymap.set('n', '<C-d>', '<Plug>(VM-Find-Under)')
  end,
}
