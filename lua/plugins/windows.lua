return {
  "anuvyklack/windows.nvim",
  dependencies = {
	"anuvyklack/middleclass",
	-- "anuvyklack/animation.nvim",
  },
  config = function()
	 vim.o.winwidth = 100
	 vim.o.winminwidth = 1
	 vim.o.equalalways = false
     require('windows').setup()
  end
}
