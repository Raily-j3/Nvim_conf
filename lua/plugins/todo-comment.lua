return {
  'folke/todo-comments.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    vim.keymap.set('n', ']t', function() require('todo-comments').jump_next() end, { desc = 'Next todo comment' })
    vim.keymap.set('n', '[t', function() require('todo-comments').jump_prev() end, { desc = 'Previous todo comment' })
    -- vim.keymap.set('n', '<leader>t', '<cmd>TodoTelescope<cr>', { desc = 'Previous todo comment' })
	vim.keymap.set('n', '<leader>t', function()
	  require("telescope").extensions["todo-comments"].todo({
		cwd = vim.fn.expand("%:p:h")
	  })
	end, { desc = 'Todo current directory' })

    require('todo-comments').setup()
  end,
}
