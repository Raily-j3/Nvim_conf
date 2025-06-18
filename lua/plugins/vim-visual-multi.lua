return {
  'mg979/vim-visual-multi',
  branch = 'master',
  init = function()
    vim.g.VM_theme = 'nord'
    vim.g.VM_mouse_mappings = 1
    -- vim.schedule(function()
    vim.g.VM_maps = {
      ['I BS'] = '',
      ['Goto Next'] = ']v',
      ['Goto Prev'] = '[v',
      ['I CtrlB'] = '<M-b>',
      ['I CtrlF'] = '<M-f>',
      ['I Return'] = '<S-CR>',
      ['I Down Arrow'] = '',
      ['I Up Arrow'] = '',
    }
    -- end)
  end,
}
