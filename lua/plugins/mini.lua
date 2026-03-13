return {
  {
	'nvim-mini/mini.ai',
	version = false,
    dependencies = {
			{'nvim-mini/mini.pairs', version = false},
			{'nvim-mini/mini.surround', version = false},
		},

    config = function()
      require('mini.ai').setup()
      require('mini.pairs').setup()
      require('mini.surround').setup()
    end,
  },
}
