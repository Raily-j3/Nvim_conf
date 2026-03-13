return {
  'mg979/vim-visual-multi',
  branch = 'master',
  init = function()
    vim.schedule(function()
    vim.g.VM_maps = {
      ['Goto Next'] = ']v',
      ['Goto Prev'] = '[v',
      ['I Return'] = '<S-CR>',
    }
    end)
  end,
}
