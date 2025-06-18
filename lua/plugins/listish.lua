return {
  'arsham/listish.nvim',
  dependencies = {
    'arsham/arshlib.nvim',
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  config = {
    signs = false,
    loclist = {
      open = 'nil',
      on_cursor = 'nil',
      add_note = 'nil',
      clear = 'nil',
      close = 'nil',
      next = 'nil',
      prev = 'nil',
    },
    quickfix = {
      on_cursor = '<C-q>', -- add current position to the list
      add_note = '<leader>qn', -- add current position with your note to the list
    },
  },
}
