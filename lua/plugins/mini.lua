return {
  {
    'echasnovski/mini.ai',
    version = '*',
    dependencies = { 'echasnovski/mini.pairs', version = '*' },

    config = function()
      require('mini.ai').setup()
      require('mini.pairs').setup()
    end,
  },
}
