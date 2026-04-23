return {
  {
    'nvim-mini/mini.ai',
    version = false,
    dependencies = {
      { 'nvim-mini/mini.pairs', version = false },
      { 'nvim-mini/mini.comment', version = false },
      -- {'nvim-mini/mini.surround', version = false},
    },

    config = function()
      require('mini.ai').setup()
      require('mini.pairs').setup()
      require('mini.comment').setup{
		    -- Module mappings. Use `''` (empty string) to disable one.
		  mappings = {
			-- Toggle comment (like `gcip` - comment inner paragraph) for both
			-- Normal and Visual modes
			comment = '<leader>/',

			-- Toggle comment on current line
			comment_line = '<leader>/',

			-- Toggle comment on visual selection
			comment_visual = '<leader>/',

			-- Define 'comment' textobject (like `dgc` - delete whole comment block)
			-- Works also in Visual mode if mapping differs from `comment_visual`
			textobject = '<leader>/',
		  },
	  }

      -- require('mini.surround').setup()
    end,
  },
}
